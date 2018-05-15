package org.iii.www.control;

import java.util.List;


import javax.servlet.http.HttpServletRequest;

import org.iii.www.entity.User;
import org.iii.www.entity.Userimgs;
import org.iii.www.service.UserService;
import org.iii.www.service.UserimgsService;
import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserimgsControl {

	@Autowired UserimgsService userimgsService;
	@Autowired UserService userService;
	
	@RequestMapping("/myMap")
	public String getUserimgsByUser(HttpServletRequest request,Model model) {
		User u1=(User)request.getSession(true).getAttribute("user");
		if(u1==null) {
			return "redirect:/";
		}else {
			Integer id =u1.getId();
			List<Userimgs> imgs =userimgsService.getUserimgsByUser(id);
			model.addAttribute("imgs", imgs);
			return "/myMap";
		}
	}
	//足跡地圖使用
	@RequestMapping("/userimgs")
	public String UserimgsByUser(HttpServletRequest request,Model model) {
		User u1=(User)request.getSession(true).getAttribute("user");
		if(u1==null) {
			Integer id =Integer.parseInt(request.getParameter("user_id"));
			JSONArray imgs =userimgsService.userimgsByUser(id);
			model.addAttribute("anwser", imgs);
		}else {
			Integer id =u1.getId();
			JSONArray imgs =userimgsService.userimgsByUser(id);
			model.addAttribute("anwser", imgs);
		}
		return "getMsg";
	}
	@RequestMapping(value="/deletuserimgs",method =RequestMethod.POST)
	public String deletUserimgs(HttpServletRequest request,Model model) {
		try {			
			model.addAttribute("anwser",userimgsService.deleteUserimgs(request));
			return "getMsg";
		} catch (JSONException e) {
			System.out.println(e.toString());
			model.addAttribute("anwser", e.toString());	
			return "getMsg";
		}
		
	}
	
	
	
}
