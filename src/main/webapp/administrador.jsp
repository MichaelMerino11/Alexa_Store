<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.productos.datos.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfil Administrador</title>
<link rel="stylesheet" type="text/css" href="./CSS/login.css">
<script src="./JS/validaciones.js"></script>
</head>
<body>
	<button>
		<a href="user.jsp">Agregar</a>
	</button>
	<h2>Usuarios Registrados</h2>
	<table class="tabla" border="1">
		<tr>
			<th>Id Usuario</th>
			<th>Perfil</th>
			<th>Estado civil</th>
			<th>Nombre</th>
			<th>Apellido</th>
			<th>Cédula</th>
			<th>Correo electrónico</th>
			<th>Clave</th>
			<th>Opciones</th>
		</tr>
		<%
		// Aquí recuperamos los datos de la base de datos y los mostramos en la tabla
		Connection conn = Conexion.conectar();
		if (conn != null) {
			try {
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM tb_usuario");
				while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("id_us")%></td>
			<td><%=rs.getInt("id_per")%></td>
			<td><%=rs.getInt("id_est")%></td>
			<td><%=rs.getString("nombre_us")%></td>
			<td><%=rs.getString("apellido_us")%></td>
			<td><%=rs.getString("cedula_us")%></td>
			<td><%=rs.getString("correo_us")%></td>
			<td><%=rs.getString("clave_us")%></td>
			<td>
				<button>
					<a href="user.jsp?id_us=<%=rs.getInt("id_us")%>">Modificar</a>
				</button>
				<form action="EliminarUsuario" method="post">
					<input type="hidden" name="accion" value="eliminar"> <input
						type="hidden" name="idUsuario" value="<%=rs.getInt("id_us")%>">
					<button class="boton_tabla">Eliminar</button>
				</form>
			</td>
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
	<button>
		<a href="index.jsp">Cancelar</a>
	</button>
</body>
</html>