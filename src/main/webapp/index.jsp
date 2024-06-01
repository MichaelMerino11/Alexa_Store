<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>AlexaStore</title>
<link href="https://fonts.googleapis.com/css?family=Lato"
	rel="stylesheet" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous" />
<link rel="icon" href="./Imagenes/alexa_web_icon.png" />
<link rel="stylesheet" href="./CSS/styles.css" />
</head>
<body>
	<header>
		<div class="background-image"></div>
		<nav>
			<ul class="nav-links">
				<li><img src="./Imagenes/alexa_web_icon.png" alt="Alexa icon"
					height="30px" /></li>
			</ul>
			<form id="search-form" class="search-bar" action="#" method="GET"
				onsubmit="buscarProducto(); return false;">
				<input id="searchInput" type="text" name="search"
					placeholder="Buscar producto..." />
				<button type="submit">
					<img src="./Imagenes/searchIcon.png" alt="Search" height="20px" />
				</button>
			</form>
			<div class="login-container">
				<a href="login.jsp" class="login-link"><img
					src="./Imagenes/loginIcon.jpg" alt="Cuenta" height="30px" />Login</a>
			</div>
		</nav>
		<div class="name-title">
			<img src="./Imagenes/alexaIcon4.png" alt="Alexa title" />
		</div>
		<div class="fondo-principal"></div>
		<article>
			<section>
				<div class="container">
					<div class="row">
						<div class="col-12 col-md-6">
							<div class="content">
								<div class="content__container">
									<p class="content__container__text">Hola</p>
									<ul class="content__container__list">
										<li class="content__container__list__item">coders !</li>
										<li class="content__container__list__item">amigos !</li>
										<li class="content__container__list__item">usuarios !</li>
										<li class="content__container__list__item">a todos !</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</article>
	</header>
	<main>
		<div class="main_container">
			<div class="category_container">
				<h2>Categorías</h2>
				<ul class="category_list">
					<li>
						<button class="category_button" data-category="echo_dot"
							onclick="filterProducts('echo_dot')">Echo Dot</button>
					</li>
					<li>
						<button class="category_button" data-category="echo_studio"
							onclick="filterProducts('echo_studio')">Echo Studio</button>
					</li>
					<li>
						<button class="category_button" data-category="echo_show"
							onclick="filterProducts('echo_show')">Echo Show</button>
					</li>
					<li>
						<button class="category_button" data-category="echo_flex"
							onclick="filterProducts('echo_flex')">Echo Flex</button>
					</li>
				</ul>
			</div>
			<div class="container mt-5">
				<div class="row">
					<!-- Productos Echo Dot -->
					<div class="col-md-4 echo_dot" data-producto="echo_dot_1">
						<div class="card">
							<img src="./Imagenes/echoDot5ta.jpeg" class="card-img-top"
								alt="Echo Dot 5ta Generación" />
							<div class="card-body">
								<h5 class="card-title">Echo Dot 5ta Generación</h5>
								<p class="card-text">$49.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_dot" data-producto="echo_dot_2">
						<div class="card">
							<img src="./Imagenes/echoDotReloj.jpg" class="card-img-top"
								alt="Echo Dot 5ta Generación (con reloj)" />
							<div class="card-body">
								<h5 class="card-title">Echo Dot 5ta Generación (con reloj)
								</h5>
								<p class="card-text">$59.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_dot" data-producto="echo_dot_3">
						<div class="card">
							<img src="./Imagenes/echoDot4ta.png" class="card-img-top"
								alt="Echo Dot 4ta Generación" />
							<div class="card-body">
								<h5 class="card-title">Echo Dot 4ta Generación</h5>
								<p class="card-text">$34.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_dot" data-producto="echo_dot_4">
						<div class="card">
							<img src="./Imagenes/echoDot4taReloj.jpeg" class="card-img-top"
								alt="Echo Dot 4ta Generación (con reloj)" />
							<div class="card-body">
								<h5 class="card-title">Echo Dot 4ta Generación (con reloj)
								</h5>
								<p class="card-text">$44.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_dot" data-producto="echo_dot_5">
						<div class="card">
							<img src="./Imagenes/alexaG3.png" class="card-img-top"
								alt="Echo Dot 3ra Generación" />
							<div class="card-body">
								<h5 class="card-title">Echo Dot 3ra Generación</h5>
								<p class="card-text">$29.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_dot" data-producto="echo_dot_6">
						<div class="card">
							<img src="./Imagenes/echoDot2da.png" class="card-img-top"
								alt="Echo Dot 2da Generación" />
							<div class="card-body">
								<h5 class="card-title">Echo Dot 2da Generación</h5>
								<p class="card-text">$19.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_dot" data-producto="echo_dot_7">
						<div class="card">
							<img src="./Imagenes/echoDotKIds.png" class="card-img-top"
								alt="Echo Dot Kids" />
							<div class="card-body">
								<h5 class="card-title">Echo Dot Kids</h5>
								<p class="card-text">$59.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<!-- Productos Echo Studio -->
					<div class="col-md-4 echo_studio" data-producto="echo_studio_1">
						<div class="card">
							<img src="./Imagenes/echoStudio.png" class="card-img-top"
								alt="Echo Studio" />
							<div class="card-body">
								<h5 class="card-title">Echo Studio</h5>
								<p class="card-text">$199.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<!-- Productos Echo Show -->
					<div class="col-md-4 echo_show" data-producto="echo_show_1">
						<div class="card">
							<img src="./Imagenes/echoShow2.jpg" class="card-img-top"
								alt="Echo Show (2da generación)" />
							<div class="card-body">
								<h5 class="card-title">Echo Show (2da generación)</h5>
								<p class="card-text">$99.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_show" data-producto="echo_show_2">
						<div class="card">
							<img src="./Imagenes/echoShow1.jpg" class="card-img-top"
								alt="Echo Show 5 (1ra generación)" />
							<div class="card-body">
								<h5 class="card-title">Echo Show 5 (1ra generación)</h5>
								<p class="card-text">$59.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_show" data-producto="echo_show_3">
						<div class="card">
							<img src="./Imagenes/echoShow5_1.jpg" class="card-img-top"
								alt="Echo Show 5 (2da generación)" />
							<div class="card-body">
								<h5 class="card-title">Echo Show 5 (2da generación)</h5>
								<p class="card-text">$69.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_show" data-producto="echo_show_4">
						<div class="card">
							<img src="./Imagenes/echoShow3.jpg" class="card-img-top"
								alt="Echo Show 8 (1ra generación)" />
							<div class="card-body">
								<h5 class="card-title">Echo Show 8 (1ra generación)</h5>
								<p class="card-text">$99.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_show" data-producto="echo_show_5">
						<div class="card">
							<img src="./Imagenes/echoShow3_1.png" class="card-img-top"
								alt="Echo Show 8 (2da generación)" />
							<div class="card-body">
								<h5 class="card-title">Echo Show 8 (2da generación)</h5>
								<p class="card-text">$109.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<div class="col-md-4 echo_show" data-producto="echo_show_6">
						<div class="card">
							<img src="./Imagenes/echoShow4.jpg" class="card-img-top"
								alt="Echo Show 10" />
							<div class="card-body">
								<h5 class="card-title">Echo Show 10</h5>
								<p class="card-text">$249.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
					<!-- Productos Echo Flex -->
					<div class="col-md-4 echo_flex" data-producto="echo_flex_1">
						<div class="card">
							<img src="./Imagenes/echoFlex.png" class="card-img-top"
								alt="Echo Flex" />
							<div class="card-body">
								<h5 class="card-title">Echo Flex</h5>
								<p class="card-text">$24.99</p>
								<a href="login.jsp" class="btn btn-primary">Comprar</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>
	<footer class="bg-dark text-center text-lg-start">
		<div class="container p-4">
			<div class="row">
				<div class="col-lg-4 col-md-6 mb-4 mb-md-0">
					<h6 class="text-uppercase text-white">
						<strong>Contacto</strong>
					</h6>
					<ul class="list-unstyled mb-0">
						<li class="text-white">Correo: maikijunior9@gmail.com</li>
						<li class="text-white">Teléfono: +593 984571226</li>
						<li class="text-white">Dirección: Calle Chávez 411, Quito,
							Ecuador</li>
					</ul>
				</div>
				<div class="col-lg-4 col-md-6 mb-4 mb-md-0">
					<h6 class="text-uppercase text-white">
						<strong>Síguenos</strong>
					</h6>
					<a href="https://www.facebook.com/michaelandres.junior11"
						class="me-4 text-reset text-decoration-none"><img
						src="./Imagenes/facebook.png" alt="Facebook" height="30px" /></a> <a
						href="https://www.instagram.com/maikijr11/"
						class="me-4 text-reset text-decoration-none"><img
						src="./Imagenes/instagram.png" alt="Instagram" height="30px" /></a> <a
						href="wwww.twitter.com"
						class="me-4 text-reset text-decoration-none"><img
						src="./Imagenes/twitter.png" alt="Twitter" height="30px" /></a> <a
						href="https://www.linkedin.com/in/michael-merino-0b7871207/"
						class="me-4 text-reset text-decoration-none"><img
						src="./Imagenes/linkedin.png" alt="LinkedIn" height="30px" /></a>
				</div>
				<div class="col-lg-4 col-md-12 mb-4 mb-md-0">
					<h6 class="text-uppercase text-white">
						<strong>Autores</strong>
					</h6>
					<ul class="list-unstyled mb-0">
						<li class="text-white">Michael Merino</li>
						<li class="text-white">Neymar Junior</li>
						<li class="text-white">Lionel Messi</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="text-center p-3 text-white">
			<a href="https://github.com/MichaelMerino11/Alexa_Store.git"
				class="text-white">Ver código en GitHub</a> <br> © 2024 Derechos
			reservados Michael Merino <br>
		</div>
	</footer>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="./JS/script.js"></script>
</body>
</html>
