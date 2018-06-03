<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!--JQUERY3.3.1-->
		<script src="./script/jquery.i18n.properties.js"></script>
	</head>
	<body>
		<table>
			<tr><c:forEach var="column" items="${data[0] }"><th>${column }</th></c:forEach></tr>	
			<c:forEach begin="1" end="${length }" step="1" var="i">
				 <tr><c:forEach var="column" items="${data[i] }"><td>${column }</td></c:forEach></tr>
			</c:forEach>
			
		</table>
	</body>
	<script src="./script/test.js"></script>
	
</html>
