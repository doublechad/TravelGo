package org.iii.www.entity;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;
	@Entity
	@Table(name="views_message")
	public class Views_message {
		private Integer id;
		private Date date;
		private Integer total_id;
		private String user_name;
		@Id
		@GeneratedValue(strategy= GenerationType.AUTO, generator="native")
		@GenericGenerator(name = "native", strategy = "native")
		public Integer getId() {
			return id;
		}
		public void setId(Integer id) {
			this.id = id;
		}
		@Column(name="date")
		public Date getDate() {
			return date;
		}
		public void setDate(Date date) {
			this.date = date;
		}
		@Column(name="total_id")
		public Integer getTotal_id() {
			return total_id;
		}
		public void setTotal_id(Integer total_id) {
			this.total_id = total_id;
		}
		@Column(name="user_name")
		public String getUser_name() {
			return user_name;
		}
		public void setUser_name(String user_name) {
			this.user_name = user_name;
		}
		@Column(name="msg")
		public String getMsg() {
			return msg;
		}
		public void setMsg(String msg) {
			this.msg = msg;
		}
		private String msg;
		
	}

