<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang='it'>

<head>
	<meta charset="UTF-8">
	<title>Il tuo profilo</title>
	<!-- Google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;500&family=Righteous&family=Staatliches&display=swap"
		rel="stylesheet">
	<!-- COLLEGAMENTO CSS -->
		<link rel="stylesheet" type="text/css" href="/green/css/profilo.css">
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
	
	<!-- NAVTOP -->
	<nav class="navbar sticky-top bg-light fixed-top">
	<div class="container-fluid">
				<a class="navbar-brand" href="/green/home"> <img
					src="/green/pic/indietro.png" width="40" height="40"></a>
				<a class="navbar-brand" href="#"><img src="/green/pic/logo.png"
			width="120" height="34"></a>
	</div>
	</nav>
	

	<div class="container-fluid">
		<h3>I tuoi ordini</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Id ordine</th>
					<!-- <th scope="col">??</th> -->
					<th scope="col">Totale ordine</th>
				</tr>
			</thead>

			<tbody>

				<c:forEach var="personalOrder" items="${personalOrders}">
					<tr>
						<td>${personalOrder.id}</td>
						<!--  <td>
						</td>  -->
						<td>${personalOrder.total}</td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>

	<section id="modifica">
		<h3>Modifica i tuoi dati</h3>
		<form action="/green/home/profile/modify" method="POST">
			<div class="mb-3">
				<label class="form-label ">Username</label> <input type="text"
					class="form-control" name="username" value="${usernameCurrent}"
					readonly>
			</div>
			<c:if test="${not empty errorModify}">
				<p id="rosso">${errorModify}</p>
			</c:if>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" class=" form-control" id="inputPassword5"
					placeholder="Inserisci password" name="password" required>
				<div class="form-text">Deve contenere massimo 15 caratteri.</div>
			</div>
			<button type="submit" class="btn btn-success">Modifica
				password</button>
			<c:if test="${not empty message}">
				<span id="verde">${message}</span>
			</c:if>
		</form>
	</section>
	
	<!-- 
	<h3>Logout</h3>
	<h4>Vuoi fare il logout?</h4>
	<a href="/green/access/logout" class="btn btn-success">Sì</a> 
	<a href="/green/home" class="btn btn-danger">No, torna al menu</a>
	<br>
	<br> 
	-->
	
</body>
</html>