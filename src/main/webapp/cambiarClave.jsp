<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cambio de Clave - AlexaStore</title>
    <!-- Aquí puedes agregar tus enlaces a las hojas de estilo CSS -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%
    HttpSession s = request.getSession();
    int id_usuario = (int) s.getAttribute("id_usuario");

    
        String claveAnterior = request.getParameter("claveAnterior");
        String claveNueva = request.getParameter("claveNueva");
        String confirmarClave = request.getParameter("confirmarClave");
        
        // Suponiendo que tienes una tabla en la base de datos llamada 'usuarios' con los campos 'id_usuario' y 'clave'
        // Además, supongamos que tienes una sesión de usuario y puedes obtener el 'id_usuario' del usuario actual
        
        // Lógica para validar la clave anterior y cambiar la clave nueva en la base de datos
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try {
            conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/bd_productos", "postgres", "1234");
            
            // Consulta para obtener la clave actual del usuario
            String sql = "SELECT clave FROM usuarios WHERE id_usuario = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id_usuario); // Aquí debes reemplazar 'id_usuario' con el ID del usuario actual obtenido de la sesión
            
            rs = pstmt.executeQuery();
            if (rs.next()) {
                String claveActual = rs.getString("clave");
                
                // Verifica si la clave anterior coincide
                if (!claveAnterior.equals(claveActual)) {
                    out.println("La clave anterior es incorrecta. Por favor, inténtalo de nuevo.");
                } else {
                    // Verifica si la clave nueva y la confirmación coinciden
                    if (!claveNueva.equals(confirmarClave)) {
                        out.println("La nueva clave y la confirmación de la clave no coinciden. Por favor, inténtalo de nuevo.");
                    } else {
                        // Actualiza la clave en la base de datos
                        sql = "UPDATE usuarios SET clave = ? WHERE id_usuario = ?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, claveNueva);
                        pstmt.setInt(2, id_usuario);
                        
                        int rowsAffected = pstmt.executeUpdate();
                        if (rowsAffected > 0) {
                            // La clave se ha cambiado correctamente
                            out.println("La clave se ha cambiado correctamente.");
                            // Redirige al usuario a la pantalla de inicio de sesión
                            response.sendRedirect("login.jsp");
                        } else {
                            out.println("No se pudo cambiar la clave. Por favor, inténtalo de nuevo.");
                        }
                    }
                }
            } else {
                out.println("Usuario no encontrado.");
            }
        } catch (SQLException e) {
            out.println("Error al cambiar la clave: " + e.getMessage());
        } finally {
            // Cierra las conexiones y los recursos
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>
