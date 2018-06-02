<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body>
		<table>
			<tr><c:forEach var="column" items="${data[0] }"><th>${column }</th></c:forEach></tr>	
			<c:forEach begin="1" end="${length }" step="1" var="i">
				 <tr><c:forEach var="column" items="${data[i] }"><td>${column }</td></c:forEach></tr>
			</c:forEach>
			
		</table>
	</body>
</html>
