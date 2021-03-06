package com.shop.model;

import java.sql.Timestamp;

public class User {
	public Long id;
	public String name;
	public String password;
	public String email;
	public String address;
	public String postelcode;
	public Timestamp date;

	public Timestamp getDate() {
		return date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPostelcode() {
		return postelcode;
	}

	public void setPostelcode(String postelcode) {
		this.postelcode = postelcode;
	}

}
