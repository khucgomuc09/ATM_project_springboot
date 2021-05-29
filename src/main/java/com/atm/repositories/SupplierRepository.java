package com.atm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.atm.entities.Supplier;

@Repository
public interface SupplierRepository extends JpaRepository<Supplier, String> {

}
