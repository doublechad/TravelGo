<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>會員資料編輯</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="/fsit04/css/test4.css">
        
    </head>
    <link rel="stylesheet" href="/fsit04/css/body.css" type="text/css" />
  <style>
       a:active
        {
            color: grey;
        }
         a::before{
        
            color: grey;
        }
  </style>
 <body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top cell" id="title_nav" style="background:#99BBFF;">
  <a class="navbar-brand" href="./" id="tilte_bt">TravelGO</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"style="border-width:2px">
    <span class="navbar-toggler-icon" id="sp"></span>
  </button>
  <div class="collapse navbar-collapse " id="collapsibleNavbar">
    <ul class="navbar-nav" id="navh" style="display:">
      <li class="nav-item"style="color:black">
        <a class="nav-link" style="text-align:center;border-color:rgba(255,255,255,.5);border-bottom:solid" href="./pedit">個人資料管理</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" style="text-align:center;border-color:rgba(255,255,255,.5);border-bottom:solid" href="./myFavorite">我的最愛</a>
      </li>
      <div style="text-align:center">
						 <a class="collapsed card-link" data-toggle="collapse" data-parent="#card-763941" href="#card-element-457704" style="color:blue">相簿管理</a>
			</div>			 
					<li id="card-element-457704" class="collapse"style="text-align:center">
						<div class="card-block">
						<a href="./myMap">足跡地圖</a>
						</div>
						<div class="card-block">
						<a href="./perimg">照片集</a>
						</div>
					</li>
     
    </ul>
    <ul class="navbar-nav" >
      <li class="nav-item"style="color:black">
        <a class="nav-link" href="./gmap" style="color:black;text-align:center">行程規劃</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./album"style="color:black;text-align:center">相片集</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="./tourism"style="color:black;text-align:center">景點介紹</a>
      </li>
      
    </ul>
    <ul class="navbar-nav ml-auto">
    <li class="nav-item"style="text-align:center">
	    帳號:${sessionScope.user.mail}<br>名稱:${sessionScope.user.name}
	 </li> 
      <li class="nav-item"  >
        <a class="nav-link sign btn-circle" href="./signout"title="登出"style="border-style:dashed;text-align:center"><i class="fas fa-sign-out-alt"></i></a>
      </li>
    </ul>
  </div>
</nav>
<div class="wrapper">
<jsp:include page="personBar.jsp" flush="true"></jsp:include>       
            

            <!-- Page Content Holder -->
            <div id="content" style=margin-top:65px>
<form role="form" action="./editAvator" method="post" enctype="multipart/form-data">
    				<div class="form-group">
					 
					<label for="name">
						暱稱
					</label>
					<input type="text" class="form-control" id="name" name="name"/>
				</div>
				<div class="form-group">
					 
					<label for="Email">
						Email address
					</label>
					<input type="email" class="form-control" id="Email" name="mail"/>
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						Password
					</label>
					<input type="password" class="form-control" id="exampleInputPassword1" name="password" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputFile">
						會員大頭貼更換
					</label>
					<input type="file" class="form-control-file" id="exampleInputFile" name="file" />
					<p class="help-block">
					請選擇大頭貼尺寸250*250px
					</p>
				</div>

				<button type="submit" class="btn btn-primary">
					Submit
				</button>
			</form>
</div>
    </body>
</html>