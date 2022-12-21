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

import com.example.demo.green.dao.Ordine;
import com.example.demo.green.dao.OrderDetail;
import com.example.demo.green.repo.OrderDetailRepo;
import com.example.demo.green.repo.OrdineRepo;
import com.example.demo.green.repo.ProductRepo;

@Controller
@RequestMapping("/green/home/order")
public class OrderCtr {

	private ProductRepo repo;
	private OrderDetailRepo detailRepo;
	private OrdineRepo ordineRepo;
	private OrderSvc svc;

	public OrderCtr(ProductRepo repo, OrderDetailRepo detailRepo, OrdineRepo orderRepo, OrderSvc svc) {
		this.repo = repo;
		this.svc = svc;
		this.detailRepo = detailRepo;
		this.ordineRepo = orderRepo;
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
		session.setAttribute("numberItems", svc.getNumberItems(details));
		session.setAttribute("details", details);
		return "/green/prodotto";
	}

	@SuppressWarnings("unchecked")
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
		session.setAttribute("numberItems", svc.getNumberItems(details));
		session.setAttribute("details", details);
		return "/green/prodotto";
	}

	@SuppressWarnings("unchecked")
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
			if (quantity == 1) {
				details.remove(detail.get());
			} else {
				detail.get().setQuantity(quantity - 1);
			}
		}
		session.setAttribute("total", svc.getTotal(details));
		session.setAttribute("numberItems", svc.getNumberItems(details));
		session.setAttribute("details", details);
		return "/green/prodotto";
	}

	@SuppressWarnings("unchecked")
	@GetMapping("/completeOrder")
	public String completeOrder(HttpSession session, Model model) {
		List<OrderDetail> details;
		if (session.getAttribute("details") == null) {
			return "/green/prodotto";
		} else {
			details = (List<OrderDetail>) session.getAttribute("details");
		}
		Ordine ordine = new Ordine((double) svc.getTotal(details), (Integer) session.getAttribute("userId"));
		ordine = ordineRepo.save(ordine);
		for (int i = 0; i < details.size(); i++) {
			details.get(i).setOrderId(ordine.getId());
			detailRepo.save(details.get(i));
		}
		session.removeAttribute("details");
		session.removeAttribute("numberItems");
		session.removeAttribute("total");
		model.addAttribute("message", "Ordine effettuato con successo!");
		return "/green/prodotto";
	}

	@GetMapping()
	public String getOrder(HttpSession session) {
		return "/green/ordine";
	}
}
