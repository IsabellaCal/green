package com.example.demo.green;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.demo.green.dao.Order;
import com.example.demo.green.repo.OrderRepo;

@Service
public class OrderSvc {
	private List<Order> orders;
	private OrderRepo repo;
	
	public OrderSvc(OrderRepo repo) {
		this.orders = new ArrayList<>();
		this.repo = repo;
	}
	
	public Integer currentOrder() {
		return repo.findCurrentOrder().iterator().next().getId();
		// Dovremmo controllare che ci sia next: .hasNext()
	}
}
