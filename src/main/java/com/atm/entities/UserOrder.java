package com.atm.entities;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "order_user")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserOrder {
	@Id
	@Column(name = "id")
//	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@OneToMany(fetch = FetchType.LAZY, cascade = { CascadeType.DETACH, CascadeType.PERSIST, CascadeType.REFRESH,
			CascadeType.REMOVE })
	@JoinColumn(name = "orderid")
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
