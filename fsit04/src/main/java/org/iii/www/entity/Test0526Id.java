package org.iii.www.entity;
// Generated 2018/5/26 �U�� 08:45:16 by Hibernate Tools 5.3.0.Beta2


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Proxy;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Test0526Id generated by hbm2java
 */
@Table(name="Test0526")
@Entity
@Proxy(lazy=false)
public class Test0526Id implements java.io.Serializable {

	private String uuid;
	private int id;
	private String name;
	private String text;
	

	public Test0526Id() {
	}

	public Test0526Id(String uuid, int id, String name, String text) {
		this.uuid = uuid;
		this.id = id;
		this.name = name;
		this.text = text;
	}
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO,generator="uuid")
	@GenericGenerator(name = "uuid", strategy = "uuid")
	public String getUuid() {
		return this.uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}
	@Column(name="ID")
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}
	@Column(name="NAME")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		System.out.println(name);
		this.name = "test";
	}
	@Column(name="TEXT")
	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	

	
	
	

}
