package com.atm.sevices;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.CartItem;
import com.atm.entities.Product;
import com.atm.repositories.ProductRepository;

@Service
public class CartItemService {
	@Autowired
	private ProductRepository pr;

	public List<CartItem> addCartItem(int id) {
		List<CartItem> listItem = new ArrayList<CartItem>();
		boolean isExist = false;
		for (int i = 0; i < listItem.size(); i++) {
			if (listItem.get(i).getProduct().getId() == id) {
				listItem.get(i).setQuantity(listItem.get(i).getQuantity() + 1);
				isExist = true;
				break;
			}
		}
		if (!isExist) {
			Product p = pr.getOne(id);
			listItem.add(new CartItem(0, p, 1, p.getPrice()));
		}
		return listItem;
	}
}
