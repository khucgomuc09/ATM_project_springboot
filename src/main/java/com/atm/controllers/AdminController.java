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
		modelAndView.addObject("products", p);
		return modelAndView;
	}

	@GetMapping("edit_product/{id}")
	public ModelAndView editProduct(@PathVariable("id") int id) {
		ModelAndView modelAndView = new ModelAndView("admin/product_edit");
		Product product = productservice.getProductById(id);
//		System.out.println(product.getName() + " - " + product.getSupplier());
		List<Supplier> listSupplier = supplierService.getAllSuppliers();
//		System.out.println(listSupplier.get(0).getName());
		modelAndView.addObject("product", product);
		modelAndView.addObject("suppliers", listSupplier);
		return modelAndView;
	}

	@PostMapping("update_product")
	public String updateProduct(@ModelAttribute Product product, @ModelAttribute ProductDetail productDetail) {
//		System.out.println(product);
//		System.out.println(productDetail);
		adminService.updateProduct(product, productDetail);
		return "redirect:products_manage";
	}

// order manage
	@GetMapping("order_manage")
	public ModelAndView orderManage() {
		ModelAndView modelAndView = new ModelAndView("admin/order_manage");

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
//		System.out.println("cf_order " + id_order);
		orderService.cf_order(id_order);
		return "1";
	}

// user manage
	@GetMapping("user_manage")
	public ModelAndView userManage() {
		ModelAndView modelAndView = new ModelAndView("admin/account_manage");
		modelAndView.addObject("list_user", userService.getAllUsers());

		return modelAndView;
	}

	@PostMapping("create_user")
	public String createUser(@ModelAttribute User user) {
		userService.createUser(user);
		return "redirect:user_manage";
	}

	@GetMapping("edit_user/{id}")
	public ModelAndView editUser(@PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("admin/account_edit");
		modelAndView.addObject(userService.getUserbyID(id));
		return modelAndView;
	}

	@PostMapping("edit_user")
	public String editUser(@ModelAttribute User user) {
//		System.out.println(user);
		userService.editUSer(user);
		return "redirect:user_manage";
	}

	@PostMapping("delete_user/{id}")
	public String deleteUSer(@PathVariable int id) {
//		System.out.println("id -" + id);
		userService.deleteUser(id);
		return "redirect:../user_manage";
	}

// supplier manage
	@GetMapping("supplier_manage")
	public ModelAndView supplier() {
		ModelAndView modelAndView = new ModelAndView("admin/supplier_manage");
		modelAndView.addObject("list_suppliers", supplierService.getAllSuppliers());
		return modelAndView;
	}

	@PostMapping("create_supplier")
	public String createSupplier(@ModelAttribute Supplier supplier) {
		supplierService.createSupplier(supplier);
		return "redirect:supplier_manage";
	}

	@GetMapping("edit_supplier/{id}")
	public ModelAndView editSupplier(@PathVariable String id) {
		ModelAndView modelAndView = new ModelAndView("admin/edit_supplier");
		modelAndView.addObject(supplierService.getSupplierByID(id));
		return modelAndView;
	}

	@PostMapping("edit_supplier/{id}")
	public String editSupplier(@ModelAttribute Supplier supplier, @PathVariable String id) {
//		System.out.println(id);
		supplierService.editSupplier(id, supplier);
		return "redirect:../../admin/supplier_manage";
	}

	@PostMapping("delete_supplier/{id}")
	public String deleteSupplier(@PathVariable String id) {
		supplierService.removeSupplier(id);
		return "redirect:../../admin/supplier_manage";
	}

}
