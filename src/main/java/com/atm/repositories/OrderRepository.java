package com.atm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.atm.entities.Order;

public interface OrderRepository extends JpaRepository<Order, Integer> {

}
