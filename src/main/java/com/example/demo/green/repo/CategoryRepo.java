package com.example.demo.green.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.Category;

public interface CategoryRepo extends CrudRepository<Category, Integer> {
}
