package com.example.demo;

public class Snippet {
	<div class="container-fluid">
		<h3>I tuoi ordini</h3>
		<table class="table">
			<thead>
				<tr>
					<th scope="col">Id ordine</th>
					<th scope="col">Totale ordine</th>
					<th scope="col">Utente</th>
				</tr>
			</thead>
	
			<tbody>
	
				<c:forEach var="personalOrder" items="${personalOrders}">
					<tr>
						<td>${personalOrder.id}</td>
						<td>
						</td>
						<td>${personalOrder.total}</td>
					</tr>
				</c:forEach>
	
			</tbody>
		</table>
}

