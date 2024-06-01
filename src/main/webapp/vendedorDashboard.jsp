<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Vendedor Dashboard</title>
    <link rel="stylesheet" href="./CSS/vendedorDashboard.css">
</head>
<body>
    <div class="dashboard-container">
        <h1>Bienvenido, Vendedor</h1>
        <nav>
            <ul>
                <li><a href="addProduct.jsp">Agregar Producto</a></li>
                <li><a href="editProduct.jsp">Modificar Producto</a></li>
                <li><a href="deleteProduct.jsp">Eliminar Producto</a></li>
                <li><a href="viewProducts.jsp">Ver Productos</a></li>
            </ul>
        </nav>
        <button class="logout-btn"><a href="login.jsp">Cerrar sesión</a></button>
    </div>
</body>
</html>
