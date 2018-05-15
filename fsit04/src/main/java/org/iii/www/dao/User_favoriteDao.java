package org.iii.www.dao;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.www.entity.Allviews;
import org.iii.www.entity.User;
import org.iii.www.entity.User_favorite;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class User_favoriteDao {
	 @Autowired
	    private SessionFactory sessionFactory;
	 
	 private Session getSession(){
	        return sessionFactory.getCurrentSession();
	    }	
	    public ArrayList<Allviews> getUser_favoriteById(Integer id){
	    	ArrayList<User_favorite> array =(ArrayList<User_favorite>)this.getSession().createQuery("From User_favorite uf where uf.user.id=?").setParameter(0, id).list();
	    	ArrayList<Allviews> a1 =new ArrayList<>();
	    	for(User_favorite uf:array) {
	    		Allviews avs =(Allviews)getSession().load(Allviews.class, uf.getTotal_id());
	    		a1.add(avs);
	    	}
	    	return a1;
	    }
	    //新增我的最愛
	    public String addUser_favoriteById(HttpServletRequest request) {
	    	if(request.getParameter("user_id")!=null&&request.getParameter("total_id")!=null) {
		    	Session session =this.getSession();
		    	Integer total_id = Integer.parseInt(request.getParameter("total_id"));
		    	Integer user_id = Integer.parseInt(request.getParameter("user_id"));
		    	User user =(User) session.load(User.class, user_id);
		    	Query query =session.createQuery("FROM User_favorite a WHERE a.total_id="+total_id+" AND a.user.id="+user_id);
		    	if(query.list().size()==0) {
		    		System.out.println("OK");
		    		User_favorite uf = new User_favorite();
		    		uf.setTotal_id(total_id);
		    		uf.setUser(user);
		    		session.saveOrUpdate(uf);
		    		}
		    	return "OK";
	    	}else {
	    		return "error";
	    	}
	    	
	    }
	  //新增我的最愛
	    public String addUser_favoriteById(String total_id,String user_id) {
	    	Session session =this.getSession();
	    	Integer t_id = Integer.parseInt(total_id);
	    	Integer u_id = Integer.parseInt(user_id);
	    	User user =(User) session.load(User.class, u_id);
	    	Query query =session.createQuery("FROM User_favorite a WHERE a.total_id="+total_id+" AND a.user.id="+user_id);
	    	if(query.list().size()==0) {
	    		System.out.println("OK");
	    		User_favorite uf = new User_favorite();
	    		uf.setTotal_id(t_id);
	    		uf.setUser(user);
	    		session.saveOrUpdate(uf);
	    		return "ok";
	    	}else{
	    		return "已經加入囉";
	    	}
	    	
	    }
	    //刪除我的最愛
	    public void deleteUser_favoriteById(String user_id,String total_id) {
	    	System.out.println("delete");
	    	Session session =this.getSession();
	    	Query query = session.createQuery("from User_favorite a where a.user.id="+user_id +"AND a.total_id="+total_id);
	    	ArrayList<User_favorite> uf =(ArrayList<User_favorite>)query.list();
	    	if(!uf.isEmpty())session.delete(uf.get(0));
	    	
	    }
}
