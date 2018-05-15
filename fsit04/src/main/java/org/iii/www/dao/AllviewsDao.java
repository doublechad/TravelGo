package org.iii.www.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.www.entity.Allviews;
import org.iii.www.entity.Imgs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AllviewsDao {
	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
	public ArrayList<Allviews> searchByParam(String param) {
		String strSQL="from Allviews as a where a.stitle like :name ";   
	    Query query = getSession().createQuery(strSQL);   
	    query.setString("name", "%"+param+"%");
		ArrayList<Allviews> allviews =(ArrayList<Allviews>)query.list();
		return allviews;
	}
	
	public Allviews getAllviewByid(Integer total_id) {
		return (Allviews)getSession().load(Allviews.class, total_id);
	}
	public ArrayList<Allviews> getAllview() {
		Query query =getSession().createQuery("FROM Allviews");
		ArrayList<Allviews> array =(ArrayList<Allviews>)query.list();
		return array;
	}
}
