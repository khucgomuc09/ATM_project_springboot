package com.atm.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.atm.entities.CartItem;

@Repository
public interface CartItemRepository extends JpaRepository<CartItem, Integer> {
	@Query(nativeQuery = true, value = "select * from cartitem where orderid=:orderID")
	public List<CartItem> findOrdersByUserID(int orderID);
}
