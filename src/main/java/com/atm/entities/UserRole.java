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
@Entity(name = "user_role")
public class UserRole {
	@Column
	@Id
	private int id;
	@Column
	private int user_id;
	@Column
	private int role_id;
}
