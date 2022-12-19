package com.example.demo.green;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.green.dao.OrderDetail;
import com.example.demo.green.repo.OrderDetailRepo;

@Controller
@RequestMapping("/green/home/order")
public class OrderCtr {

//	private OrderDetailRepo repo;

	public OrderCtr(OrderDetailRepo repo) {
//		this.repo = repo;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/add")
	public String addOrder(@RequestParam Integer id, HttpSession session) {
		List<OrderDetail> details;
		details = session.getAttribute("details") == null ? new ArrayList<>()
				: (List<OrderDetail>) session.getAttribute("details");
//		if (session.getAttribute("details") == null) {
//			details = new ArrayList<>();
//		} else {
//			details = (List<OrderDetail>) session.getAttribute("details");
//		}
		Optional<OrderDetail> detail = details.stream().filter(d -> d.getMenuId() == id).findAny();
//		detail.isPresent() ? detail.get().setQuantity(detail.get().getQuantity()+1) : details.add(new OrderDetail(id, 1));
		if (detail.isPresent()) {
			int quantity = detail.get().getQuantity();
			detail.get().setQuantity(quantity + 1);
		} else {
			details.add(new OrderDetail(id, 1));
		}
		session.setAttribute("details", details);
		return "/green/prodotto";
	}

	@GetMapping()
	public String getOrder(HttpSession session) {
		return "/green/ordine";
	}
}
