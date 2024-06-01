<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String idPr = request.getParameter("id_pr");
    String cantidad = request.getParameter("cantidad");
    String message = "";

    if (idPr != null && cantidad != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            String sql = "INSERT INTO tb_carrito (id_pr, cantidad) VALUES (?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idPr));
            ps.setInt(2, Integer.parseInt(cantidad));
            ps.executeUpdate();
            message = "Producto añadido al carrito exitosamente.";
        } catch (SQLException e) {
            message = "Error al añadir el producto al carrito: " + e.getMessage();
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
    <title>Añadir al Carrito</title>
    <link rel="stylesheet" href="./CSS/addToCart.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2><%= message %></h2>
            <p><a class="btn" href="viewProductsClient.jsp">Continuar Comprando</a></p>
            <p><a class="btn" href="viewCart.jsp">Ver Carrito</a></p>
        </div>
    </div>
</body>
</html>
