<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    List<Integer> carrito = (List<Integer>) session.getAttribute("carrito");
    if (carrito == null) {
        carrito = new ArrayList<>();
    }

    String metodoPago = request.getParameter("metodo_pago");
    String numeroTarjeta = request.getParameter("numero_tarjeta");
    String fechaVencimiento = request.getParameter("fecha_vencimiento");
    String cvv = request.getParameter("cvv");
    String message = "";

    if (metodoPago != null && numeroTarjeta != null && fechaVencimiento != null && cvv != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            // Simulación de pago y actualización de stock en la base de datos
            for (Integer productId : carrito) {
                String sqlUpdate = "UPDATE tb_productoss SET cantidad_pr = cantidad_pr - 1 WHERE id_pr = ?";
                ps = conn.prepareStatement(sqlUpdate);
                ps.setInt(1, productId);
                ps.executeUpdate();
            }

            // Convertir la cadena de fecha de vencimiento a un objeto Date
            SimpleDateFormat sdf = new SimpleDateFormat("MM/yy");
            Date fechaVencimientoDate = sdf.parse(fechaVencimiento);

            // Guardar la tarjeta en la base de datos
            String sqlTarjeta = "INSERT INTO tb_tarjetas (numero_tarjeta, fecha_vencimiento, cvv) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sqlTarjeta);
            ps.setString(1, numeroTarjeta);
            ps.setDate(2, new java.sql.Date(fechaVencimientoDate.getTime())); // Utiliza setDate para el tipo de dato date en la base de datos
            ps.setString(3, cvv);
            ps.executeUpdate();

            message = "Compra realizada exitosamente.";
            carrito.clear();
        } catch (SQLException e) {
            message = "Error al procesar la compra: " + e.getMessage();
        } finally {
            Conexion.cerrarConexion(conn);
            if (ps != null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pagar</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Pagar</h2>
            <form action="pago.jsp" method="POST">
                <label for="metodo_pago">Método de Pago:</label>
                <select id="metodo_pago" name="metodo_pago" required>
                    <option value="Paypal">Paypal</option>
                    <option value="Banco Pichincha">Banco Pichincha</option>
                </select>

                <label for="numero_tarjeta">Número de Tarjeta:</label>
                <input type="text" id="numero_tarjeta" name="numero_tarjeta" required>

                <label for="fecha_vencimiento">Fecha de Vencimiento:</label>
                <input type="text" id="fecha_vencimiento" name="fecha_vencimiento" placeholder="MM/AA" required>

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" required>

                <button type="submit">Pagar</button>
            </form>
            <p><%= message %></p>
            <p><a href="clienteDashboard.jsp">Volver al Dashboard</a></p>
        </div>
    </div>
</body>
</html>
