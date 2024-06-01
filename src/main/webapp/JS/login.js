/**
 * 
 */

document.getElementById('user-type').addEventListener('change', function () {
    var userType = this.value;
    var commonFields = document.getElementById('common-fields');

    // Reset form fields
    commonFields.innerHTML = '';

    // Add common fields
    commonFields.innerHTML += `
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>
        <label for="password">Contraseña:</label>
        <input type="password" id="password" name="password" required>
    `;

    // Add specific fields based on user type
    if (userType === 'admin') {
        // No additional fields for admin
    } else if (userType === 'cliente') {
        // Add cliente-specific fields
        commonFields.innerHTML += `
            <label for="address">Dirección:</label>
            <input type="text" id="address" name="address">
            <label for="phone">Teléfono:</label>
            <input type="text" id="phone" name="phone">
        `;
    } else if (userType === 'vendedor') {
        // Add vendedor-specific fields
        commonFields.innerHTML += `
            <label for="company">Empresa:</label>
            <input type="text" id="company" name="company">
        `;
    }
});
