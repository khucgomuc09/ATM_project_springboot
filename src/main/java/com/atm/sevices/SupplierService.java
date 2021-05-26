package com.atm.sevices;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.Supplier;
import com.atm.repositories.SupplierRepository;

@Service
public class SupplierService {
	@Autowired
	private SupplierRepository supplierRepository;

	public List<Supplier> getAllSuppliers() {
		return supplierRepository.findAll();
	}
}
