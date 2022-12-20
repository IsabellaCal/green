package com.example.demo.green;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.green.dao.User;
import com.example.demo.green.repo.UserRepo;

@Controller
@RequestMapping("/green/access")
public class UserCtr {

	private UserRepo repo;

	public UserCtr(UserRepo repo) {
		this.repo = repo;
	}

	@PostMapping("/login")
	public String login(@RequestParam String username, @RequestParam String password, HttpSession session,
			Model model) {
		username = username.trim();
		password = password.trim();
		if (username.isBlank() || username.isEmpty() || password.isBlank() || password.isEmpty()
				|| password.length() > 15 || username.length() > 20) {
			model.addAttribute("errorLogin",
					"Devi compilare i campi (username massimo 20 caratteri e password massimo 15 caratteri)");
			return "/green/registrati";
		} else if (repo.findByUsername(username).iterator().hasNext()
				&& repo.findByUsername(username).iterator().next().getPassword().equals(password)) {
			session.setAttribute("userId", repo.findByUsername(username).iterator().next().getId());
			return "/green/menu";
		} else {
			model.addAttribute("errorLogin",
					"Username o password errati, se non sei registrato compila il form in basso");
			return "/green/registrati";
		}
	}

	@PostMapping("/registration")
	public String register(@RequestParam String username, @RequestParam String password, HttpSession session,
			Model model) {
		username = username.trim();
		password = password.trim();
		if (username.isBlank() || username.isEmpty() || password.isBlank() || password.isEmpty()
				|| password.length() > 15 || username.length() > 20) {
			model.addAttribute("errorRegistration",
					"Devi compilare i campi (username massimo 20 caratteri e password massimo 15 caratteri)");
			return "/green/registrati";
		} else if (repo.findByUsername(username).iterator().hasNext()) {
			model.addAttribute("errorRegistration", "Username già in uso, impostane uno diverso");
			return "/green/registrati";
		} else {
			repo.save(new User(username, password));
			session.setAttribute("userId", repo.findByUsername(username).iterator().next().getId());
			return "/green/menu";
		}
	}

	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index.html";
	}

	@GetMapping
	public String accessPage() {
		return "/green/registrati";
	}
}
