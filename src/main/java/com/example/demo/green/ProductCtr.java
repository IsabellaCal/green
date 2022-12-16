package com.example.demo.green;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.green.repo.ProductRepo;

@Controller
@RequestMapping("/green/home/product")
public class ProductCtr {
	
	private ProductRepo repo;
	public ProductCtr(ProductRepo repo) {
		this.repo = repo;
	}
	
	@GetMapping()
	public String getProduct(@RequestParam Integer id, Model model) {
		model.addAttribute("products", repo.findByCategoryId(id));
		return "/green/prodotto";
	}
}