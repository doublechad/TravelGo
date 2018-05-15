package org.iii.www.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.hibernate.annotations.Proxy;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="imgs")
@Proxy(lazy=false)
public class Imgs {
	 private Integer id;
	 private String description;
	 private String url;

	@Id
	@GeneratedValue(strategy= GenerationType.AUTO, generator="native")
	@GenericGenerator(name = "native", strategy = "native")
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	@Column(name="description")
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	@Column(name="url")
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	//total_id這個欄位外鍵關聯到Allviews這張表的total_id
	private Allviews allviews;
	@ManyToOne
	@JoinColumn(name="total_id",nullable=false)
	public Allviews getAllviews() {
		return allviews;
	}
	public void setAllviews(Allviews allviews) {
		this.allviews = allviews;
	}
	@Override
	public String toString() {
		
		 return "Imgs [id=" + id + ", description=" + description + ", url" + url +"]";
	}
}
