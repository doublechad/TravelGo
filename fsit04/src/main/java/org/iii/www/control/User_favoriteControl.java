package org.iii.www.control;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.www.dao.User_favoriteDao;
import org.iii.www.entity.User;
import org.iii.www.entity.User_favorite;
import org.iii.www.service.UserService;
import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class User_favoriteControl {
	@Autowired
	private User_favoriteDao user_favoriteDao;
	//取得我的最愛
	@RequestMapping(value = "/User_favorite", method = RequestMethod.GET)
	public String getUser_favorite(HttpServletRequest request,HttpServletResponse response) {
		return "getFavorite";
	}
	//新增我的最愛
	@RequestMapping(value = "/User_favorite", method = RequestMethod.POST)
	public String addUser_favorite(HttpServletRequest request,Model model) {
		if(checkUserSession(request)) {
			User u1 =(User)request.getSession(false).getAttribute("user");
			String anwser = user_favoriteDao.addUser_favoriteById(request.getParameter("total_id"), u1.getId()+"");
			model.addAttribute("anwser", anwser);
			return "getMsg";
		}else {			
			String anwser =user_favoriteDao.addUser_favoriteById(request);
			model.addAttribute("anwser", anwser);
			return "getMsg";
		}
		
		
	}
	//刪除我的最愛
	@RequestMapping(value = "/User_favorite", method = RequestMethod.DELETE)
	public String deleteUser_favorite(HttpServletRequest request,Model model) {
		System.out.println("GET DELETE");
		if(checkUserSession(request)) {
			User u1 =(User)request.getSession(false).getAttribute("user");
			System.out.println(request.getParameter("total_id"));
			user_favoriteDao.deleteUser_favoriteById(u1.getId()+"",request.getParameter("total_id") );			
			return "getMsg";
		}else {
		String user_id = request.getParameter("user_id");
		String total_id = request.getParameter("total_id");
		user_favoriteDao.deleteUser_favoriteById(user_id, total_id);
		return "getMsg";
		}
	}
	//確認是否有會員登入
		private boolean checkUserSession(HttpServletRequest request) {
			return (request.getSession(true).getAttribute("user")==null)?false:true;
		}
}
