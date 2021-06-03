package com.atm.controllers;

import java.util.ArrayList;
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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.atm.entities.CartItem;
import com.atm.entities.UserOrder;
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
	public ModelAndView cart(@SessionAttribute(name = "order_session", required = false) UserOrder order,
			@SessionAttribute(name = "user", required = false) User user) {

		ModelAndView modelAndView = new ModelAndView("client/cart");
		if (order != null) {

			modelAndView.addObject("order", order);
		}
		if (user != null) {
			List<UserOrder> list = new ArrayList<UserOrder>();
			list.add(order);
			user.setOrders(list);
			modelAndView.addObject("user", user);

		}

		return modelAndView;
	}

	@ResponseBody
	@PostMapping("/add_items_to_cart")
	public int addItemTocart(@RequestParam("id") int id_product, @RequestParam("orderid") int orderid,
			ModelMap modelMap, @SessionAttribute(name = "order_session", required = false) UserOrder order,
			@SessionAttribute("user") User user) {
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

			return order.getTotal();

		} else {
			List<CartItem> lcartItems = cartItemService.addCartItem(id_product);
			String address = user != null ? user.getAddress() : "";
			UserOrder od = new UserOrder(orderid, lcartItems, 0, 0, 0, address);// total,status,price

			for (CartItem cartItem : lcartItems) {
				count += cartItem.getQuantity();
				t_price += cartItem.getPrice() * cartItem.getQuantity();
			}
			od.setTotal(count);
			od.setTotal_price(t_price);
			modelMap.addAttribute("order_session", od);

		}

		return count;
	}

	@PostMapping("update_item")
	@ResponseBody
	public String updateCartItem(@RequestParam(name = "id", required = false) int id,
			@RequestParam(name = "amount", required = false) int amount,
			@SessionAttribute(name = "order_session", required = false) UserOrder order) {

		int cartIndex = -1;
		for (int i = 0; i < order.getCartItems().size(); i++) {
			CartItem c = order.getCartItems().get(i);
			if (c.getProduct().getId() == id) {
				cartIndex = i;
				c.setQuantity(amount);
				c.setPrice(amount * c.getProduct().getPrice());
			}
		}

		int count = 0, t_price = 0;
		for (CartItem cartItem : order.getCartItems()) {
			count += cartItem.getQuantity();
			t_price += cartItem.getPrice();
		}

		order.setTotal(count);
		order.setTotal_price(t_price);

		return order.getTotal() + "-" + order.getTotal_price() + "-" + order.getCartItems().get(cartIndex).getPrice()
				+ "-" + order.getCartItems().get(cartIndex).getProduct().getId();
	}

	@PostMapping("delete_cartItem")
	@ResponseBody
	public String deleteCartItem(@RequestParam(name = "id", required = false) int id,
			@SessionAttribute(name = "order_session", required = false) UserOrder order) {

		for (int i = 0; i < order.getCartItems().size(); i++) {
			CartItem c = order.getCartItems().get(i);
			if (c.getProduct().getId() == id) {
				order.getCartItems().remove(i);
			}
		}
		int count = 0, t_price = 0;
		for (CartItem cartItem : order.getCartItems()) {
			count += cartItem.getQuantity();
			t_price += cartItem.getPrice();
		}
		order.setTotal(count);
		order.setTotal_price(t_price);
		return count + "-" + t_price;
	}

	@GetMapping("/removeCartItemSS")
	public String removeSS(SessionStatus sessionStatus) {
		sessionStatus.setComplete();
		return "redirect:/";
	}

	@PostMapping("payment")
	public String payment(@SessionAttribute(name = "order_session", required = false) UserOrder order,
			@SessionAttribute(name = "user", required = false) User user, SessionStatus sessionStatus) {
		orderService.payment(order, user);
		sessionStatus.setComplete();
		return "redirect:/";
	}

}
