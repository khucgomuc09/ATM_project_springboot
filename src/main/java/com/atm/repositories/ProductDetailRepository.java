package com.atm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.atm.entities.ProductDetail;

@Repository
public interface ProductDetailRepository extends JpaRepository<ProductDetail, Integer> {

}
