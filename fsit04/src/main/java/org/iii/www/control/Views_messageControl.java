package org.iii.www.control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.iii.www.dao.Views_messageDao;
import org.iii.www.entity.User;
import org.iii.www.entity.Views_message;
import org.iii.www.service.UserService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class Views_messageControl {
	@Autowired
	private Views_messageDao views_messageDao;
	
	//增加留言
	@RequestMapping(value="/Views_message" ,method = RequestMethod.POST)
	public String addViews_message(@ModelAttribute Views_message vm,Model model) {	
		System.out.println("addViews_message");
		model.addAttribute("vm",vm);
		views_messageDao.addViews_messageDao(vm);
		return "test";
	}
	
	//查詢地點的留言
	@RequestMapping(value="/Views_message" ,method = RequestMethod.GET)
	public String getViews_message(String total_id,Model model) {	
			System.out.println("getViews_message"+total_id);
			ArrayList<Views_message> array =views_messageDao.getViews_messageByIdDao(total_id);
			JSONArray anwser =new JSONArray(array);
			model.addAttribute("anwser", anwser);
			return "getMsg";
		}
	
}
