<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Il tuo profilo</title>
<!-- Google font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;500&family=Righteous&family=Staatliches&display=swap"
	rel="stylesheet">
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
	<!-- NAVBAR -->
	<%@include file="/green/include/navtop.html"%>

	<div class="container-fluid">
		<h3>I tuoi ordini</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Data ordine</th>
					<th scope="col">N.ordine</th>
					<th scope="col">Bo</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<c:forEach var="detail" items="${details}">
						<tr>
							<td>${detail.menuId}</td>
							<td>${detail.quantity}</td>
							<td><a href="#" type="submit" class="btn btn-danger">Elimina</a></td>
						</tr>
					</c:forEach>
				</tr>
			</tbody>
		</table>

		<h3>Modifica i tuoi dati</h3>
		<form action="/green/home/profile/modify" method="POST">
			<div class="mb-3">
				<label class="form-label">Username</label> <input type="text"
					class="form-control" name="username" value="${usernameCurrent}"
					readonly>
			</div>
			<c:if test="${not empty errorModify}">
				<br>
				<span>${errorModify}</span>
			</c:if>
			<div class="mb-3">

				<label for="exampleInputPassword1" class="form-label">Password</label>
				<input type="password" class="form-control" id="inputPassword5"
					placeholder="Inserisci password" name="password" required>
				<div class="form-text">Deve contenere massimo 15 caratteri.</div>
			</div>
			<button type="submit" class="btn btn-success">Modifica
				password</button>
			<c:if test="${not empty message}">
				<br>
				<span>${message}</span>
			</c:if>
		</form>
		<br>
		<h3>Logout</h3>
		<h4>Sei sicuro di voler fare il logout?</h4>
		<a href="/green/access/logout" class="btn btn-outline-light">Sì</a> <a
			href="/green/home" class="btn btn-outline-light">No, torna al
			menu</a>
	</div>

</body>
</html>