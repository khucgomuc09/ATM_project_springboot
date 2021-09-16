package com.atm.controllers;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.TimeZone;

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
import com.atm.entities.Product;
import com.atm.entities.User;
import com.atm.entities.UserOrder;
import com.atm.sevices.CartItemService;
import com.atm.sevices.OrderService;
import com.atm.sevices.ProductService;
import com.atm.utils.AtmUtils;

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
		if (user == null)
			return -1;

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
					order.getCartItems().add(new CartItem(0, p, 1, p.getPrice_remaining()));
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
			order.setPayment(0);

			return order.getTotal();

		} else {
			List<CartItem> lcartItems = cartItemService.addCartItem(id_product);
			String address = user != null ? user.getAddress() : "";
			UserOrder od = new UserOrder(orderid, lcartItems, 0, 0, 0, address, 0);// total,status,price

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
				c.setPrice(amount * c.getProduct().getPrice_remaining());
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

	/// payment vnpay
	@PostMapping("payment/vnpay")
	public String paymentVNPAY(@SessionAttribute(name = "order_session", required = false) UserOrder order,
			@SessionAttribute(name = "user", required = false) User user)
			throws NoSuchAlgorithmException, UnsupportedEncodingException {
		final String vnp_Version = "2.1.0";
		final String vnp_Command = "pay";
		String vnp_OrderInfo = "Thanh toán đơn hàng bằng VNPAY";
		String orderType = "250000";
		String vnp_TxnRef = order.getId() + "";
		final String vnp_IpAddr = "192.168.1.1";
		final String vnp_TmnCode = "D9MJUFM5";
		final String vnp_hashSecret = "UKHJNECSLUBBETVKEMVABTASUAVDYFDW";
		final String returnURL = "http://127.0.0.1:8080/invoice";

		int amount = order.getTotal_price();
//		System.out.println("getTotal_price: " + order.getTotal_price());
		HashMap<String, String> vnp_Params = new HashMap<>();
		vnp_Params.put("vnp_Version", vnp_Version);
		vnp_Params.put("vnp_Command", vnp_Command);
		vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
		vnp_Params.put("vnp_Amount", amount + "00");
//		System.out.println("amount: " + amount);
		vnp_Params.put("vnp_CurrCode", "VND");
//		vnp_Params.put("vnp_BankCode", "NCB");
		vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
		vnp_Params.put("vnp_OrderInfo", vnp_OrderInfo);
		vnp_Params.put("vnp_OrderType", orderType);

		vnp_Params.put("vnp_Locale", "vn");
		vnp_Params.put("vnp_ReturnUrl", returnURL);
		vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

		Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
		String vnp_CreateDate = formatter.format(cld.getTime());

		vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

		String vnp_PayUrl = "http://sandbox.vnpayment.vn/paymentv2/vpcpay.html";

		String vnp_SecureHash = vnp_hashSecret + AtmUtils.concatAllFields(vnp_Params);// hashData.toString();
		// encoding sha-256
		String encodedString = AtmUtils.encodeSHA256(vnp_SecureHash);
		String queryUrl = AtmUtils.concatAllFields(vnp_Params) + "&vnp_SecureHash=" + encodedString;

		String paymentUrl = vnp_PayUrl + "?" + queryUrl;
		System.out.println("paymentURL: " + paymentUrl);
		return "redirect:" + paymentUrl;
	}

	@GetMapping("/invoice")
	public ModelAndView invoice(@SessionAttribute(name = "order_session", required = false) UserOrder order,
			@SessionAttribute(name = "user", required = false) User user,
			@RequestParam(value = "vnp_PayDate", required = true) String vnp_PayDate, SessionStatus sessionStatus) {
		ModelAndView modelAndView = new ModelAndView("client/invoice");
		modelAndView.addObject("order", order);
		modelAndView.addObject("user", user);
		// xu ly date
		StringBuilder date = new StringBuilder(
				vnp_PayDate.substring(6, 8) + "/" + vnp_PayDate.substring(4, 6) + "/" + vnp_PayDate.substring(0, 4));
		StringBuilder time = new StringBuilder(
				vnp_PayDate.substring(8, 10) + ":" + vnp_PayDate.substring(10, 12) + ":" + vnp_PayDate.substring(12));
		modelAndView.addObject("date", date.toString());
		modelAndView.addObject("time", time.toString());
		order.setPayment(1);
		orderService.payment(order, user);
		sessionStatus.setComplete();
		return modelAndView;
	}
}
