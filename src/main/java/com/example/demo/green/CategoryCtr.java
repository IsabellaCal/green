package com.example.demo.green;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.green.repo.CategoryRepo;

@Controller
@RequestMapping("/green/home")
public class CategoryCtr {

	private CategoryRepo repo;

	public CategoryCtr(CategoryRepo repo) {
		this.repo = repo;
	}

	@GetMapping()
	public String getAll(HttpSession session) {
		session.setAttribute("categories", repo.findAll());
		return "/green/menu";
	}
}
