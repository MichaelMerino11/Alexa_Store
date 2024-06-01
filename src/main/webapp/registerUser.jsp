<%@ page import="java.sql.Connection,java.sql.PreparedStatement,java.sql.ResultSet,java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>
<%
    String nombres = request.getParameter("nombres");
    String apellidos = request.getParameter("apellidos");
    String correo = request.getParameter("correo");
    String idRol = request.getParameter("id_rol");
    String message = "";

    if (nombres != null && apellidos != null && correo != null && idRol != null) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.conectar();
            String sql = "INSERT INTO tb_usuarios (nombres, apellidos, correo, clave, id_rol) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, nombres);
            ps.setString(2, apellidos);
            ps.setString(3, correo);
            ps.setString(4, "654321");
            ps.setInt(5, Integer.parseInt(idRol));
            ps.executeUpdate();
            message = "Usuario registrado exitosamente.";
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
    <title>Registrar Usuario</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <header>
        <h1>AlexaStore</h1>
    </header>
    <nav>
        <ul>
            <li><a href="registerUser.jsp">Registro Usuarios</a></li>
            <li><a href="logout.jsp">Cerrar Sesión</a></li>
        </ul>
    </nav>
    <div id="content">
        <section>
            <article>
                <div class="login-card">
                    <h2>Registrar Usuario</h2>
                    <form action="registerUser.jsp" method="POST">
                        <label for="nombres">Nombres:</label>
                        <input type="text" id="nombres" name="nombres" required>

                        <label for="apellidos">Apellidos:</label>
                        <input type="text" id="apellidos" name="apellidos" required>

                        <label for="correo">Correo Electrónico:</label>
                        <input type="email" id="correo" name="correo" required>

                        <label for="id_rol">Perfil:</label>
                        <select id="id_rol" name="id_rol" required>
                            <option value="1">Administrador</option>
                            <option value="2">Vendedor</option>
                        </select>

                        <button type="submit">Guardar Usuario</button>
                    </form>
                    <p><%= message %></p>
                </div>
            </article>
        </section>
    </div>
    <footer>
        <a href="https://www.facebook.com">Facebook</a>
        <a href="https://www.instagram.com">Instagram</a>
        <a href="https://www.twitter.com">Twitter</a>
    </footer>
</body>
</html>
