<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.productos.datos.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Consulta de Productos</title>
    <link rel="stylesheet" type="text/css" href="./CSS/registrarProducto.css">
    <script>
        function restablecerFormulario() {
            document.getElementById("formulario").reset();
        }
    </script>
</head>
<body>
<nav>
    <ul>
        <li><a href="index.jsp">Inicio</a></li>
        <li><a href="login.jsp">Login</a></li>
        <li><a href="productos.jsp">Productos</a></li>
    </ul>
</nav>
<div class="container">
	<div class="form_container">
		    <form class="formulario" id="formulario" action="ProcesarFormularioServlet" method="get" enctype="multipart/form-data">
        <label for="codigo">Código:</label>
        <input type="text" id="codigo" name="codigo"><br><br>

        <label for="categoria">Categoría:</label>
        <select id="categoria" name="categoria">
            <option value="1">Electrodomésticos</option>
            <option value="2">Tecnología</option>
            <option value="3">Ropa</option>
        </select><br><br>

        <label for="nombre">Nombre del Producto:</label>
        <input type="text" id="nombre" name="nombre"><br><br>

        <label for="cantidad">Cantidad:</label>
        <input type="number" id="cantidad" name="cantidad"><br><br>

        <label for="precio">Precio:</label>
        <input type="number" id="precio" name="precio" step="0.01"><br><br>

        <label for="imagen">Imagen del Producto:</label>
        <input type="file" id="imagen" name="imagen"><br><br>

        <div class="buttons">
            <input type="submit" value="Enviar Consulta">
            <input type="button" value="Restablecer" onclick="restablecerFormulario()" class="reset-button">
        </div>
    </form>	
	</div>
	<div class="table_container">
		    <h2>Productos Registrados</h2>
    <table class="tabla" border="1">
        <tr>
            <th>Código</th>
            <th>Categoría</th>
            <th>Nombre</th>
            <th>Cantidad</th>
            <th>Precio</th>
            <th>Imagen</th>
        </tr>
        <% 
            // Aquí recuperamos los datos de la base de datos y los mostramos en la tabla
            Connection conn = Conexion.conectar();
            if (conn != null) {
                try {
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM tb_producto");
                    while (rs.next()) {
        %>
                        <tr>
                            <td><%= rs.getInt("id_pr") %></td>
                            <td><%= rs.getInt("id_cat") %></td>
                            <td><%= rs.getString("nombre_pr") %></td>
                            <td><%= rs.getInt("cantidad_pr") %></td>
                            <td><%= rs.getDouble("precio_pr") %></td>
                            <td><img src='https://w7.pngwing.com/pngs/59/955/png-transparent-f-c-barcelona-logo-fc-barcelona-handbol-uefa-champions-league-la-liga-fc-barcelona-logo-text-logo-area.png' width='50px'/></td>
                        </tr>
        <% 
                    }
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
	</div>
</div>

</body>
</html>

