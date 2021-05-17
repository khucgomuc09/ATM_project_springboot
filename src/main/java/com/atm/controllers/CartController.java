package com.atm.controllers;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.atm.entities.CartItem;
import com.atm.entities.Order;
import com.atm.entities.Product;
import com.atm.entities.User;
import com.atm.sevices.CartItemService;
import com.atm.sevices.OrderService;
import com.atm.sevices.ProductService;

@Controller
@SessionAttributes("order_session")
public class CartController {

	@Autowired
	private CartItemService cartItemService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private ProductService productService;

//
	@GetMapping("/cart")
	public ModelAndView cart(@SessionAttribute(name = "order_session", required = false) Order order,
			@SessionAttribute(name = "user", required = false) User user) {

		ModelAndView modelAndView = new ModelAndView("client/cart");
//		if (cartItems != null)
//			modelAndView.addObject("cartItems", cartItems);
//		System.out.println(cartItems + " cart");
		if (order != null) {

			modelAndView.addObject("order", order);
			System.out.println(order + " cart");
		}
		if (user != null) {
			List<Order> list = new ArrayList<Order>();
			list.add(order);
			user.setOrders(list);
			modelAndView.addObject("user", user);
			System.out.println(user + " user");
		}

		return modelAndView;
	}

	@ResponseBody
	@PostMapping("/add_items_to_cart")
	// @SessionAttribute(name = "cart_item_session", required = false)
	// List<CartItem> cartItems
	public int addItemTocart(@RequestParam("id") int id_product, @RequestParam("orderid") int orderid,
			ModelMap modelMap, @SessionAttribute(name = "order_session", required = false) Order order,
			@SessionAttribute("user") User user) {
		System.out.println("order:" + order);
		int count = 0, t_price = 0;
		if (order != null) {
			if (order.getCartItems() != null) {
				boolean isItemExist = false;
				for (CartItem cartItem : order.getCartItems()) {
					if (cartItem.getProduct().getId() == id_product) {
						isItemExist = true;
						cartItem.setQuantity(cartItem.getQuantity() + 1);
						break;

					}

				}
				if (!isItemExist) {
					Product p = productService.getProductById(id_product);
					order.getCartItems().add(new CartItem(0, p, 1, p.getPrice()));
				}
			} else {
				order.setCartItems(cartItemService.addCartItem(id_product));

			}
			for (CartItem cartItem : order.getCartItems()) {
				count += cartItem.getQuantity();
				t_price += cartItem.getPrice() * cartItem.getQuantity();
			}
			order.setTotal(count);
			order.setTotal_price(t_price);
			System.out.println(count);
			return order.getTotal();

		} else {
			List<CartItem> lcartItems = cartItemService.addCartItem(id_product);
			String address = user != null ? user.getAddress() : "";
			Order od = new Order(orderid, lcartItems, 0, 0, 0, address);// total,status,price
//			od.setCartItem(c);

			for (CartItem cartItem : lcartItems) {
				count += cartItem.getQuantity();
				t_price += cartItem.getPrice() * cartItem.getQuantity();
			}
			od.setTotal(count);
			od.setTotal_price(t_price);
			// cartItemService.addCartItem(id_product, order),
			modelMap.addAttribute("order_session", od);
//			List<Order> list = new ArrayList<Order>();
//			list.add(order);
//			user.setOrders(list);
//			modelMap.addAttribute("cart_item_session", lcartItems);
//			System.out.println(lcartItems + ":cartItems-order:" + od.getTotal_price());
//			System.out.println(lcartItems + ":cartItems-order:" + lcartItems.get(0));
//			System.out.println(modelMap.getAttribute("order_session"));
//			count = 1;

		}
		// count product in order

		return count;
	}
}
