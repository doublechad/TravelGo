package org.iii.www.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.iii.www.entity.Userimgs;
import org.iii.www.util.JDBCsupportMe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository

public class UserimgsDao {
	@Autowired
	 private SessionFactory sessionFactory;
	 private Session getSession(){
	        return sessionFactory.getCurrentSession();
	    }
	 public List<Userimgs> getAll() {
		 Query query =getSession().createQuery("FROM Userimgs");
		 List<Userimgs> list=query.list();
		 return list;
	 }
	 public void saveUserimgs(Userimgs userimgs) {
		 getSession().save(userimgs);
	 }
	 public String deleteUserimgs(ArrayList<Integer> aa) {
		 System.out.println("OK");
		 Connection dataBase =JDBCsupportMe.getConnection();
		 String sql="delete from userimgs where id = ?";
		 try {
			PreparedStatement ps = dataBase.prepareStatement(sql);
			for(Integer a: aa) {
				ps.setInt(1, a);
				ps.addBatch();
			}
			int[] anwser=ps.executeBatch();
			System.out.println("OK");
			return "ok "+anwser.length;
		} catch (SQLException e) {
			System.out.println(e.toString());
			return e.toString();
		}
		
		 
		 
	 }
	
}
