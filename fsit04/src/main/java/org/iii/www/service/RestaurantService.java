package org.iii.www.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.iii.www.dao.ImgsDao;
import org.iii.www.dao.RestaurantDao;
import org.iii.www.entity.Imgs;
import org.iii.www.entity.Restaurant;
import org.json.JSONArray;
import org.springframework.beans.factory.BeanFactoryUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("RestaurantService")
@Transactional
public class RestaurantService {
	@Autowired
	RestaurantDao restaurantDao;
	@Autowired
	ImgsDao imgsDao;
	
	public JSONArray getRestaurant(){
		ArrayList<Restaurant> list =restaurantDao.getRestaurant();
		ArrayList<HashMap> array =new ArrayList<>();
		for(Restaurant re : list) {
			System.out.println(re.getTotal_id());
			HashMap<String,Object> m1 =new HashMap<>();
			ArrayList<Imgs> theImg = imgsDao.getImgsById(re.getTotal_id());
			m1.put("total_id",re.getTotal_id());
			m1.put("CAT2",re.getCat2());
			m1.put("stitle",re.getStitle());
			m1.put("xbody","");
			m1.put("type","restaurant");
			m1.put("MEMO_TIME","");
			m1.put("address",re.getAddress());
			m1.put("phone",re.getPhone());
			m1.put("lat", re.getLat());
			m1.put("lng", re.getLng());
			JSONArray temp =new JSONArray();
			for(Imgs a: theImg) {
				HashMap<String, Object> m2 =new HashMap<>();
				m2.put("url", a.getUrl());
				m2.put("description", a.getDescription());
				temp.put(m2);
			}
			m1.put("imgs", temp);
			array.add(m1);
		}
		JSONArray anwser =new JSONArray(array);
		return anwser;
	}
	
}
