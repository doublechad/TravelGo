package org.iii.www.dao;
import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.www.entity.Imgs;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ImgsDao {
	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
	
	public ArrayList<Imgs> getImgsById(Integer id) {
		System.out.println("test");
		Query query =getSession().createQuery("FROM Imgs WHERE total_id=?");
		query.setInteger(0, id);
		ArrayList<Imgs> img =(ArrayList<Imgs>)query.list();
		System.out.println("IMG SIZE"+img.size());
		return img;
	}
}
