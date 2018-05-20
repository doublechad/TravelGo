package org.iii.www.service;

import java.util.List;

import org.iii.www.dao.UserDao;
import org.iii.www.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("UserCrudImp")
@Transactional
public class UserCrudImp<T> implements CrudServic<T>{
	@Autowired UserDao userDao;
	
	private Class<T> x;
	
	public void setType(String x) {
		
		
	}
	@Override
	public T getByid(Integer total_id) {
		
		return (T)userDao.getPersonById(total_id);
	}

	@Override
	public List<T> getAll() {
		// TODO Auto-generated method stub
		return (List<T>)userDao.getAll();
	}

}
