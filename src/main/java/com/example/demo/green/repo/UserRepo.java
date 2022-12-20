package com.example.demo.green.repo;

import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.User;

public interface UserRepo extends CrudRepository<User, Integer> {
	Iterable<User> findByUsername(String username);
}
