package com.atm.sevices;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atm.entities.Product;
import com.atm.entities.ProductDetail;
import com.atm.repositories.ProductDetailRepository;
import com.atm.repositories.ProductRepository;
import com.atm.repositories.UserRepository;

@Service
public class AdminService {
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private ProductRepository productRepository;
	@Autowired
	private ProductDetailRepository productDetailRepository;

	public boolean updateProduct(Product p, ProductDetail pd) {
//		p.setProductDetail(pd);
		Product pro = productRepository.getOne(p.getId());
		pro.setAmount(p.getAmount());
		pro.setImage(p.getImage());
		pro.setName(p.getName());
		pro.setPrice(p.getPrice());
		pro.setPrice_remaining(p.getPrice_remaining());
		pro.setProduct_type(p.getProduct_type());
		pro.setSupplier(p.getSupplier());
		pro.setStatus(p.getStatus());
		ProductDetail proDetail = productDetailRepository.getOne(pd.getId());
		proDetail.setCamera(pd.getCamera());
		proDetail.setCpu(pd.getCpu());
		proDetail.setDanhgia(pd.getDanhgia());
		proDetail.setGift(pd.getGift());
		proDetail.setMonitors(pd.getMonitors());
		proDetail.setOs(pd.getOs());
		proDetail.setPin(pd.getPin());
		proDetail.setProduct(pro);
		proDetail.setRam(pd.getRam());
		proDetail.setRating(pd.getRating());

		pro.setProductDetail(proDetail);
		productRepository.save(pro);
//		productDetailRepository.save(proDetail);
		return true;
	}
}
