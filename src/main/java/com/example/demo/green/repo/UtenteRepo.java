package com.example.demo.green.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.Utente;

public interface UtenteRepo extends CrudRepository<Utente, Integer> {
	Iterable<Utente> findByUsername(String username);
}
