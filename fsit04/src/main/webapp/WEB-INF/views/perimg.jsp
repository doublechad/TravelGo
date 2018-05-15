<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>會員管理專區</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
        
        <link rel="stylesheet" href="./css/test4.css">
        
    </head>
    <link rel="stylesheet" href="./css/body.css" type="text/css" />
     <link rel="stylesheet" href="css/perimg.css" type="text/css" />

  <style>
       a:active
        {
            color: grey;
        }
         a::before{
        
            color: grey;
        }
        .test{
        position: fixed;
        bottom: 2%;
  		right: 5%;
        
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
		<div id="content" style="margin-top:90px;width:100%;margin-left:10px">
  			<div class="row">
  				<c:forEach var="img" items="${imgs }">
				<div class="responsive" id="t_box${img.id}">
				   <div class="gallery col-md-12" id="t_box2${img.id}">
				  		<form style="text-align:center" id="t_box3${img.id}">
				    		<a href="${img.filepath }" id="t_box4${img.id}">
				    		  <img src="${img.filepath }" alt="Northern Lights" style="width:600;height:400" id="img${img.id}">
				    		  <input type="checkbox"  name="ck_box" id="${img.id} "/>
				    		</a>
				  		</form>
				   </div>
				</div>
				</c:forEach>
			</div>
		</div>		
</div>
<button type="button" class="btn btn-outline-primary test" style="display:block;" onClick="deletImg()">刪除照片</button>	
</body>
<script>

function getCheckbox(){
	var array=[];
	var ck_boxs = document.getElementsByName("ck_box");
	ck_boxs.forEach(function(element){
		if(element.checked){
			array.push(element.getAttribute("id"));
		}
		
	});
	return array;
	
}
function removeTr(array){
	array.forEach(function(element){
		var parent ="t_box"+element.trim();		
		var test =document.getElementById(parent);
		test.innerHTML="";
		window.location = "./perimg"
	})
	
}
function deletImg(){
	var xhttp = new XMLHttpRequest();
	var array = getCheckbox();	  
	  xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {	    	
	    	removeTr(array);
	    }
	  };
	  xhttp.open("POST", "./deletuserimgs", true);
	  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	  var myJsonString = JSON.stringify(array);	  
	  if(array.length>0)xhttp.send("total_id="+myJsonString);
	  
}
</script>
</html>