package com.atm.repositories;

import java.util.ArrayList;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.atm.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer> {

	@Query(value = "SELECT * FROM sanpham sp WHERE sp.loaisanpham = :product_type", nativeQuery = true)
	public ArrayList<Product> getProductByType(@Param("product_type") int product_type);

	@Query(value = "SELECT * FROM sanpham sp WHERE sp.nhacungcap = :supplier", nativeQuery = true)
	public Page<Product> getProductBySupplier(@Param("supplier") String supplier, Pageable pageable);

}
