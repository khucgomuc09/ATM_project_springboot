package com.atm.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.atm.entities.UserOrder;

public interface OrderRepository extends JpaRepository<UserOrder, Integer> {
	@Query(nativeQuery = true, value = "select * from order_user where user_id=:userID")
	public List<UserOrder> findOrdersByUserID(int userID);
}
