package com.example.demo.green.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.Order;

public interface OrderRepo extends CrudRepository<Order, Integer> {
	@Query(value = "select * from \"order\" o order by o.order_id desc", nativeQuery = true)
	Iterable<Order> findCurrentOrder();
}
