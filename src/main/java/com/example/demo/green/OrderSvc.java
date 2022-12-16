package com.example.demo.green;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.green.dao.Order;
import com.example.demo.green.repo.OrderRepo;

@Service
public class OrderSvc {
	private List<Order> orders = new ArrayList<>();
	private OrderRepo repo;
	
	public OrderSvc(OrderRepo repo) {
		this.repo = repo;
	}
	
	public Integer currentOrder() {
		orders = (List<Order>) repo.findCurrentOrder();
		return orders.get(0).getId();
		// Dovremmo controllare che ci sia next: .hasNext()
	}
}
