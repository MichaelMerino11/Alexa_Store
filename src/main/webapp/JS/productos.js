document.getElementById('product-form').addEventListener('submit', function(event) {
    event.preventDefault();
    const cantidad = parseInt(document.getElementById('cantidad1').value, 10);
    const cartCount = document.getElementById('cart-count');
    cartCount.textContent = parseInt(cartCount.textContent, 10) + cantidad;
});
