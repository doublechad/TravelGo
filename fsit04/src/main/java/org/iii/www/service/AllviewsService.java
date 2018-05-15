package org.iii.www.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.iii.www.dao.AllviewsDao;
import org.iii.www.entity.Allviews;
import org.iii.www.entity.Imgs;
import org.iii.www.util.Img;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("AllviewsService")
@Transactional
public class AllviewsService {
	@Autowired
	AllviewsDao allviewsDao;
	
	
	public Allviews getAllviewsByid(Integer total_id) {
		return allviewsDao.getAllviewByid(total_id);
	}
	public ArrayList<Allviews> getAll(){
		return allviewsDao.getAllview();
	}
	
	public HashMap<String,Object> getTen(Integer index){
		ArrayList<Allviews> array=getAll();
		int start =index*10;
		int end =(index*10+10>array.size())?array.size():index*10+10;
		List<Allviews> anwser =array.subList(start,end);	
		List<String> simpleText = new ArrayList<>();
		for(Allviews a :anwser) {
			String temp;
			if(a.getXbody()!=null) {
				temp =a.getXbody().substring(0, 50);
			}else {
				temp="";
			}
			simpleText.add(temp);
		}
		HashMap<String,Object> m1 =new HashMap<>();
		m1.put("anwser",anwser);
		m1.put("text",simpleText);
		m1.put("cunt",array.size());
		m1.put("size",simpleText.size());
		
		return m1;
		
	}
	public ArrayList<Allviews> getTop5Views(){
		ArrayList<Allviews> array =new ArrayList<>();
		array.add(allviewsDao.getAllviewByid(9));
		array.add(allviewsDao.getAllviewByid(25));
		array.add(allviewsDao.getAllviewByid(52));
		array.add(allviewsDao.getAllviewByid(164));
		array.add(allviewsDao.getAllviewByid(7));
		return array;
	}
	
	public ArrayList<Allviews> getTop5Restaurant(){
		ArrayList<Allviews> array =new ArrayList<>();
		array.add(allviewsDao.getAllviewByid(344));
		array.add(allviewsDao.getAllviewByid(341));
		array.add(allviewsDao.getAllviewByid(329));
		array.add(allviewsDao.getAllviewByid(335));
		array.add(allviewsDao.getAllviewByid(342));
		return array;
	}
	public JSONArray searchByParam(String param) {
		ArrayList<Allviews>  allviews =allviewsDao.searchByParam(param);
		
		JSONArray array =new JSONArray();
		for(Allviews as:allviews) {
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
