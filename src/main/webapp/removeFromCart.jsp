<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String idCarrito = request.getParameter("id_carrito");
    String message = "";

    if (idCarrito != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            String sql = "DELETE FROM tb_carrito WHERE id_carrito = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idCarrito));
            ps.executeUpdate();
            message = "Producto eliminado del carrito exitosamente.";
        } catch (SQLException e) {
            message = "Error al eliminar el producto del carrito: " + e.getMessage();
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
    <title>Eliminar del Carrito</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2><%= message %></h2>
            <p><a href="viewCart.jsp">Volver al Carrito</a></p>
            <p><a href="viewProductsClient.jsp">Continuar Comprando</a></p>
        </div>
    </div>
</body>
</html>
