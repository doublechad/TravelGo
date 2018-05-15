package org.iii.www.control;

import org.iii.www.service.RestaurantService;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RestaruantControll {
	@Autowired
	RestaurantService restaurantService;
	
	//取得餐廳資料
	@RequestMapping("/restaruant")
	public String  getRestaruant(Model model) {
		JSONArray anwser =restaurantService.getRestaurant();
		model.addAttribute("anwser", anwser);
		return "getMsg";
	}
	
}
