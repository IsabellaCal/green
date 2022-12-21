package com.example.demo.green.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.Ordine;

public interface OrdineRepo extends CrudRepository<Ordine, Integer> {
}
