package org.iii.www.dao;

import java.util.ArrayList;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.metamodel.binding.HibernateTypeDescriptor;
import org.iii.www.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Repository
public class UserDao {
	 @Autowired
	 private SessionFactory sessionFactory;
	 
	 private Session getSession(){
	        return sessionFactory.getCurrentSession();
	    }
	 public java.util.List<User> getAll(){
		 return (java.util.List<User>)getSession().createQuery("FROM User").list();
	 }
	 public User getPersonById(Integer id){
	        return (User)getSession().get(User.class, id);
	 }
	 //註冊會員
	 public void reigister(User user) {
		 getSession().save(user);
	 }
	 public void updateUser(User user) {
		User u1 = getPersonById(user.getId());
		if(!user.getMail().equals(""))u1.setMail(user.getMail());
		if(!user.getName().equals(""))u1.setName(user.getName());
		getSession().save(u1);
	 }
	 //從資料庫中取出會員資料
	 public User getUserByemail(String email) {
		System.out.println(email);
		String sql = "SELECT * From user  WHERE mail = ?";
		SQLQuery query = getSession().createSQLQuery(sql);
		query.setString(0, email);
		query.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP);
		java.util.List data = (java.util.List) query.list();
		User u1 =new User();
        for(Object object : data){
           Map row = (Map)object;
           u1.setId((Integer)row.get("id"));
           u1.setMail(row.get("mail").toString());
           u1.setPassword(row.get("password").toString());
           u1.setName(row.get("name").toString());
        }
        return (data.size()==0)? null: u1;
		
	 }

}
