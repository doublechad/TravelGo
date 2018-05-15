package org.iii.www.control;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.iii.www.entity.User;
import org.iii.www.service.UserService;
import org.iii.www.util.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserControl {
	@Autowired
	private UserService userService;
	@Autowired
	ServletContext context;
	//檢查帳號
	@RequestMapping(value="/user/check",method=RequestMethod.POST)
    public void getPersonById(HttpServletRequest request,HttpServletResponse response) throws IOException{
		String mail =request.getParameter("mail");
		User u1 =userService.checkUser(mail);
		String anwser =(u1==null)?"ok":"used";
		response.getWriter().print(anwser);
		
    }
	
	//用戶註冊
	@RequestMapping(value="/user/register",method=RequestMethod.POST)
	public String registerUser(User user) {
		if(userService.checkUser(user.getMail())==null) {
			user.setType("normal");
			userService.reigister(user);
			return "redirect:/";
		}
		return "redirect:/register";
	}
	//fbLogin
	@RequestMapping(value="/fbLogin",method=RequestMethod.POST)
	public String passTest(HttpServletRequest request,Model model) {
		String mail =request.getParameter("mail");
		String name =request.getParameter("name");
		String password= request.getParameter("password");
		String type= request.getParameter("type");
		if(type.equals("fb")&&userService.checkUser(mail)==null) {
				User u1 =new User();
				u1.setType("fb");
				u1.setName(name);
				u1.setMail(mail);
				String newpassed = BCrypt.hashpw(Calendar.getInstance().getTimeInMillis()+"", BCrypt.gensalt());	
				u1.setPassword(newpassed);
				userService.reigister(u1);
			}
		User u1 =userService.checkUser(mail);
		if(u1!=null) {					
			 if(org.iii.www.util.BCrypt.checkpw(password,u1.getPassword())||type.equals("fb")) {
				 request.getSession().setAttribute("user", u1);
				 return "redirect:/personal";
			 }else {
				 model.addAttribute("anwser", "erro");
				 return "redirect:/sign";
			 }
		}else {
			model.addAttribute("erro", "password erro");
			return "redirect:/sign";
		}
	}
	//用戶登入
	@RequestMapping(value="/user/login",method=RequestMethod.POST)
	public String login(HttpServletRequest request,Model model) {
		String email =request.getParameter("email");
		String password =request.getParameter("password");
		User u1 =userService.checkUser(email);
		if(u1!=null) {
			if(org.iii.www.util.BCrypt.checkpw(password,u1.getPassword())) {			
				request.getSession().setAttribute("user", u1);
				return "redirect:/personal";
			}else {
				System.out.println("密碼不符");
				model.addAttribute("erro", "password erro");
				return "redirect:/sign";
			}
		}else {
			System.out.println("查無此人");
			model.addAttribute("erro", "account erro");
			return "redirect:/sign";
		}
		
		
	}
	//更新個人圖像及圖像
			@RequestMapping(value="/editAvator",method=RequestMethod.POST)
			public String editAvator(User user,HttpServletRequest request,@RequestParam("file")MultipartFile file) throws IOException {
				User u1 =(User)request.getSession(true).getAttribute("user");
				//if(org.iii.www.util.BCrypt.checkpw(request.getParameter("password"),u1.getPassword())) {
				System.out.println(u1.getId());
					if(user.getName().equals(""))user.setName(u1.getName());
					if(user.getMail().equals(""))user.setMail(u1.getMail());
					user.setId(u1.getId());
					userService.updateUser(user);
					String path =context.getInitParameter("userimg-path");		
					File newFile=new File(path,u1.getId()+".jpg");
					try {
					   if(!file.isEmpty())file.transferTo(newFile);
					} catch (Exception e) {
						System.out.println(e.toString());
					}
//				}else {
//					System.out.println("密碼不符");
//					
//				}
				
				return "redirect:/pedit";
			
			}
	//APP登入
	@RequestMapping(value="/app/sighin")
	public String  appSighin(HttpServletRequest request,Model model) {
		String mail =request.getParameter("mail");
		String name =request.getParameter("name");
		String password= request.getParameter("password");
		String type= request.getParameter("type");
		if(type.equals("fb")&&userService.checkUser(mail)==null) {
				User u1 =new User();
				u1.setType("fb");
				u1.setName(name);
				u1.setMail(mail);
				String newpassed = BCrypt.hashpw(Calendar.getInstance().getTimeInMillis()+"", BCrypt.gensalt());	
				u1.setPassword(newpassed);
				userService.reigister(u1);
			}
		User u1 =userService.checkUser(mail);
		if(u1!=null) {		
			HashMap<String, String> m1 =new HashMap<>();
			 m1.put("id", u1.getId()+"");
			 m1.put("mail", u1.getMail());
			 m1.put("name", u1.getName());
			 if(org.iii.www.util.BCrypt.checkpw(password,u1.getPassword())||type.equals("fb")) {
				 model.addAttribute("anwser", m1);
				 return "getMsg";
			 }else {
				 model.addAttribute("anwser", "erro");
				 return "getMsg";
			 }
		}else {
			 model.addAttribute("anwser", "erro");
			 return "getMsg";
		}
		
		
		
	}
	
	
}
