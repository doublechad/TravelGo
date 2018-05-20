package org.iii.www.util;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.http.HttpRequest;

@Aspect
public class AspectTest {
	/**
	 * 在org.iii.www.control下的所有方法
	 * "execution(* org.iii.www.control.*.*(..))"
	 *  在org.iii.www.control下與子package下的所有方法
	 *  "execution(* org.iii.www.control..*.*(..))"
	 *    執行                            package            類名                    方法名稱
	 *  "execution(* org.iii.www.control..HtmlControl.logTest(..))"
	 *  
	 */
	@Before("execution(* org.iii.www.control..HtmlControl.logTest(..))")    
    public void before(JoinPoint jp){
		//jp用來獲得傳入的參數
		Object[] parms =jp.getArgs();
		HttpServletRequest request =(HttpServletRequest)parms[0];
        System.out.println("方法執行前....."+request.getParameter("user"));    
    }
	@AfterReturning("execution(* org.iii.www.control.*.*(..))")    
	  public void afterReturning(){    
	          System.out.println("方法執行完畢.....");    
	  }   
}
