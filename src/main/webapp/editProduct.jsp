<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String idPr = request.getParameter("id_pr");
    String nombrePr = request.getParameter("nombre_pr");
    String idCat = request.getParameter("id_cat");
    String cantidadPr = request.getParameter("cantidad_pr");
    String precioPr = request.getParameter("precio_pr");
    String message = "";

    if (idPr != null && nombrePr != null && idCat != null && cantidadPr != null && precioPr != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            String sql = "UPDATE tb_productoss SET id_cat = ?, nombre_pr = ?, cantidad_pr = ?, precio_pr = ? WHERE id_pr = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idCat));
            ps.setString(2, nombrePr);
            ps.setInt(3, Integer.parseInt(cantidadPr));
            ps.setDouble(4, Double.parseDouble(precioPr));
            ps.setInt(5, Integer.parseInt(idPr));
            ps.executeUpdate();
            message = "Producto actualizado exitosamente.";
        } catch (SQLException e) {
            message = "Error al actualizar el producto: " + e.getMessage();
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
    <title>Editar Producto</title>
    <link rel="stylesheet" href="./CSS/editProduct.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Editar Producto</h2>
            <form action="editProduct.jsp" method="POST">
                <label for="id_pr">ID del Producto:</label>
                <input type="number" id="id_pr" name="id_pr" required>

                <label for="id_cat">Categoría:</label>
                <input type="number" id="id_cat" name="id_cat" required>

                <label for="nombre_pr">Nombre del Producto:</label>
                <input type="text" id="nombre_pr" name="nombre_pr" required>

                <label for="cantidad_pr">Cantidad:</label>
                <input type="number" id="cantidad_pr" name="cantidad_pr" required>

                <label for="precio_pr">Precio:</label>
                <input type="number" step="0.01" id="precio_pr" name="precio_pr" required>

                <button type="submit">Actualizar</button>
            </form>
            <p><%= message %></p>
            <p><a href="vendedorDashboard.jsp">Volver al Dashboard</a></p>
        </div>
    </div>
</body>
</html>
