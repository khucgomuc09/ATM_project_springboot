package com.atm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@Entity(name = "chitietsanpham")
public class ProductDetail {
	@Id
	@Column(name = "masanpham")
	private int id;
	@Column(name = "danhgia")
	private int danhgia;
	@Column(name = "xephang")
	private int rating;
	@Column(name = "quatang")
	private String gift;
	@Column(name = "manhinh")
	private String monitors;
	@Column(name = "hedieuhanh")
	private String os;
	@Column(name = "cpu")
	private String cpu;
	@Column(name = "ram")
	private String ram;
	@Column(name = "camera")
	private String camera;
	@Column(name = "pin")
	private String pin;

	@OneToOne
	@MapsId
	@JoinColumn(name = "masanpham")
	private Product product;

}
