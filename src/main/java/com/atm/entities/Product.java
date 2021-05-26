package com.atm.entities;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "sanpham")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Product {
	@Id
	@Column(name = "masanpham")
	private int id;

	@Column(name = "tensanpham")
	private String name;

	@Column(name = "nhacungcap")
	private String supplier;

	@Column(name = "giadagiam")
	private int price_remaining;

	@Column(name = "giaban")
	private int price;

	@Column(name = "soluong")
	private int amount;

	@Column(name = "hinhanh")
	private String image;

	@Column(name = "trangthai")
	private int status;

	@Column(name = "loaisanpham")
	private int product_type;

	@OneToOne(mappedBy = "product", cascade = CascadeType.ALL)
	@PrimaryKeyJoinColumn
	private ProductDetail productDetail;

//	@OneToMany(mappedBy = "product", cascade = { CascadeType.REFRESH, CascadeType.PERSIST })
//	private List<CartItem> cartItems;

}
