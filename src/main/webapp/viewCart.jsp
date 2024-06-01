<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ver Carrito</title>
    <link rel="stylesheet" href="./CSS/viewCart.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Carrito de Compras</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Subtotal</th>
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        double total = 0.0;
                        try {
                            conn = Conexion.conectar();
                            String sql = "SELECT c.id_carrito, p.nombre_pr, c.cantidad, p.precio_pr FROM tb_carrito c INNER JOIN tb_productoss p ON c.id_pr = p.id_pr";
                            ps = conn.prepareStatement(sql);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                int idCarrito = rs.getInt("id_carrito");
                                String nombrePr = rs.getString("nombre_pr");
                                int cantidad = rs.getInt("cantidad");
                                double precio = rs.getDouble("precio_pr");
                                double subtotal = cantidad * precio;
                                total += subtotal;
                    %>
                    <tr>
                        <td><%= idCarrito %></td>
                        <td><%= nombrePr %></td>
                        <td><%= cantidad %></td>
                        <td><%= precio %></td>
                        <td><%= subtotal %></td>
                        <td>
                            <form action="removeFromCart.jsp" method="post">
                                <input type="hidden" name="id_carrito" value="<%= idCarrito %>">
                                <button type="submit">Eliminar</button>
                            </form>
                        </td>
                    </tr>
                    <%
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            Conexion.cerrarConexion(conn);
                            if (ps != null) {
                                try {
                                    ps.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                            if (rs != null) {
                                try {
                                    rs.close();
                                } catch (SQLException e) {
                                    e.printStackTrace();
                                }
                            }
                        }
                    %>
                </tbody>
            </table>
            <h3>Total: <%= total %></h3>
            <p><a href="checkout.jsp">Proceder al Pago</a></p>
            <p><a href="clienteDashboard.jsp">Volver al Dashboard</a></p>
        </div>
    </div>
</body>
</html>
