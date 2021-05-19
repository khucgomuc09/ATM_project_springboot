package com.atm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "cartitem")
public class CartItem {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "productid", referencedColumnName = "masanpham") // , referencedColumnName = "masanpham"
//	@Column(name = "productid")
	private Product product;

//	@ManyToOne(fetch = FetchType.LAZY,targetEntity = Order.class)
//	@JoinColumn(name = "orderid", referencedColumnName = "id") // , referencedColumnName = "id"
//	private Order order;

	@Column(name = "quantity")
	private int quantity;
	@Column(name = "price")
	private int price;
}
