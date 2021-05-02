package com.atm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;

@Data
@Entity
public class User {
	@Id
	private int id;
	@Column
	private String username;
	@Column
	private String password;
	@Column
	private String fullname;
	@Column
	private String gender;
	@Column
	private String email;
	@Column
	private String phone;
	@Column
	private String address;
	@Column
	private int level;
	@Column
	private String avatar;

}
