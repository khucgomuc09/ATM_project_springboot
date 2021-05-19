package com.atm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.atm.entities.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {
	@Query(nativeQuery = true, value = "select * from user where username =:username or email=:username and password=:password")
	public User findByUserName(@Param("username") String username, @Param("password") String password);

//	@Query(nativeQuery = true, value = "update user set username = :username where id = :id")
//	public User updateOrderOfUser(@Param("id") int id_user, @Param("username") String username);

}
