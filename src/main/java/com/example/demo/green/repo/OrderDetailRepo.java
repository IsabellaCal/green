package com.example.demo.green.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.OrderDetail;

public interface OrderDetailRepo extends CrudRepository<OrderDetail, Integer> {
//	@Query("select od from OrderDetail od where od.ordineId = ?1")
//	Iterable<OrderDetail> findDetailsById(Integer id);
}
