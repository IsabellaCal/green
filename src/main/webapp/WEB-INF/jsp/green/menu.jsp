<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html lang="it">

<head>
	<meta charset="UTF-8">
	<title>Pizzeria Pizza &amp; Pinza</title>
	<!-- Google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;500&family=Righteous&family=Staatliches&display=swap" rel="stylesheet">
	<!-- Collegamento a bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/green/css/menu.css">
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
		<%@include file="/green/include/navtop.html"%>
        
        <!-- PAGE HEADER -->
		<div class="container">
			<img class="header" src="/green/pic/category/header.png">
			<h1 class="centered">Pizza &amp; Pinsa</h1>
		</div>

		<!-- CARDS -->
		<c:forEach var="category" items="${categories}">
			<a href="/green/home/product?id=${category.id}">
				<div class="carta card mb-3">
					<img src="/green/pic/category/${category.imgpath}"
						class="card-img-top" alt="${category.name}">
					<div class="card-body">
						<h5 class="card-title">${category.name}</h5>
						<p class="card-text">${category.description}</p>
					</div>
				</div>
			</a>
		</c:forEach>
		
		<!-- SPAZI VUOTI PER NON FARE TOCCARE L'ULTIMA CARD CON IL FOOTER -->
		<br>
		<br>

		<!-- FOOTER -->
		<%@include file="/green/include/navbottom.html"%>

	</div>
</body>
</html>