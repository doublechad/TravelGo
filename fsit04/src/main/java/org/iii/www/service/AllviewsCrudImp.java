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
public class AllviewsCrudImp implements CrudServic<Allviews>{
	@Autowired AllviewsDao allviewsDao;

	@Override
	public Allviews getByid(Integer total_id) {
		return allviewsDao.getAllviewByid(total_id);
	}

	@Override
	public List<Allviews> getAll() {
		// TODO Auto-generated method stub
		return allviewsDao.getAllview();
	}
}
