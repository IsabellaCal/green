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
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;500&family=Righteous&family=Staatliches&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/green/css/prodotto.css">
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

	<!-- NAVBAR -->
	<%@include file="/green/include/navtop.html"%>

	<!-- PAGE HEADER -->
	<c:forEach var="category" items="${categories}">
		<c:if test="${category.id eq currentCatId}">
			<c:set var="currentCatName" value="${category.name}"/>
			<c:set var="img" value="${category.imgpath}"/>
		</c:if>
	</c:forEach>
	<div class="container">
		<img class="header" src="/green/pic/category/${img}" alt = "/green/pic/category/${img}" >
		<h1 class="centered">${currentCatName}</h1>
	</div>

	<!-- CARDS -->
	<c:forEach var="product" items="${products}">
		<div class="carta card mb-3">
			<img src="/green/pic/menu/${product.imgpath}" class="card-img-top"
				alt="${product.name}">
			<div class="card-body">
				<h5 class="card-title">${product.name}</h5>
				<p class="card-text">${product.description}</p>
			</div>
			<ul class="list-group list-group-flush">
				<li class="list-group-item">${product.price}&euro;<a
					href="/green/home/order/add?id=${product.id}"
					class="lmcart-add text-uppercase bottone btn btn-success">
						Aggiungi all'Ordine</a></li>
			</ul>
		</div>
	</c:forEach>

	<!-- SPAZIO TRA CARD E FOOTER -->
	<br>
	<br>
	
	<!-- Modal: esce solo quando schiaccio il logout nel navbootom -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="staticBackdropLabel">Logout</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">Sei sicuro di voler fare il logout?</div>
	      <div class="modal-footer">
	        <a href="/green/access/logout" class="bott btn btn-success">Sì</a>
	        <a href="/green/home/product" class="bott btn btn-danger">No</a>
	      </div>
	    </div>
	  </div>
	</div>	

	<!-- FOOTER -->
	<%@include file="/green/include/navbottom.html"%>
</body>
</html>