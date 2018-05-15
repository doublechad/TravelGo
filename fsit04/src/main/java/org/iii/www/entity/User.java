package org.iii.www.entity;

import java.util.List;

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

@Entity
@Table(name="user")
public class User {
	
    private Integer id;
    private String mail;
    private String password;
    private String name;    
    private String type;
    @Column(name="type")
  public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	@Id
	@GeneratedValue(strategy= GenerationType.AUTO, generator="native")
	@GenericGenerator(name = "native", strategy = "native")
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	 @Column(name="mail")
	public String getMail() {
		return mail;
	}

	public void setMail(String email) {
		this.mail = email;
	}
	 @Column(name = "password")
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	  @Column(name="name")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	private List<Userimgs> userimgs;
	//關聯主鍵對應到Userimgs.class 的 user屬性 
	@OneToMany(targetEntity=Userimgs.class, mappedBy="user", fetch=FetchType.LAZY ,cascade = CascadeType.ALL)
	public List<Userimgs> getUserimgs() {
		return userimgs;
	}

	public void setUserimgs(List<Userimgs> userimgs) {
		this.userimgs = userimgs;
	}
	private List<User_favorite> user_favorites;
	@OneToMany(targetEntity=User_favorite.class, mappedBy="user", fetch=FetchType.LAZY ,cascade = CascadeType.ALL)
	public List<User_favorite> getUser_favorites() {
		return user_favorites;
	}

	public void setUser_favorites(List<User_favorite> user_favorites) {
		this.user_favorites = user_favorites;
	}
	
}
