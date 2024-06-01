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
    <title>Ver Productos</title>
    <link rel="stylesheet" href="./CSS/viewProducts.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Productos Disponibles</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Categoría</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            conn = Conexion.conectar();
                            String sql = "SELECT * FROM tb_productoss";
                            ps = conn.prepareStatement(sql);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                int idPr = rs.getInt("id_pr");
                                int idCat = rs.getInt("id_cat");
                                String nombrePr = rs.getString("nombre_pr");
                                int cantidadPr = rs.getInt("cantidad_pr");
                                double precioPr = rs.getDouble("precio_pr");
                    %>
                    <tr>
                        <td><%= idPr %></td>
                        <td><%= idCat %></td>
                        <td><%= nombrePr %></td>
                        <td><%= cantidadPr %></td>
                        <td><%= precioPr %></td>
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
            <p><a href="vendedorDashboard.jsp">Volver al Dashboard</a></p>
        </div>
    </div>
</body>
</html>
