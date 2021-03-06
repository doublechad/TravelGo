package org.iii.www.control;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.Resource;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.iii.www.dao.JDBCtemplateDemo;
import org.iii.www.dao.Test0526Dao;
import org.iii.www.dao.User_favoriteDao;
import org.iii.www.entity.Allviews;
import org.iii.www.entity.Test0526Id;
import org.iii.www.entity.User;
import org.iii.www.entity.User_favorite;
import org.iii.www.entity.Userimgs;
import org.iii.www.service.AllviewsJsonImp;
import org.iii.www.service.AllviewsService;
import org.iii.www.service.CrudServic;
import org.iii.www.service.IDOS;
import org.iii.www.service.JsonService;
import org.iii.www.service.User_favoriteService;
import org.iii.www.service.UserimgsService;
import org.iii.www.util.Test0526;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HtmlControl {
	@Autowired
	Test0526Dao tt;
	
	@Autowired
	AllviewsService allviewsService;
	
	@Autowired
	ServletContext context;
	@Autowired
	JDBCtemplateDemo jdbc;
	@Autowired UserimgsService userimgsService;
	
	@Autowired User_favoriteService user_favoriteService;
	
	@Autowired @Qualifier("UserCrudImp")
	CrudServic UserCrudImp;
	
	@Autowired @Qualifier("AllviewsJsonImp")
	JsonService allviewsJsonImp;
	
	@Autowired @Qualifier("DOS")
	IDOS dos;
	private static Logger logger = Logger.getLogger(HtmlControl.class);
	//首頁
	@RequestMapping(value="/")
	public String goToIndex(HttpServletRequest request,HttpServletResponse res,Model model) {
		ArrayList<Allviews> views =allviewsService.getTop5Views();
		ArrayList<Allviews> restaurant =allviewsService.getTop5Restaurant();
		model.addAttribute("views",views);
		model.addAttribute("restaurant",restaurant);
		System.out.println("goToIndex");
		return "index";
	}
	//登入頁面
	@RequestMapping(value="/sign")
	public String goToSighin(HttpServletRequest request,HttpServletResponse res) throws IOException {		
		return checkUserSession(request)?"redirect:/personal":"signin";
	}
	//登出
	@RequestMapping(value="/signout")
	public String sighOut(HttpServletRequest request,HttpServletResponse res) throws IOException {
		request.getSession(true).removeAttribute("user");	
		return "redirect:/";
	}
	//相片集
	@RequestMapping(value="/album")
	public String goToalbum(HttpServletRequest request,HttpServletResponse res,Model model) throws IOException {
		
		List<Userimgs> anwser =userimgsService.getAll();
		//int cunt =(int)(Math.random()*200+10);
		 
		model.addAttribute("attractions", anwser);
		return "album";
	}
	//我的最愛
	@RequestMapping(value="/myFavorite")
	public String goTomyFavorite(HttpServletRequest request,HttpServletResponse res,Model model) throws IOException {
		if(checkUserSession(request)) {
			User u1=(User)request.getSession(false).getAttribute("user");
			List<Allviews> anwser =user_favoriteService.getFavoriteByID(u1.getId()+"");
			model.addAttribute("views", anwser);
			return "myFavorite";
		}else {
			return "redirect:/";
		}
		
	}
	//行程規劃
	@RequestMapping(value="/gmap")
	public String goTogmap(HttpServletRequest request,Model model) throws IOException {
		String lat="";
		if(request.getParameter("lat")!=null) {
			lat=request.getParameter("lat");
			
		}
		String lng="";
		if(request.getParameter("lng")!=null) {
			lng=request.getParameter("lng");
			
		}
		String postion="";
		if(request.getParameter("postion")!=null) {
			postion=request.getParameter("postion");
			
		}
		model.addAttribute("address", postion);
		model.addAttribute("lat", lat);
		model.addAttribute("lng", lng);
		return "gmap";
	}
	
	//景點介紹
	@RequestMapping(value="/tourism")
	public String goTotoursim(HttpServletRequest request,HttpServletResponse res,Model model) throws IOException {
		Integer index =(request.getParameter("pager")==null)?0:Integer.parseInt(request.getParameter("pager"));		
		HashMap<String, Object> m1 = allviewsService.getTen(index);		
		model.addAttribute("start", index/10);
		model.addAttribute("length",m1.get("cunt"));
		model.addAttribute("attractions", (List<Allviews>)m1.get("anwser"));
		model.addAttribute("text", (List<String>)m1.get("text"));
		model.addAttribute("size", m1.get("size"));
		return "tourism";
	}
	//景點詳細
	@RequestMapping(value="/attractions")
	public String goToattractions(HttpServletRequest request,HttpServletResponse res,Model model) throws IOException {
		Integer total_id=(request.getParameter("total_id")==null)?1:Integer.parseInt(request.getParameter("total_id"));
		Allviews attractions =allviewsService.getAllviewsByid(total_id);
		System.out.println(attractions.getXbody());
		model.addAttribute("attractions", attractions);
		model.addAttribute("length", attractions.getImgs().size());
		return "attractions";
	}
	// 個人頁面 persoinal
	@RequestMapping(value="/personal")
	public String goTopersoinal(HttpServletRequest request,HttpServletResponse res) throws IOException {
		
		return checkUserSession(request)?"personal":"redirect:/";
	
	}
	// 編輯個人資料 
		@RequestMapping(value="/pedit")
		public String goTopedit(HttpServletRequest request,HttpServletResponse res) throws IOException {
			
			return checkUserSession(request)?"pedit":"redirect:/";
		
		}
	
	//個人相簿
		@RequestMapping(value="/perimg")
		public String goToperimg(HttpServletRequest request,HttpServletResponse res,Model model) throws IOException {
			User u1 =(User)request.getSession(true).getAttribute("user");
			if(u1==null) {
				return "redirect:/";
			}else {
			List<Userimgs> imgs =userimgsService.getUserimgsByUser(u1.getId());
			model.addAttribute("imgs", imgs);	
			return "perimg";
			}
		
		}
	//appwebViewimg
	@RequestMapping(value="/appimg")
	public String appimg(HttpServletRequest request,HttpServletResponse res,Model model) {
		Integer user_id =Integer.parseInt(request.getParameter("user_id"));
		List<Userimgs> imgs =userimgsService.getUserimgsByUser(user_id);
		model.addAttribute("imgs", imgs);
		return "appimg";
	}
	//註冊頁面
	@RequestMapping(value="/register")
	public String goToRegister(HttpServletRequest request,HttpServletResponse res) {		
		return checkUserSession(request)?"redirect:/":"register";
	}
	//HttpServletRequest request, @RequestParam("description") String description, @RequestParam("file") MultipartFile file
	@RequestMapping(value="/testUpload" )
	public String goTotest( ) {
		
		return "testUpload";
	}
	//檔案上傳
	@RequestMapping(value="/saveFile",method=RequestMethod.POST)
	public String saveFile(HttpServletRequest request,@RequestParam("file")MultipartFile[] files) {
		String user_id =request.getParameter("user_id");
		String path =context.getInitParameter("upload-path");
		String[] filePath = new String[files.length];
		for(int i=0;i<files.length;i++) {
		String src = user_id+"_"+Calendar.getInstance().getTimeInMillis()+".jpg";
		File newFile=new File(path,src);
			try {
				
				if(!files[i].isEmpty())files[i].transferTo(newFile);
			} catch (Exception e) {
				System.out.println(e.toString());
			}
			filePath[i]=context.getRealPath("")+"/upload/"+src;
		}
		userimgsService.saveUserimgs(request,filePath);
		return "test";
	}
	//測試
	@RequestMapping("/test")
	public String myTest(HttpServletRequest request,Model model) {
		try {
		Class<?> a = Class.forName("org.iii.www.entity.User");

		Object u1 =  UserCrudImp.getByid(Integer.parseInt(request.getParameter("user_id")));
		Method m = a.getMethod("getName", new Class[]{});
		
		System.out.println(m.invoke(u1, new Object[]{}));
//		model.addAttribute("anwser", u1.getName());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "getMsg";
		
	}
	@RequestMapping("/test2")
	public void myTest2(HttpServletRequest request,HttpServletResponse res,Model model) throws IOException {
//		try {
//			allviewsJsonImp.getAll();
//		}catch(Exception e) {
//			System.out.println(e.toString());
//		}
//		ArrayList<ArrayList<String>> list =(ArrayList<ArrayList<String>>) jdbc.getAllwithColumns();
//		model.addAttribute("data", list);
//		model.addAttribute("length", list.size());
		//return "test";
		Map<String, String[]> map =request.getParameterMap();
		for(Entry<String,String[]> e1 : map.entrySet()) {
			System.out.print(e1.getKey()+"  :  ");
			for(String s:e1.getValue()) {
				System.out.print(s+"   :   ");
			}
			System.out.println();
		};
		res.getWriter().println("ok");
	}
	@RequestMapping(value="/test2",method=RequestMethod.POST)
	public void myTest2Post(HttpServletRequest request,HttpServletResponse res,Model model) throws IOException {
		System.out.println("ok");
//		try {
//			allviewsJsonImp.getAll();
//		}catch(Exception e) {
//			System.out.println(e.toString());
//		}
//		ArrayList<ArrayList<String>> list =(ArrayList<ArrayList<String>>) jdbc.getAllwithColumns();
//		model.addAttribute("data", list);
//		model.addAttribute("length", list.size());
		//return "test";
//		Map<String, String[]> map =request.getParameterMap();
//		for(Entry<String,String[]> e1 : map.entrySet()) {
//			System.out.print(e1.getKey()+"  :  ");
//			for(String s:e1.getValue()) {
//				System.out.print(s+"   :   ");
//			}
//			System.out.println();
//		};
		System.out.println(request.getReader().readLine());
		res.getWriter().println("byPost");
	}
	@RequestMapping("/logTest")
	public void logTest(HttpServletRequest request,HttpServletResponse res) {
		logger.info("ip 位置"+request.getRemoteAddr());
		Test0526Id xx =new Test0526Id();
		xx.setUuid(UUID.randomUUID().toString());
		xx.setId(0);
		xx.setName("OK");
		xx.setText("o ya");
		try {
			res.getWriter().println(tt.saveObject(xx));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	//確認是否有會員登入
	private boolean checkUserSession(HttpServletRequest request) {
		return (request.getSession(true).getAttribute("user")==null)?false:true;
	}
	@RequestMapping("/bmd")
	public void bmd(HttpServletRequest request,HttpServletResponse res) {		
		try {
			res.getWriter().print(getPage(0));
		} catch (IOException e) {
			System.out.println(e.toString());
		}
	}
	public String getPage(int request_type){
	   
	    int framework_type = 0;
	    
	    StringBuffer page = new StringBuffer();
	    
	    switch(request_type){
	    
	        case 0: //for browser   
	            
	            switch(framework_type){//framework none 
	                
	                case 0:        
	                    page.append("<!DOCTYPE html>");

	                    page.append("<html>");

	                    page.append("<head>");

	                    page.append(dos.getMeta());

	                    page.append(dos.getIcon());

	                    page.append(dos.getTitle());

	                    page.append(dos.getStyle());

	                    page.append(dos.getJs());

	                    page.append("</head>");

	                    page.append("<body>");
	                    page.append(dos.getHeader());
	                    page.append(dos.getContent());
	                    page.append(dos.getFooter());
	        	        page.append("</body>");
	                    
	                 break;
	                    
	                case 1://struts
	                    
	                break;    
	            }
	            
	        break;
	            
	        case 1://for mobile app
	            
	            //mobile app page json response
	            
	        break;    
	    }
	    
	    return page.toString();
	}
	
	
}
