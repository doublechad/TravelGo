<%@page import="org.json.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
if(request.getAttribute("anwser")!=null){
	String aa =request.getAttribute("anwser").toString();
	out.print(aa);
}

%>