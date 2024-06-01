<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.sql.SQLException"%>
<%@ page import="com.productos.datos.*" %>
<%@ page import="java.sql.PreparedStatement"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Usuario</title>
    <link rel="stylesheet" type="text/css" href="./CSS/user.css">
</head>
<body>
	<%
	String id_us = request.getParameter("id_us");
	if (id_us != null) {

		System.out.print(id_us);
		Connection conn = Conexion.conectar();
		if (conn != null) {
			try {
		String sql = "SELECT * FROM tb_usuario WHERE id_us = ?";
		PreparedStatement statement = conn.prepareStatement(sql);
		statement.setInt(1, Integer.parseInt(id_us));
		ResultSet resultSet = statement.executeQuery();

		// Iterar sobre los resultados
		while (resultSet.next()) {
			// Obtener los valores de las columnas

			int idPer = resultSet.getInt("id_per");
			int idEst = resultSet.getInt("id_est");
			String nombre = resultSet.getString("nombre_us");
			String apellido = resultSet.getString("apellido_us");
			String cedula = resultSet.getString("cedula_us");
			String correo = resultSet.getString("correo_us");
			String clave = resultSet.getString("clave_us");

			System.out.print(nombre);
	%>

	<form id="formulario" action="ModificarPersona" method="post">
		<input type="hidden" id="idUsuario" name="idUsuario"
			value="<%=id_us%>"> <label for="nombre">Nombre:</label> <input
			type="text" id="nombre" name="nombre" value="<%=nombre%>"><br>
		<br> <label for="apellido">Apellido:</label> <input type="text"
			id="apellido" name="apellido" value="<%=apellido%>"><br>
		<br> <label for="cedula">Cédula:</label> <input type="text"
			id="cedula" name="cedula" value="<%=cedula%>"><br> <br>
		<label for="estadoCivil">Estado Civil:</label> <select
			id="estadoCivil" name="estadoCivil">
			<option value="">Seleccione...</option>
			<option value="1" <%=idEst == 1 ? "selected" : ""%>>Soltero</option>
			<option value="2" <%=idEst == 2 ? "selected" : ""%>>Casado</option>
		</select><br> <br> <label for="estadoCivil">Perfil:</label> <select
			id="perfil" name="perfil">
			<option value="">Seleccione...</option>
			<option value="1" <%=idPer == 1 ? "selected" : ""%>>Vendedor</option>
			<option value="2" <%=idPer == 2 ? "selected" : ""%>>Cliente</option>
			<option value="3" <%=idPer == 3 ? "selected" : ""%>>Invitado</option>
		</select><br> <br> <label for="correo">Correo Electrónico:</label> <input
			type="email" id="correo" name="correo" value="<%=correo%>"><br>
		<br> <label for="clave">Clave:</label> <input type="password"
			id="clave" name="clave" value="<%=clave%>"><br> <br>
		<input type="submit" value="Modificar">
	</form>
	<button>
		<a href="login.jsp">Cancelar</a>
	</button>
	<%
	// Aquí puedes hacer lo que necesites con los valores obtenidos
	}
	} catch (SQLException e) {
	e.printStackTrace();
	System.out.println("Hubo un error");
	}
	}
	} else {
	%>
	<h2>Ingresar nuevo usuario</h2>
	<form id="formulario" action="ProcesarRegistroServlet" method="post">
		<label for="nombre">Nombre:</label> <input type="text" id="nombre"
			name="nombre"><br> <br> <label for="apellido">Apellido:</label>
		<input type="text" id="apellido" name="apellido"><br> <br>
		<label for="cedula">Cédula:</label> <input type="text" id="cedula"
			name="cedula"><br> <br> <label for="estadoCivil">Estado
			Civil:</label> <select id="estadoCivil" name="estadoCivil">
			<option value="">Seleccione...</option>
			<option value="1">Soltero</option>
			<option value="2">Casado</option>
		</select><br> <br> <label for="estadoCivil">Perfil:</label> <select
			id="perfil" name="perfil">
			<option value="">Seleccione...</option>
			<option value="1">Vendedor</option>
			<option value="2">Cliente</option>
			<option value="3">Invitado</option>
		</select><br> <br> <label for="correo">Correo Electrónico:</label> <input
			type="email" id="correo" name="correo"><br> <br> <label
			for="clave">Clave:</label> <input type="password" id="clave"
			name="clave"><br> <br> <input type="submit"
			value="Registrar">
	</form>
	<button>
		<a href="login.jsp">Cancelar</a>
	</button>
	<%
	}
	%>

</body>
</html>