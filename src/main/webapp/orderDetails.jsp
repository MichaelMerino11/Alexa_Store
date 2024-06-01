<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String idPedido = request.getParameter("id_pedido");
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Suponemos que el ID del cliente está almacenado en la sesión
    Integer idCliente = (Integer) session.getAttribute("idCliente");
    if (idCliente == null) {
        response.sendRedirect("login.jsp"); // Redirige al login si no está autenticado
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Detalles del Pedido</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Detalles del Pedido</h2>
            <table>
                <thead>
                    <tr>
                        <th>ID Producto</th>
                        <th>Nombre</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        try {
                            conn = Conexion.conectar();
                            String sql = "SELECT p.id_pr, p.nombre_pr, dp.cantidad, dp.precio " +
                                         "FROM tb_detalle_pedidos dp " +
                                         "JOIN tb_productoss p ON dp.id_pr = p.id_pr " +
                                         "WHERE dp.id_pedido = ?";
                            ps = conn.prepareStatement(sql);
                            ps.setInt(1, Integer.parseInt(idPedido));
                            rs = ps.executeQuery();

                            while (rs.next()) {
                                int idPr = rs.getInt("id_pr");
                                String nombrePr = rs.getString("nombre_pr");
                                int cantidad = rs.getInt("cantidad");
                                double precio = rs.getDouble("precio");
                    %>
                    <tr>
                        <td><%= idPr %></td>
                        <td><%= nombrePr %></td>
                        <td><%= cantidad %></td>
                        <td><%= precio %></td>
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
            <p><a href="viewOrders.jsp">Volver a Pedidos</a></p>
        </div>
    </div>
</body>
</html>
