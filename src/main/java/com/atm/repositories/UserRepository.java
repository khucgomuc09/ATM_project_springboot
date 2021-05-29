package com.atm.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.atm.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	@Query(nativeQuery = true, value = "select * from user where username =:username and password=:password")
	public User findByUserNameAndPassWord(@Param("username") String username, @Param("password") String password);

	@Query(nativeQuery = true, value = "select * from user where username =:username")
	public User findByUserName(@Param("username") String username);

	@Query(nativeQuery = true, value = "select email from user")
	public List<String> getEmail();

	@Query(nativeQuery = true, value = "select username from user")
	public List<String> getUsername();

}
