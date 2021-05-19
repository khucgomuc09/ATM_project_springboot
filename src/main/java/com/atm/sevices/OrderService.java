package com.atm.sevices;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.CartItem;
import com.atm.entities.Product;
import com.atm.entities.UserOrder;
import com.atm.entities.User;
import com.atm.repositories.CartItemRepository;
import com.atm.repositories.OrderRepository;
import com.atm.repositories.ProductRepository;
import com.atm.repositories.UserRepository;

@Service
public class OrderService {

	@Autowired
	OrderRepository orderRepository;
	@Autowired
	CartItemRepository cartItemRepository;
	@Autowired
	UserRepository userRepository;
	@Autowired
	ProductRepository productRepository;

	public boolean payment(UserOrder order, User user) {
		System.out.println(order);
		Optional<User> op = userRepository.findById(user.getId());
		User userDB = op.get();

		System.out.println(userDB);
		for (CartItem cartItem : order.getCartItems()) {
//			Product p = productRepository.getOne(cartItem.getProduct().getId());
//			cartItem.setProduct(p);
			cartItemRepository.save(cartItem);
		}
		userDB.getOrders().add(order);
		userRepository.save(userDB);
		return true;

	}

}
