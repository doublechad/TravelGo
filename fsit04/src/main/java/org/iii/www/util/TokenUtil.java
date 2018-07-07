package org.iii.www.util;

import java.util.Calendar;
import java.util.Date;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;

public class TokenUtil {
	/**
	 * 密鑰
	 */
	private static final String SECRET = "XX#$%()(#*!()!KL<><MQLMNQNQJQKsdfkjsdrow32234545fdf>?N<:{LWPW";
	
	

	public static String create(String account,String username) {
		Algorithm algorithmHS = Algorithm.HMAC256(SECRET);
		String token="";
		Calendar calendar =Calendar.getInstance();
		Date expires = new Date();
		expires.setTime(calendar.getTimeInMillis()+36000);
		try {
			token= JWT.create()
		        .withIssuer("BMD")
		        .withExpiresAt(expires)
		        .withClaim("account", account)
		        .withClaim("name", username)
		        .sign(algorithmHS);
		    System.out.println(token);
		} catch (JWTCreationException exception){
		    //Invalid Signing configuration / Couldn't convert Claims.
		}
		return token;
	}
	
	public static DecodedJWT verifyToken(String token) throws JWTVerificationException{
		    Algorithm algorithm = Algorithm.HMAC256("secret");
		    JWTVerifier verifier = JWT.require(algorithm)
		        .withIssuer("BMD")
		        .build(); //Reusable verifier instance
		    DecodedJWT jwt = verifier.verify("fefeaf.fewf.ffefF");	
		return jwt;
	}




}
