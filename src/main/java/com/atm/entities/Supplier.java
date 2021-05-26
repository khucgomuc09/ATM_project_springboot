package com.atm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity(name = "nhacungcap")
public class Supplier {
	@Id
	@Column(name = "manhacungcap")
	private String id;
	@Column(name = "tennhacungcap")
	private String name;
	@Column(name = "diachi")
	private String address;
}
