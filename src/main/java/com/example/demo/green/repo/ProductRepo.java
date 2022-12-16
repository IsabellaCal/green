package com.example.demo.green.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.Product;

public interface ProductRepo extends CrudRepository<Product, Integer>{
	Iterable<Product> findByCategoryId(Integer id);
}
