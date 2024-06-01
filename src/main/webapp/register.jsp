<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String userType = request.getParameter("userType");
    String message = "";

    if (email != null && password != null && userType != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            String sql = "INSERT INTO tb_usuarios (email, password, id_rol) VALUES (?, ?, (SELECT id_rol FROM tb_roles WHERE nombre_rol = ?))";
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, userType);
            ps.executeUpdate();
            message = "Registro exitoso. Por favor, inicie sesión.";
        } catch (SQLException e) {
            message = "Error al registrar el usuario: " + e.getMessage();
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
    <title>Registro</title>
    <link rel="stylesheet" href="./CSS/register.css">
</head>
<body>
    <div class="login-container">
        <div class="login-card">
            <h2>Registro</h2>
            <form id="register-form" action="register.jsp" method="POST">
                <label for="user-type">Tipo de Usuario:</label>
                <select id="user-type" name="userType" required>
                    <option value="">Seleccione...</option>
                    <option value="admin">Administrador</option>
                    <option value="cliente">Cliente</option>
                    <option value="vendedor">Vendedor</option>
                </select>

                <div id="common-fields">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>

                    <label for="password">Contraseña:</label>
                    <input type="password" id="password" name="password" required>

                    <label for="confirm-password">Confirmar Contraseña:</label>
                    <input type="password" id="confirm-password" name="confirmPassword" required>
                </div>

                <button type="submit">Registrar</button>
            </form>
            <p><%= message %></p>
            <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
        </div>
    </div>
</body>
</html>