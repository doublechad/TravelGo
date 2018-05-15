package org.iii.www.service;

import java.util.List;

import org.iii.www.dao.UserDao;
import org.iii.www.dao.User_favoriteDao;
import org.iii.www.entity.Allviews;
import org.iii.www.entity.User_favorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("User_favoriteService")
@Transactional
public class User_favoriteService {
	@Autowired
    private User_favoriteDao user_favoriteDao;
	public void deleteUser_favoriteById(String user_id,String total_id) {
		user_favoriteDao.deleteUser_favoriteById(user_id, total_id);
	}
	
	public List<Allviews> getFavoriteByID(String user_id){
		Integer u_id =Integer.parseInt(user_id);
		return user_favoriteDao.getUser_favoriteById(u_id);
		
	}
	
}
