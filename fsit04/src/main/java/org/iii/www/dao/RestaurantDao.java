package org.iii.www.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.www.entity.Restaurant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class RestaurantDao {
	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
	//取得全部的餐廳
	public ArrayList<Restaurant> getRestaurant() {
		Query query=getSession().createQuery("FROM Restaurant");
		ArrayList<Restaurant> list =(ArrayList<Restaurant>) query.list();
		return list;
	}
}
