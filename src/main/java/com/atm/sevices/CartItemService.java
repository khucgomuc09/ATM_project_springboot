package com.atm.sevices;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.CartItem;
import com.atm.entities.Order;
import com.atm.entities.Product;
import com.atm.repositories.CartItemRepository;
import com.atm.repositories.OrderRepository;
import com.atm.repositories.ProductRepository;

@Service
public class CartItemService {
	@Autowired
	private ProductRepository pr;
	@Autowired
	private CartItemRepository cr;
	@Autowired
	private OrderRepository or;

	public List<CartItem> addCartItem(int id) {
		List<CartItem> listItem = new ArrayList<CartItem>();
		int indexOfId = -1;
		for (int i = 0; i < listItem.size(); i++) {
			if (listItem.get(i).getProduct().getId() == id) {
				listItem.get(indexOfId).getProduct().setAmount(listItem.get(indexOfId).getProduct().getAmount() + 1);
				indexOfId = i;
				break;
			}
		}
		if (indexOfId == -1) {
			Product p = pr.getOne(id);
			listItem.add(new CartItem(0, p, 1, p.getPrice()));
		}
		return listItem;
	}
}
