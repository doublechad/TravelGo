package org.iii.www.service;

import java.util.List;

import org.iii.www.dao.AllviewsDao;
import org.iii.www.dao.UserDao;
import org.iii.www.entity.Allviews;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("AllviewsCrudImp")
@Transactional
public class AllviewsCrudImp<T> implements CrudServic<T>{
	@Autowired AllviewsDao allviewsDao;
	
	private Class<T> x;
	
	public void setType(String x) {
		try {
			this.x=(Class<T>) Class.forName(x);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	@Override
	public T getByid(Integer total_id) {
		return (T) allviewsDao.getAllviewByid(total_id);
	}

	@Override
	public List<T> getAll() {
		// TODO Auto-generated method stub
		return (List<T>) allviewsDao.getAllview();
	}
}
