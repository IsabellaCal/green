package com.example.demo.green;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.green.dao.Utente;
import com.example.demo.green.repo.OrderDetailRepo;
import com.example.demo.green.repo.UtenteRepo;

@Controller
@RequestMapping("/green/home/profile")
public class ProfileCtr {
	private UtenteRepo repo;
	private OrderDetailRepo detailRepo;

	public ProfileCtr(UtenteRepo repo, OrderDetailRepo detailRepo) {
		this.repo = repo;
		this.detailRepo = detailRepo;
	}

	@PostMapping("/modify")
	public String modify(@RequestParam String password, HttpSession session,
			Model model) {
		password = password.trim();
		if (password.isBlank() || password.isEmpty() || password.length() > 15) {
			model.addAttribute("errorModify",
					"Devi compilare i campi (password massimo 15 caratteri)");
		} else {
			Utente user = repo.findById((Integer) session.getAttribute("userId")).get();
			user.setPasskey(password);
			repo.save(user);
			model.addAttribute("message", "Modifica avvenuta con successo");	
		}
		return "/green/profilo";
	}

	@GetMapping
	public String getProfile() {
		return "/green/profilo";
	}
	
	//if (username.isBlank() || username.isEmpty() || password.isBlank()
//			|| password.length() > 15 || username.length() > 20) {
//		model.addAttribute("errorModify",
//				"Devi compilare i campi (username massimo 20 caratteri e password massimo 15 caratteri)");
//		model.addAttribute("usernameModidy", username.substring(0, 20));
//	} else if (repo.findByUsername(username).iterator().hasNext() && repo.findByUsername(username).iterator().next().getId() != session.getAttribute("userId")) {
//		model.addAttribute("errorNameModidy", "Username già in uso, impostane uno diverso");
//		model.addAttribute("usernameModify", username);
//	} else {
//		Utente user = repo.findById((Integer) session.getAttribute("userId")).get();
//		user.setUsername(username);
//		if(!password.isEmpty()) {
//			user.setPasskey(password);
//		}
//		repo.save(user);
//		session.setAttribute("usernameCurrent", user.getUsername());
//		model.addAttribute("message", "Modifica avvenuta con successo");	
//	}

}
