package org.iii.www.util;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.http.HttpRequest;

@Aspect
public class AspectTest {
	
	@Pointcut("execution(* org.iii.www.service.*.*(..))")
	public void poinCut() {}
	/**
	 * 在org.iii.www.control下的所有方法
	 * "execution(* org.iii.www.control.*.*(..))"
	 *  在org.iii.www.control下與子package下的所有方法
	 *  "execution(* org.iii.www.control..*.*(..))"
	 *    執行                            package            類名                    方法名稱
	 *  "execution(* org.iii.www.control..HtmlControl.logTest(..))"
	 * @throws Exception 
	 *  
	 */
	@Before("poinCut()")    
    public Object before(JoinPoint jp) throws Exception{
		Object retVal = null;  //连接点方法返回值
		//jp用來獲得傳入的參數
		Object[] parms =jp.getArgs();
//		for(Object obj:parms) {
//			HttpServletRequest request =(HttpServletRequest)parms[0];
//			 System.out.println("before方法執行前....."+request.getParameter("user"));
//			
//		}
		if(false) {
		throw new TesttException();
		}
        return retVal;
    }
//	@AfterReturning("execution(* org.iii.www.control.*.*(..))")    
//	  public void xx(){    
//	          System.out.println("方法執行完畢.....");    
//	  }   
}
 class TesttException extends Exception{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	 
 }
