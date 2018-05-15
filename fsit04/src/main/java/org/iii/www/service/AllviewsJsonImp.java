package org.iii.www.service;

import java.util.ArrayList;

import org.iii.www.dao.AllviewsDao;
import org.iii.www.entity.Allviews;
import org.iii.www.entity.Imgs;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
@Service("AllviewsJsonImp")
@Transactional
public class AllviewsJsonImp implements JsonService{
@Autowired AllviewsDao allviewsDao;
	@Override
	public JSONArray getAll() {
		ArrayList<Allviews> a1 =allviewsDao.getAllview();
		
		return translatJson(a1);
	}
	private JSONArray translatJson(ArrayList<Allviews> a1) {
		JSONArray array =new JSONArray();
		for(Allviews as:a1) {
			JSONObject jsonObject = new JSONObject();
			JSONArray temp =new JSONArray();
			try {
				jsonObject.put("total_id", as.getTotal_id());
				jsonObject.put("CAT2", as.getCat2());
				jsonObject.put("address", as.getAddress());
				jsonObject.put("MEMO_TIME", as.getMemo_time());
				jsonObject.put("name", as.getStitle());
				jsonObject.put("xbody", as.getXbody());
				jsonObject.put("phone", as.getPhone());
				jsonObject.put("type", as.getType());
				jsonObject.put("lat", as.getLat());
				jsonObject.put("lng", as.getLng());
			for(Imgs a:as.getImgs()) {
				JSONObject obj1 = new JSONObject();
				obj1.put("url", a.getUrl());
				obj1.put("description", a.getDescription());
				temp.put(obj1);
			}
			jsonObject.put("Img", temp);
			array.put(jsonObject);
			} catch (JSONException e) {
				System.out.println(e.toString());
			}
		}
		
		return array;
	}

}
