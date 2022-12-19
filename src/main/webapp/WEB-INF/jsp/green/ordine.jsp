<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Pizzeria Pizza &amp; Pinza - Ordine</title>
	<!-- Google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;500&family=Righteous&family=Staatliches&display=swap" rel="stylesheet">
	<!-- Collegamento a bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/green/css/ordine.css">
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
	
	<!-- TABELLA -->
	<table class="table">
	  <thead>
	    <tr>
	      <th scope="col">Categoria</th>
	      <th scope="col">Nome prodotto</th>
	      <th scope="col">Quantità</th>
	      <th scope="col">Prezzo</th>
	      <th scope="col">Elimina</th>
	    </tr>
	  </thead>
	   
	  <tbody>
	    <tr>
	      <c:forEach var="detail" items="${detailOrder}">
			<tr>
				<td>${detail.category}</td>
				<td>${detail.product}</td>
				<td>${detail.quantity}</td>
				<td>${detail.price}</td>
				<td><a href="#" type="submit" class="btn btn-danger">Elimina</a></td>
			</tr>
		</c:forEach> 
	    </tr>
	  </tbody>
	</table>

	<!-- FOOTER -->
	<%@include file="/green/include/navbottom.html"%>
</div>
</body>
</html>