<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    int idCl = (Integer) session.getAttribute("id_cl");  // Assuming client ID is stored in session
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mis Pedidos</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Mis Pedidos</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID Pedido</th>
                        <th>Fecha</th>
                        <th>Total</th>
                        <th>Estado</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            conn = Conexion.conectar();
                            String sql = "SELECT * FROM tb_pedidos WHERE id_cl = ?";
                            ps = conn.prepareStatement(sql);
                            ps.setInt(1, idCl);
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                int idPedido = rs.getInt("id_pedido");
                                String fechaPedido = rs.getString("fecha_pedido");
                                double totalPedido = rs.getDouble("total_pedido");
                                String estadoPedido = rs.getString("estado_pedido");
                    %>
                    <tr>
                        <td><%= idPedido %></td>
                        <td><%= fechaPedido %></td>
                        <td><%= totalPedido %></td>
                        <td><%= estadoPedido %></td>
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
            <p><a href="clienteDashboard.jsp">Volver al Dashboard</a></p>
        </div>
    </div>
</body>
</html>
