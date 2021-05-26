package com.atm.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.atm.entities.Product;
import com.atm.entities.ProductDetail;
import com.atm.entities.Supplier;
import com.atm.entities.User;
import com.atm.sevices.AdminService;
import com.atm.sevices.OrderService;
import com.atm.sevices.ProductService;
import com.atm.sevices.SupplierService;
import com.atm.sevices.UserService;

@Controller
@RequestMapping("admin")
public class AdminController {
	@Autowired
	private ProductService productservice;

	@Autowired
	private SupplierService supplierService;

	@Autowired
	private AdminService adminService;

	@Autowired
	private OrderService orderService;
	@Autowired
	private UserService userService;

	@GetMapping({ "", "/index" })
	public String index(@SessionAttribute(name = "user", required = false) User user, ModelMap modelMap) {
		if (user != null)
			modelMap.addAttribute(user);

		return "admin/index";
	}

	// product manage
	@GetMapping("products_manage")
	public ModelAndView productManage(Pageable pageable) {
		ModelAndView modelAndView = new ModelAndView("admin/product_manager");
		List<Product> p = productservice.getAllProduct();
//		p.forEach(System.out::println);
//		productservice.getAllProduct();
		modelAndView.addObject("products", p);
		return modelAndView;
	}

	@GetMapping("edit_product/{id}")
	public ModelAndView editProduct(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("admin/product_edit");
		Product product = productservice.getProductById(id);
		System.out.println(product.getName() + " - " + product.getSupplier());
		List<Supplier> listSupplier = supplierService.getAllSuppliers();
		System.out.println(listSupplier.get(0).getName());
		modelAndView.addObject("product", product);
		modelAndView.addObject("suppliers", listSupplier);
		return modelAndView;
	}

	@PostMapping("update_product")
	public String updateProduct(@ModelAttribute Product product, @ModelAttribute ProductDetail productDetail) {
		System.out.println(product);
		System.out.println(productDetail);
		adminService.updateProduct(product, productDetail);
		return "redirect:products_manage";
	}

	// order manage
	@GetMapping("order_manage")
	public ModelAndView orderManage() {
		ModelAndView modelAndView = new ModelAndView("admin/order_manage");

//		modelAndView.addObject("orders", orderService.getAllOrder());
		modelAndView.addObject("list_users", userService.getAllUsers());
		return modelAndView;
	}

	@PostMapping("delete_order/{id}")
	public String deleteOrder(@PathVariable int id) {
		orderService.deleteOrder(id);
		return "redirect:../order_manage";
	}

	@PostMapping("cf_order")
	@ResponseBody
	public String cf_order(@RequestParam int id_order) {
		System.out.println("cf_order " + id_order);
		orderService.cf_order(id_order);
		return "1";
	}
}
