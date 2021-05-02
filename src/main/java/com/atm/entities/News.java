package com.atm.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity(name = "tintuc")
@Data
@NoArgsConstructor
public class News {
	@Id
	private int id;
	@Column(name = "tieude")
	private String title;
	@Column(name = "anhmota")
	private String image;
	@Column(name = "mota")
	private String description;
	@Column(name = "ngayviet")
	private String byDate;
	@Column(name = "noidung")
	private String content;
	@Column(name = "loai")
	private int type;
}
