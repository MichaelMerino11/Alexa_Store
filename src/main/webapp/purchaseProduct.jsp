<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    int idPr = Integer.parseInt(request.getParameter("id_pr"));
    Integer idCliente = (Integer) session.getAttribute("idCliente");

    if (idCliente == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement ps = null;

    try {
        conn = Conexion.conectar();
        if (conn != null) {
            String sql = "INSERT INTO tb_pedidos (id_cliente, id_producto, cantidad) VALUES (?, ?, 1)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idCliente);
            ps.setInt(2, idPr);
            ps.executeUpdate();

            sql = "UPDATE tb_productoss SET cantidad_pr = cantidad_pr - 1 WHERE id_pr = ?";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idPr);
            ps.executeUpdate();

            response.sendRedirect("factura.jsp");
        } else {
            out.println("Error al conectar con la base de datos.");
        }
    } catch (SQLException e) {
        out.println("Error SQL: " + e.getMessage());
    } finally {
        if (ps != null) {
            try {
                ps.close();
            } catch (SQLException e) {
                out.println("Error al cerrar PreparedStatement: " + e.getMessage());
            }
        }
        Conexion.cerrarConexion(conn);
    }
%>
s