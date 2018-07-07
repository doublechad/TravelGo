package fsit04;

import java.util.Date;
import java.util.Map.Entry;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTCreationException;
import com.auth0.jwt.exceptions.JWTVerificationException;
import com.auth0.jwt.interfaces.DecodedJWT;



public class test {

	public static void main(String[] args) {
		Algorithm algorithmHS = Algorithm.HMAC256("myxyzooxx85839");
		String token="";
		try {
			token= JWT.create()
		        .withIssuer("BMD")
		        .withExpiresAt(new Date())
		        .withClaim("account", "test")
		        .withClaim("name", "user")
		        .sign(algorithmHS);
		    System.out.println(token);
		} catch (JWTCreationException exception){
		    //Invalid Signing configuration / Couldn't convert Claims.
		}
		
		try {
		    Algorithm algorithm = Algorithm.HMAC256("secret");
		    JWTVerifier verifier = JWT.require(algorithm)
		        .withIssuer("BMD")
		        .build(); //Reusable verifier instance
		    DecodedJWT jwt = verifier.verify("fefeaf.fewf.ffefF");
		    System.out.println(jwt.getIssuer());
		    System.out.println(jwt.getClaims());
		    System.out.println(jwt.getExpiresAt());
		} catch (JWTVerificationException exception){
		    //Invalid signature/claims
			System.out.println(exception.getMessage());
		}

	}

}
