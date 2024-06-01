<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String idPr = request.getParameter("id_pr");
    String message = "";

    if (idPr != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            String sql = "DELETE FROM tb_productoss WHERE id_pr = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idPr));
            ps.executeUpdate();
            message = "Producto eliminado exitosamente.";
        } catch (SQLException e) {
            message = "Error al eliminar el producto: " + e.getMessage();
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
    <title>Eliminar Producto</title>
    <link rel="stylesheet" href="./CSS/deleteProduct.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Eliminar Producto</h2>
            <form action="deleteProduct.jsp" method="POST">
                <label for="id_pr">ID del Producto:</label>
                <input type="number" id="id_pr" name="id_pr" required>
                <button type="submit">Eliminar</button>
            </form>
            <p><%= message %></p>
            <p><a href="vendedorDashboard.jsp">Volver al Dashboard</a></p>
        </div>
    </div>
</body>
</html>
