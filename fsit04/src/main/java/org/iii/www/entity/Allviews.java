package org.iii.www.entity;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Proxy;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="allviews")
@Proxy(lazy=false)
public class Allviews implements Serializable{
	private Integer total_id;
	private String type;
	private String cat2;
	private String memo_time;
	private String stitle;
	private String xbody;
	private String address;
	private Double lat;
	private Double lng;
	private String phone;
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO, generator="native")
	@GenericGenerator(name = "native", strategy = "native")
	public Integer getTotal_id() {
		return total_id;
	}
	public void setTotal_id(Integer total_id) {
		this.total_id = total_id;
	}
	@Column(name="type")
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Column(name="stitle")
	public String getStitle() {
		return stitle;
	}
	@Column(name="CAT2")
	public String getCat2() {
		return cat2;
	}
	public void setCat2(String cat2) {
		this.cat2 = cat2;
	}
	@Column(name="MEMO_time")
	public String getMemo_time() {
		return memo_time;
	}
	public void setMemo_time(String memo_time) {
		this.memo_time = memo_time;
	}
	public void setStitle(String stitle) {
		this.stitle = stitle;
	}
	@Column(name="xbody")
	public String getXbody() {
		return xbody;
	}
	public void setXbody(String xbody) {
		this.xbody = xbody;
	}
	@Column(name="address")
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Column(name="lat")
	public Double getLat() {
		return lat;
	}
	public void setLat(Double lat) {
		this.lat = lat;
	}
	@Column(name="lng")
	public Double getLng() {
		return lng;
	}
	public void setLng(Double lng) {
		this.lng = lng;
	}
	@Column(name="phone")
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	private List<Imgs> imgs;
	//關聯主鍵對應到Imgs.class 的 allviews屬性 
	@OneToMany(targetEntity=Imgs.class, mappedBy="allviews", fetch=FetchType.EAGER ,cascade = CascadeType.ALL)
	public List<Imgs> getImgs() {
		return imgs;
	}
	public void setImgs(List<Imgs> imgs) {
		this.imgs = imgs;
	}
	private List<Userimgs> userimgs;
	//關聯主鍵對應到Userimgs.class 的 allviews屬性 
	@OneToMany(targetEntity=Userimgs.class, mappedBy="allviews", fetch=FetchType.LAZY ,cascade = CascadeType.ALL)
	public List<Userimgs> getUserimgs() {
		return userimgs;
	}
	public void setUserimgs(List<Userimgs> userimgs) {
		this.userimgs = userimgs;
	}
	
	
}
