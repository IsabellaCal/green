<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Pizzeria Pizza &amp Pinza</title>
	<!-- Collegamento a bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
		integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
		crossorigin="anonymous">
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
		crossorigin="anonymous">
	</script>
</head>

<body>
 <div class="container-fluid">
 
	<!-- NAVBAR -->
	<nav class="navbar sticky-top bg-light fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Pizza &amp Pinza</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
				aria-controls="offcanvasNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="offcanvas offcanvas-end" tabindex="-1"
				id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
				<div class="offcanvas-header">
					<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Il tuo ordine</h5>
					<button type="button" class="btn-close" data-bs-dismiss="offcanvas"
						aria-label="Close"></button>
				</div>
				<div class="offcanvas-body">
					<ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">Home</a></li>
						<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<!-- CARDS -->
	<c:forEach var="category" items="${categories}">
		<div class="card mb-3">
			<img src="/green/pic/category/${category.imgpath}" class="card-img-top" alt="${category.name}">
			<div class="card-body">
				<h5 class="card-title">${category.name}</h5>
				<p class="card-text">${category.description}</p>
			</div>
		</div>
	</c:forEach>
	
	<!-- FOOTER -->
	<nav class="navbar sticky-bottom navbar-expand-lg bg-light">
		<div class="container-fluid">
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="#">Menu</a>
					</li>
					<li class="nav-item dropup-center dropup">
						<div class="dropup-center dropup">
							<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Categorie</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Antipasti e fritti</a></li>
								<li><a class="dropdown-item" href="#">Le nostre pizze</a></li>
								<li><a class="dropdown-item" href="#">Le nostre pinse</a></li>
								<li><a class="dropdown-item" href="#">Dolci</a></li>
								<li><a class="dropdown-item" href="#">Bevande</a></li>
							</ul>
						</div>
					</li>
					<li class="nav-item dropup-center dropup">
						<div class="dropup-center dropup">
							<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Cerca</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Action</a></li>
								<li><a class="dropdown-item" href="#">Action two</a></li>
								<li><a class="dropdown-item" href="#">Action three</a></li>
							</ul>
						</div>
					</li>
					<li class="nav-item dropup-center dropup">
						<div class="dropup-center dropup">
							<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Contatti</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">+39 06 12.34.56.78</a></li>
								<li><a class="dropdown-item" href="#">Messaggio WhatsApp</a></li>
								<li><a class="dropdown-item" href="#">info@leggimenu.it</a></li>
								<li><a class="dropdown-item" href="#">Visualizza su Google Maps</a></li>
							</ul>
						</div>
					</li>
					<li class="nav-item dropup-center dropup">
						<div class="dropup-center dropup">
							<a class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false">Condividi</a>
							<ul class="dropdown-menu">
								<li><a class="dropdown-item" href="#">Facebook</a></li>
								<li><a class="dropdown-item" href="#">WhatsApp</a></li>
								<li><a class="dropdown-item" href="#">Email</a></li>
							</ul>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
 </div>
</body>
</html>