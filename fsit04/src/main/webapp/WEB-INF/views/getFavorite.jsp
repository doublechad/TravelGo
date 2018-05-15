<%@page import="org.iii.www.util.Img"%>
<%@page import="org.json.JSONArray"%>
<%@page import="java.util.HashMap"%>
<%@page import="org.json.JSONObject"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	
	request.setCharacterEncoding("UTF-8");
	String user_id =request.getParameter("user_id");
	Class.forName("com.mysql.jdbc.Driver");
	Properties prop =new Properties();
	prop.setProperty("user", "root");
	prop.setProperty("password", "root");
	Connection dataBase = DriverManager.getConnection("jdbc:mysql://127.0.0.1/fsit04", prop);
	
	
	
	String sql1 ="SELECT user_favorite.total_id,totalviews.type,totalviews.name,attractions.*,restaurant.CAT2 AS rCAT2,restaurant.stitle AS rstitle,restaurant.address AS raddress,restaurant.lng AS rlng,restaurant.lat AS rlat,restaurant.phone,imgs.* FROM user_favorite "+ 
			"LEFT JOIN imgs ON user_favorite.total_id=imgs.total_id "+
			"LEFT JOIN totalviews ON user_favorite.total_id =totalviews.id "+
			"LEFT JOIN attractions ON attractions.total_id = user_favorite.total_id "+
			"LEFT JOIN restaurant ON restaurant.total_id=user_favorite.total_id "+
			"WHERE user_id ="+user_id;
	PreparedStatement ps =dataBase.prepareStatement(sql1);
	
	ResultSet rs =ps.executeQuery();
	JSONObject ob1 =new JSONObject();
	ArrayList<HashMap<String,Object>> list =new ArrayList<>();
	int cunt =0;
	ArrayList<Img> imgContent = new ArrayList();
	HashMap<String,Object> theRow =new HashMap();
	while(rs.next()){
		
		
		if(cunt!=rs.getInt(1)){
			if(rs.getString("type").equals("attraction")){
				imgContent = new ArrayList();
				imgContent.add(new Img(rs.getString("url"),rs.getString("description")));
				theRow.put("total_id", rs.getString("total_id"));
				theRow.put("name", rs.getString("name"));
				theRow.put("type", rs.getString("type"));
				theRow.put("CAT2", rs.getString("CAT2"));
				theRow.put("MEMO_TIME", rs.getString("MEMO_TIME"));
				theRow.put("address", rs.getString("address"));
				theRow.put("xbody", rs.getString("xbody"));
				theRow.put("lat", rs.getString("lat"));
				theRow.put("lng", rs.getString("lng"));
				theRow.put("phone","");
				theRow.put("Img", imgContent);
				list.add(theRow);			
				theRow =new HashMap();
				
			}else{
				imgContent = new ArrayList();
				imgContent.add(new Img(rs.getString("url"),rs.getString("description")));
				theRow.put("total_id", rs.getString("total_id"));
				theRow.put("name", rs.getString("name"));
				theRow.put("type", rs.getString("type"));
				theRow.put("CAT2", rs.getString("rCAT2"));
				theRow.put("MEMO_TIME", "");
				theRow.put("xbody", "");
				theRow.put("address", rs.getString("raddress"));
				theRow.put("lat", rs.getString("rlat"));
				theRow.put("lng",rs.getString("rlng"));
				theRow.put("phone",rs.getString("phone"));
				theRow.put("Img", imgContent);
				list.add(theRow);
				theRow =new HashMap();
			}
			
		}else{
			imgContent.add(new Img(rs.getString("url"),rs.getString("description")));
			theRow.put("Img", imgContent);
		}
		
		//theRow.put("total_id", rs.getString("total_id"));
				
		cunt=rs.getInt(1);
	}
	
	JSONArray answer =new JSONArray(list);
	out.print(answer);

%>