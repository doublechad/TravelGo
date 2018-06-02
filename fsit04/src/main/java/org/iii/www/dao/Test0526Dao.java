package org.iii.www.dao;

import java.util.ArrayList;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.iii.www.entity.Imgs;
import org.iii.www.entity.Test0526Id;
import org.iii.www.util.Test0526;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
@Transactional
@Repository
public class Test0526Dao<T>  {
	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
        return sessionFactory.getCurrentSession();
    }
	public boolean saveObject(Test0526Id tt) {
		//Transaction aa =getSession().beginTransaction();
		getSession().save(tt);
	//	aa.commit();
		return true;
	}
	public<T> T get() {
		
		return (T)getSession().load(Test0526Id.class, "40284682639c956501639c959a000000");
	}
}
