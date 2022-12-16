<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

	<!-- CARDS -->
	<c:forEach var="detail" items="${detailOrder}">
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">${detail.menuId}</h5>
				<p class="card-text">${detail.quantity}</p>
			</div>
		</div>
	</c:forEach>

	<!-- FOOTER -->
	<%@include file="/green/include/navbottom.html"%>
</body>
</html>