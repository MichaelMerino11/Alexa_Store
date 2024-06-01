<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String message = "";

    if (email != null && password != null) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = Conexion.conectar();
            String sql = "SELECT id_rol FROM tb_usuarios WHERE email = ? AND password = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();

            if (rs.next()) {
                int roleId = rs.getInt("id_rol");
                switch (roleId) {
                    case 1:
                        response.sendRedirect("adminDashboard.jsp");
                        break;
                    case 2:
                        response.sendRedirect("clienteDashboard.jsp");
                        break;
                    case 3:
                        response.sendRedirect("vendedorDashboard.jsp");
                        break;
                    default:
                        message = "Rol de usuario no válido.";
                        break;
                }
            } else {
                message = "Email o contraseña incorrectos.";
            }
        } catch (SQLException e) {
            message = "Error al iniciar sesión: " + e.getMessage();
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
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./CSS/login.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Iniciar Sesión</h2>
            <form action="login.jsp" method="POST">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required>
                
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                
                <button type="submit">Ingresar</button>
            </form>
            <p><%= message %></p>
            <p>¿No tienes una cuenta? <a href="register.jsp">Regístrate aquí</a></p>
        </div>

    </div>
</body>
</html>

