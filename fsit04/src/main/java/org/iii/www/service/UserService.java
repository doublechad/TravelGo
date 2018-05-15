package org.iii.www.service;

import org.iii.www.dao.UserDao;
import org.iii.www.entity.User;
import org.iii.www.util.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("UserService")
@Transactional
public class UserService {
	@Autowired
    private UserDao userDao;
	
	
    public User getPersonById(Integer id){
        return userDao.getPersonById(id);
    }
    public void reigister(User user) {
    	String newpassed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());	
    	user.setPassword(newpassed);
    	userDao.reigister(user);
    }
    public User checkUser(String email) {
    	User u1 =userDao.getUserByemail(email);   	
    	return u1;
    }
    public void updateUser(User user) {
    	userDao.updateUser(user);
    	
    }
}
