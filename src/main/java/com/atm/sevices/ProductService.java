package com.atm.sevices;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.atm.entities.Product;
import com.atm.repositories.ProductRepository;

@Component
public class ProductService {
	@Autowired
	private ProductRepository pr;

	public ArrayList<Product> getProductByType(int type) {
		// 0:new, 1Hot, 2Sale
		ArrayList<Product> listproduct = new ArrayList<Product>();
		for (Product product : pr.getProductByType(type)) {
			listproduct.add(product);
		}
		return listproduct;
	}

	public Product getProductById(int id) {
		return pr.getOne(id);
	}

	public ArrayList<Product> getProductBySupplier(String supplier) {
		// TODO Auto-generated method stub
		ArrayList<Product> listproduct = new ArrayList<Product>();
		for (Product product : pr.getProductBySupplier(supplier)) {
			listproduct.add(product);
		}
		return listproduct;
	}
}
