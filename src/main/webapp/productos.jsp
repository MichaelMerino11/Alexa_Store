<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pantalla de Venta de Productos</title>
    <link rel="stylesheet" href="./CSS/productos.css">
</head>
<body>
    <div class="container">
        <h1>Pantalla de Venta de Productos</h1>
        <div class="cart">
            <img src="./Imagenes/carshop.png" alt="Carrito de Compras" id="carrito">
            <span id="cart-count">0</span>
        </div>
        <form id="product-form" action="procesarVenta.jsp" method="post">
            <div class="product">
                <label for="producto1">Producto</label>
                <select id="producto1" name="producto1">
                    <option value="producto1">Chocolate - $10</option>
                    <option value="producto2">Platano - $20</option>
                    <option value="producto3">Manzana - $30</option>
                </select>
            </div>
            <div class="product">
                <label for="cantidad1">Cantidad</label>
                <input type="number" id="cantidad1" name="cantidad1" min="1" max="10">
            </div>
            <div class="actions">
                <button type="submit">Procesar Venta</button>
            </div>
        </form>
    </div>

    <script src="./JS/productos.js"></script>
</body>
</html>
