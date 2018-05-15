package org.iii.www.service;

import java.util.List;

import org.iii.www.dao.UserDao;
import org.iii.www.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("UserCrudImp")
@Transactional
public class UserCrudImp implements CrudServic<User>{
	@Autowired UserDao userDao;
	
	@Override
	public User getByid(Integer total_id) {
		
		return userDao.getPersonById(total_id);
	}

	@Override
	public List<User> getAll() {
		// TODO Auto-generated method stub
		return userDao.getAll();
	}

}
