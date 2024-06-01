<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String message = "";

    // Verificar si el formulario ha sido enviado
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String cardNumber = request.getParameter("cardNumber");
        String cardHolder = request.getParameter("cardHolder");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");

        // Validar datos ficticios (simple validación de longitud)
        if (cardNumber != null && cardNumber.length() == 16 &&
            cardHolder != null && !cardHolder.isEmpty() &&
            expiryDate != null && expiryDate.matches("\\d{2}/\\d{2}") &&
            cvv != null && cvv.length() == 3) {
            message = "Compra realizada exitosamente.";
        } else {
            message = "Error: Datos de la tarjeta no válidos.";
        }
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout</title>
    <link rel="stylesheet" href="./CSS/checkout.css">
</head>
<body>
    <div class="container">
        <div class="card">
            <h2>Formulario de Compra</h2>
            <form method="POST" action="checkout.jsp">
                <label for="cardNumber">Número de Tarjeta:</label>
                <input type="text" id="cardNumber" name="cardNumber" required pattern="\d{16}" title="Debe contener 16 dígitos" placeholder="Ej: 1234567890123456">

                <label for="cardHolder">Nombre del Titular:</label>
                <input type="text" id="cardHolder" name="cardHolder" required placeholder="Ej: Juan Pérez">

                <label for="expiryDate">Fecha de Expiración (MM/AA):</label>
                <input type="text" id="expiryDate" name="expiryDate" required pattern="\d{2}/\d{2}" title="Formato MM/AA" placeholder="Ej: 12/24">

                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" required pattern="\d{3}" title="Debe contener 3 dígitos" placeholder="Ej: 123">

                <button type="submit">Realizar Compra</button>
            </form>
            <h2><%= message %></h2>
        </div>
            <button><a href="login.jsp">Regresar al login</a></button>
    </div>
</body>
</html>
