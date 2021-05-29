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

	public Supplier getSupplierByID(String id) {
		return supplierRepository.getOne(id);
	}

	public Supplier createSupplier(Supplier supplier) {
		return supplierRepository.save(supplier);
	}

	public Supplier editSupplier(String id, Supplier supplier) {
		removeSupplier(id);

		return supplierRepository.save(supplier);
	}

	public void removeSupplier(String id) {
		supplierRepository.deleteById(id);
	}
}
