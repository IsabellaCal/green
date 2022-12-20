package com.example.demo.green.repo;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.example.demo.green.dao.User;

public interface UserRepo extends CrudRepository<User, Integer> {
	@Query(value = "select * from \"user\" u where u.username = ?1", nativeQuery = true)
	Iterable<User> findByUsername(String username);
}
