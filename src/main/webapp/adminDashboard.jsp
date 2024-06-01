<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
        <link rel="stylesheet" href="./CSS/adminDashboard.css">
</head>
<body>
    <header>
        <h1>AlexaStore</h1>
        <nav>
            <ul>
                <li><a href="registroUsuarios.jsp">Registro Usuarios</a></li>
                <li><a href="login.jsp">Cerrar Sesión</a></li>
            </ul>
        </nav>
    </header>
    
    <div id="content">
        <section>
            <h2>Registro de Usuarios</h2>
            <form action="registroUsuarios.jsp" method="post">
                <label>Nombres:</label>
                <input type="text" name="nombres" required><br>
                
                <label>Apellidos:</label>
                <input type="text" name="apellidos" required><br>
                
                <label>Correo Electrónico:</label>
                <input type="email" name="correo" required><br>
                
                <label>Perfil:</label>
                <select name="perfil">
                    <option value="vendedor">Vendedor</option>
                    <option value="administrador">Administrador</option>
                </select><br>
                
                <input type="submit" value="Registrar">
            </form>
        </section>
    </div>

    <footer>
        <ul>
            <li><a href="#">Facebook</a></li>
            <li><a href="#">Instagram</a></li>
            <li><a href="#">Twitter</a></li>
        </ul>
    </footer>
</body>
</html>
