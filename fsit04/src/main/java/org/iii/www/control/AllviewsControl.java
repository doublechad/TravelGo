package org.iii.www.control;

import javax.servlet.http.HttpServletRequest;

import org.iii.www.service.AllviewsService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AllviewsControl {
	@Autowired
	AllviewsService allviewsService;
	@RequestMapping(value="/Allviews",method=RequestMethod.POST)
	public String searchByParam(HttpServletRequest request,Model model) {
		String param =request.getParameter("param");
		System.out.println(param);
		JSONArray array =allviewsService.searchByParam(param);
		model.addAttribute("anwser", array);
		return "getMsg";
	}
	@RequestMapping("/getData")
	public String getAttractions() {
		
		
		return "getData";
	}
}
