package com.example.demo.green.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.Order;

public interface OrderRepo extends CrudRepository<Order, Integer>{
	@Query("select o from Order o order by o.id desc")
	Iterable<Order> findCurrentOrder();
	
}
