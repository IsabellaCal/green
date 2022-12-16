package com.example.demo.green;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.green.repo.OrderDetailRepo;

@Controller
@RequestMapping("/green/home/order")
public class OrderCtr {
	
	private OrderSvc svc;
	private OrderDetailRepo repo;
	
	public OrderCtr(OrderSvc svc, OrderDetailRepo repo) {
		this.svc = svc;
		this.repo = repo;
	}
	
	@GetMapping()
	public String getOrder(Model model) {
		Integer id = svc.currentOrder();
		model.addAttribute("detailOrder", repo.findDetailsById(id));
		return "/green/ordine";
	}
}
