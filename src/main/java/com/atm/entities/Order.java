package com.atm.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

@Entity(name = "order")
@Data
@NoArgsConstructor
@AllArgsConstructor
//@RequiredArgsConstructor
public class Order {
	@Id
	@Column(name = "id")
	private int id;

//	@ManyToOne(fetch = FetchType.LAZY)
//	@JoinColumn(name = "user_id")
//	private User user;

	@OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
	@JoinColumn(name = "id")
	private List<CartItem> cartItems;

	@Column(name = "total")
	private int total;
	@Column(name = "status")
	private int status;
	@Column(name = "total_price")
	private int total_price;
	@Column(name = "delivery_address")
	private String delivery_address;
}
