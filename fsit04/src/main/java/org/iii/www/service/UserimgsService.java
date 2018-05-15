package org.iii.www.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.iii.www.dao.AllviewsDao;
import org.iii.www.dao.UserDao;
import org.iii.www.dao.UserimgsDao;
import org.iii.www.entity.User;
import org.iii.www.entity.Userimgs;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@Service("UserimgsService")
@Transactional
public class UserimgsService {
	@Autowired UserimgsDao userimgsDao;
	@Autowired AllviewsDao allviewsDao;
	@Autowired UserDao userDao;
	//存檔
	public void saveUserimgs(HttpServletRequest request,String[] filePath) {
		for(String path : filePath) {
			Userimgs u1 =new Userimgs();
			u1.setUser(userDao.getPersonById(Integer.parseInt(request.getParameter("user_id"))));
			u1.setAllviews(allviewsDao.getAllviewByid(Integer.parseInt(request.getParameter("total_id"))));
			u1.setLat(Double.parseDouble(request.getParameter("lat")));
			u1.setLng(Double.parseDouble(request.getParameter("lng")));
			u1.setUploadtime(new Date());
			u1.setFilepath(path);
			userimgsDao.saveUserimgs(u1);
		}
		
	}
	public List<Userimgs> getAll(){
		return userimgsDao.getAll();
	}
	//從使用者取得相片
	public List<Userimgs> getUserimgsByUser(Integer id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		User u1 =userDao.getPersonById(id);
		List<Userimgs> imgs =u1.getUserimgs();
		return (imgs.size()!=0)?imgs:null;
	}
	public JSONArray userimgsByUser(Integer id) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		User u1 =userDao.getPersonById(id);
		List<Userimgs> imgs =u1.getUserimgs();
		JSONArray array =new JSONArray();
		for(Userimgs ui :imgs) {
			JSONObject ob1 =new JSONObject();
			try {
				ob1.put("id", ui.getId());
				ob1.put("name", ui.getUser().getName());
				ob1.put("stitle", ui.getAllviews().getStitle());
				ob1.put("filepath", ui.getFilepath());
				ob1.put("lat", ui.getLat());
				ob1.put("lng", ui.getLng());
				ob1.put("uploadtime", sdf.format(ui.getUploadtime()));
				array.put(ob1);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return (imgs.size()!=0)?array:null;
	}
	public String deleteUserimgs(HttpServletRequest request) throws JSONException {
		String t_arry =request.getParameter("total_id");
		JSONArray array= new JSONArray(t_arry);		
		ArrayList<Integer> t_id =new ArrayList<>();
		for(int i=0;i<array.length();i++){			
			String temp =array.getString(i).trim();
			t_id.add(Integer.parseInt(temp));
		}
		return userimgsDao.deleteUserimgs(t_id);
	}
}
