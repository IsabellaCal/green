<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Registrati</title>
	<!-- Collegamento a css -->
	<link rel="stylesheet" href="/green/css/registrati.css">
	<!-- Google font -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;500&family=Righteous&family=Staatliches&display=swap" rel="stylesheet">
	<!-- Collegamento a bootstrap -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="/green/css/menu.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
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
	<h1 id="titolo">Accedi o registrati per ordinare</h1>
	
	<!-- CARDS -->
		<div class="row">
		
		  <div class="col-sm-6">
		    <div class="card h-100">
		      <div class="card-body">
		        <h5 class="card-title">Accedi</h5>
		        <c:if test="${not empty errorLogin}">
					<p id="rosso">${errorLogin}</p>
				</c:if>
				<form action="/green/access/login" method="POST">
					<div class="mb-3">
						<label class="form-label">Username</label> 
						<input type="text" class="form-control" placeholder="Inserisci il tuo Username" name="username" required>
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control" id="exampleInputPassword1" placeholder="Inserisci password" name="password" required>
					</div>
					<button type="submit" class="btn btn-success">Accedi</button>
				</form>
		      </div>
		    </div>
		  </div>
		  
		  <div class="col-sm-6 ">
		    <div class="card h-100">
		      <div class="card-body">
		        <h5 class="card-title">Registrati</h5>
				<c:if test="${not empty errorRegistration}">
					<p id="rosso">${errorRegistration}</p>
				</c:if>
				<form action="/green/access/registration" method="POST">
					<div class="mb-3">
						<label class="form-label">Username</label> 
						<input type="text" class="form-control" placeholder="Scegli il tuo username" name="username" required>
						<div class="form-text">Deve contenere massimo 20 caratteri.</div>
					</div>
					<div class="mb-3">
						<label for="exampleInputPassword1" class="form-label">Password</label>
						<input type="password" class="form-control" id="inputPassword5" placeholder="Inserisci password" name="password" required>
						<div class="form-text">Deve contenere massimo 15 caratteri.</div>
					</div>
					<button type="submit" class="btn btn-success">Registrati</button>
				</form>
		      </div>
		    </div>
		  </div>
		  
		</div>
	
	</div>
</body>
</html>