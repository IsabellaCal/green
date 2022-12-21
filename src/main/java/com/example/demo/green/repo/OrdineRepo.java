package com.example.demo.green.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.Ordine;

public interface OrdineRepo extends CrudRepository<Ordine, Integer> {
	@Query("select o from Ordine o where o.utenteId = ?1")
	Iterable<Ordine> findPersonalOrders(Integer id);
}
