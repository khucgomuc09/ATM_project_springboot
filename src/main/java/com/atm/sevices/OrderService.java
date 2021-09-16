package com.atm.sevices;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.CartItem;
import com.atm.entities.User;
import com.atm.entities.UserOrder;
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

	public boolean payment(UserOrder order, User user) {
		Optional<User> op = userRepository.findById(user.getId());
		User userDB = op.get();

		for (CartItem cartItem : order.getCartItems()) {

			cartItemRepository.save(cartItem);
		}
		userDB.getOrders().add(order);
		userRepository.save(userDB);
		return true;
	}

	public List<UserOrder> getAllOrder() {
		return orderRepository.findAll();
	}

//	public boolean deleteOrder(int id) {
//		orderRepository.deleteById(id);
//		return true;
//	}

	public void cf_order(int id_order) {
		UserOrder r = orderRepository.getOne(id_order);
		r.setStatus(1);
		orderRepository.save(r);
	}
}
