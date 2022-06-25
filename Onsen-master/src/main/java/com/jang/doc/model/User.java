package com.jang.doc.model;

import javax.validation.constraints.NotEmpty;

public class User {

	@NotEmpty(message = "ID�� �Էµ��� �ʾҽ��ϴ�.!")
	private String id;
	@NotEmpty(message = "�н����尡 �Էµ��� �ʾҽ��ϴ�!!!")
	private String pass;
	@NotEmpty(message = "�̸��� �Էµ��� �ʾҽ��ϴ�.!")
	private String name;
	@NotEmpty(message = "�����ȣ�� �Էµ��� �ʾҽ��ϴ�.!")
	private String zip;
	@NotEmpty(message = "�ּҰ� �Էµ��� �ʾҽ��ϴ�.!")
	private String addr1;
	@NotEmpty(message = "���ּҰ� �Էµ��� �ʾҽ��ϴ�.!")
	private String addr2;
	@NotEmpty(message = "��ȭ��ȣ�� �Էµ��� �ʾҽ��ϴ�.!")
	private String phone;
	@NotEmpty(message = "�̸����� �Էµ��� �ʾҽ��ϴ�.!")
	private String email;

	private String no;

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", pass=" + pass + ", name=" + name + ", zip=" + zip + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", phone=" + phone + ", email=" + email + ", no=" + no + "]";
	}

}
