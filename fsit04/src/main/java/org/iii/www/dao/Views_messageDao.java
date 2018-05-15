package org.iii.www.dao;

import java.util.ArrayList;
import java.util.Date;

import org.apache.catalina.User;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.www.entity.Views_message;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class Views_messageDao {
	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
	//新增一筆留言
	public void addViews_messageDao(Views_message vm) {
			vm.setDate(new Date());
			getSession().save(vm);
	}
	//取得某個景點的留言
	public ArrayList<Views_message> getViews_messageByIdDao(String total_id) {
		Session session =getSession();
		Query query =session.createQuery("FROM Views_message a WHERE a.total_id = "+total_id);
		ArrayList<Views_message> array = (ArrayList<Views_message>)query.list();
		return array;
	}
}
