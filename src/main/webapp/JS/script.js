/**
 * 
 */

 // mostrar productos al seleccionar una categoria

function filterProducts(category) {
  const allProducts = document.querySelectorAll(".col-md-4");
  allProducts.forEach((product) => {
    if (product.classList.contains(category)) {
      product.style.display = "block";
    } else {
      product.style.display = "none";
    }
  });
}

// barra de busqueda

var nombresProductos = [
  "Echo Dot 5ta Generación",
  "Echo Dot 5ta Generación (con reloj)",
  "Echo Dot 4ta Generación",
  "Echo Dot 4ta Generación (con reloj)",
  "Echo Dot 3ra Generación",
  "Echo Dot 2da Generación",
  "Echo Dot Kids",
  "Echo Studio",
  "Echo Show (2da generación)",
  "Echo Show 5 (1ra generación)",
  "Echo Show 5 (2da generación)",
  "Echo Show 8 (1ra generación)",
  "Echo Show 8 (2da generación)",
  "Echo Show 10",
  "Echo Flex",
  "echo dot 5ta deneración",
  "echo dot 5ta deneración (con reloj)",
  "echo dot 4ta deneración",
  "echo dot 4ta deneración (con reloj)",
  "echo dot 3ra deneración",
  "echo dot 2da deneración",
  "echo dot Kids",
  "echo studio",
  "echo show (2da generación)",
  "echo show 5 (1ra generación)",
  "echo show 5 (2da generación)",
  "echo show 8 (1ra generación)",
  "echo show 8 (2da generación)",
  "echo show 10",
  "echo flex",
  "reloj",
];

function buscarProducto() {
  var input = document.getElementById("searchInput").value;
  var index = nombresProductos.indexOf(input);

  if (index !== -1) {
      $(".card").hide();
      $(".card:contains('" + input + "')")
      .closest(".card")
      .show();
      alert("Producto encontrado");
  } else {
    alert("Producto no encontrado");
  }
}
