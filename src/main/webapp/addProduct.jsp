<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.SQLException" %>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.Conexion" %>
<%
    String nombrePr = request.getParameter("nombre_pr");
    String idCat = request.getParameter("id_cat");
    String cantidadPr = request.getParameter("cantidad_pr");
    String precioPr = request.getParameter("precio_pr");
    String message = "";

    if (nombrePr != null && idCat != null && cantidadPr != null && precioPr != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            String sql = "INSERT INTO tb_productoss (id_cat, nombre_pr, cantidad_pr, precio_pr) VALUES (?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(idCat));
            ps.setString(2, nombrePr);
            ps.setInt(3, Integer.parseInt(cantidadPr));
            ps.setDouble(4, Double.parseDouble(precioPr));
            ps.executeUpdate();
            message = "Producto agregado exitosamente.";
        } catch (SQLException e) {
            message = "Error al agregar el producto: " + e.getMessage();
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
    <title>Agregar Producto</title>
    <link rel="stylesheet" href="./CSS/addProduct.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Agregar Producto</h2>
            <form action="addProduct.jsp" method="POST">
                <label for="id_cat">Categoría:</label>
                <select name="id_cat"  id="id_cat">
                <%
                Connection conn = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                        try {
                            conn = Conexion.conectar();
                            String sql = "SELECT * FROM tb_categoria";
                            ps = conn.prepareStatement(sql);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                int id = rs.getInt("id_cat");
                                String descripcion_cat = rs.getString("descripcion_cat");
                                out.println("<option value='" + id + "'>" + descripcion_cat + "</option>");
                
                            }
                        } catch (SQLException e) {
                            e.printStackTrace();
                        } finally {
                            Conexion.cerrarConexion(conn);
                        }
				%>
				</select>
                

                <label for="nombre_pr">Nombre del Producto:</label>
                <input type="text" id="nombre_pr" name="nombre_pr" required>

                <label for="cantidad_pr">Cantidad:</label>
                <input type="number" id="cantidad_pr" name="cantidad_pr" required>

                <label for="precio_pr">Precio:</label>
                <input type="number" step="0.01" id="precio_pr" name="precio_pr" required>

                <button type="submit">Agregar</button>
            </form>
            <p><%= message %></p>
            <p><a href="vendedorDashboard.jsp">Volver al Dashboard</a></p>
        </div>
    </div>
</body>
</html>
