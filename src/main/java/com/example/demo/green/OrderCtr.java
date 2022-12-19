package com.example.demo.green;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.green.dao.OrderDetail;
import com.example.demo.green.repo.ProductRepo;

@Controller
@RequestMapping("/green/home/order")
public class OrderCtr {

	private ProductRepo repo;
	private OrderSvc svc;

	public OrderCtr(ProductRepo repo, OrderSvc svc) {
		this.repo = repo;
		this.svc = svc;
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/add")
	public String addOrder(@RequestParam Integer id, HttpSession session) {
		List<OrderDetail> details;
		details = session.getAttribute("details") == null ? new ArrayList<>()
				: (List<OrderDetail>) session.getAttribute("details");

		Optional<OrderDetail> detail = details.stream().filter(d -> d.getProduct().getId() == id).findAny();
//		detail.isPresent() ? detail.get().setQuantity(detail.get().getQuantity()+1) : details.add(new OrderDetail(id, 1));
		if (detail.isPresent()) {
			int quantity = detail.get().getQuantity();
			detail.get().setQuantity(quantity + 1);
		} else {
			details.add(new OrderDetail(repo.findById(id).get(), 1));
		}
		session.setAttribute("total", svc.getTotal(details));
		session.setAttribute("details", details);
		return "/green/prodotto";
	}

	@GetMapping("/delete")
	public String deleteProduct(@RequestParam Integer id, HttpSession session) {
		List<OrderDetail> details;
		if (session.getAttribute("details") == null) {
			return "/green/prodotto";
		} else {
			details = (List<OrderDetail>) session.getAttribute("details");
		}

		Optional<OrderDetail> detail = details.stream().filter(d -> d.getProduct().getId() == id).findAny();
		if (detail.isPresent()) {
			details.remove(detail.get());
		}
		session.setAttribute("total", svc.getTotal(details));
		session.setAttribute("details", details);
		return "/green/prodotto";
	}
	
	@GetMapping("/removeOne")
	public String removeOne(@RequestParam Integer id, HttpSession session) {
		List<OrderDetail> details;
		if (session.getAttribute("details") == null) {
			return "/green/prodotto";
		} else {
			details = (List<OrderDetail>) session.getAttribute("details");
		}

		Optional<OrderDetail> detail = details.stream().filter(d -> d.getProduct().getId() == id).findAny();
		if (detail.isPresent()) {
			int quantity = detail.get().getQuantity();
			if(quantity == 1) {
				details.remove(detail.get());
			} else {
				detail.get().setQuantity(quantity - 1);
			}
		}
		session.setAttribute("total", svc.getTotal(details));
		session.setAttribute("details", details);
		return "/green/prodotto";
	}

	@GetMapping()
	public String getOrder(HttpSession session) {
		return "/green/ordine";
	}
}
