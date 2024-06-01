<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.productos.datos.Conexion" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuarios</title>
</head>
<body>
    <%
        // Obtener los parámetros del formulario
        String nombres = request.getParameter("nombres");
        String apellidos = request.getParameter("apellidos");
        String correo = request.getParameter("correo");
        String perfil = request.getParameter("perfil");
        
        // Validar que los parámetros no sean null
        if (nombres != null && apellidos != null && correo != null && perfil != null) {
            // Crear la conexión a la base de datos
            Connection conexion = Conexion.conectar();
            
            // Insertar el nuevo usuario en la tabla tb_usuarios
            try {
                PreparedStatement statement = conexion.prepareStatement("INSERT INTO tb_usuarioss (nombres, apellidos, correo, perfil) VALUES (?, ?, ?, ?)");
                statement.setString(1, nombres);
                statement.setString(2, apellidos);
                statement.setString(3, correo);
                statement.setString(4, perfil);
                int filasInsertadas = statement.executeUpdate();
                if (filasInsertadas > 0) {
                    out.println("<h1>Usuario registrado correctamente.</h1>");
                } else {
                    out.println("<h1>Error al registrar usuario.</h1>");
                }
                statement.close();
            } catch (SQLException e) {
                out.println("<h1>Error al registrar usuario: " + e.getMessage() + "</h1>");
            }
            
            // Cerrar la conexión a la base de datos
            Conexion.cerrarConexion(conexion);
        } else {
            out.println("<h1>Uno o más parámetros son nulos.</h1>");
        }
    %>
</body>
</html>
