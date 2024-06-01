<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.productos.datos.*" %>

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
        
        // Hash de la contraseña por defecto (654321)
        String hashedPassword = "654321";
        
        // Conexión a la base de datos
        Connection conexion = null;
        PreparedStatement statement = null;
        
        try {
            // Establecer conexión
            conexion = Conexion.conectar();
            
            // Preparar la consulta SQL para insertar un nuevo usuario
            String query = "INSERT INTO tb_usuarios (nombres, apellidos, correo, perfil, contraseña) VALUES (?, ?, ?, ?, ?)";
            statement = conexion.prepareStatement(query);
            statement.setString(1, nombres);
            statement.setString(2, apellidos);
            statement.setString(3, correo);
            statement.setString(4, perfil);
            statement.setString(5, hashedPassword);
            
            // Ejecutar la consulta
            int filasInsertadas = statement.executeUpdate();
            
            if (filasInsertadas > 0) {
                // Registro exitoso
                out.println("<h1>Usuario registrado exitosamente.</h1>");
            } else {
                // Error en el registro
                out.println("<h1>Error al registrar usuario.</h1>");
            }
        } catch (SQLException e) {
            out.println("<h1>Error al conectar a la base de datos: " + e.getMessage() + "</h1>");
        } finally {
            // Cerrar conexión
            Conexion.cerrarConexion(conexion);
        }
    %>
</body>
</html>
