<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="tw-zh">
<head>
  <title>景點介紹</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"><!--BOOTSTRAP4-->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script><!--JQUERY3.3.1-->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="./css/footer.css"/>
</head>
<style>
div.gallery {
    /*margin: 5px;*/
    border: 1px solid #ccc;
    /*float: left;*/
    /*width: 180px;*/
    padding:10px;
}

div.gallery:hover {
    border: 1px solid #777;
}

div.gallery img {
    width: 100%;
    height: auto;
}

div.desc {
    padding: 15px;
    text-align: center;
}
</style>
<style>.gal {
	
	
	-webkit-column-count: 3; /* Chrome, Safari, Opera */
    -moz-column-count: 3; /* Firefox */
    column-count: 3;
	  
	
	}	
	.gal img{ width: 100%; padding: 7px 0;}
	.pageStyle{
			margin:0px auto;
			padding: 5px;
			font-size:24px;
	}
	</style>
</head>

<body>
<c:if test="${empty sessionScope.user}">
	<jsp:include page="navbar.jsp" flush="true"></jsp:include>
</c:if>
<c:if test="${!empty sessionScope.user}">
	<jsp:include page="navbarOut.jsp" flush="true"></jsp:include>
</c:if>
<div id="demo" class="carousel slide" data-ride="carousel" style="padding-top:60px">

  <!--輪播中間按鈕設定-->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active" style="background-color:#009FCC"></li>
    <li data-target="#demo" data-slide-to="1" style="background-color:#00DD77"></li>
    <li data-target="#demo" data-slide-to="2" style="background-color:#008866"></li>
  </ul>
  
 <!--輪播圖片設定-->
  <div class="carousel-inner " >
    <div class="carousel-item active">
      <img src="./imgs/carousel1.jpg" alt="1200*300" width="100%">
    </div>
    <div class="carousel-item">
      <img src="./imgs/carousel2.jpg" alt="Chicago" width="100%">
    </div>
    <div class="carousel-item">
      <img src="./imgs/carousel3.jpg" alt="New York" width="100%" >
    </div>
  </div>
  
 <!--輪播按鈕左右控制-->
  <a class="carousel-control-prev" href="#demo" data-slide="prev" style="color:red">
    <span class="carousel-control-prev-icon" id="cleft"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
<div class="container-fluid" style="margin-top:65px">
	<div class="row">
				<div class="col-md-5">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail First" src="${attractions[0].imgs[0].url }" />
						<div class="card-block">
							<h5 class="card-title">
								${attractions[0].stitle }
							</h5>
							<p class="card-text">
								${text[0] }
							</p>
							<p>
								<a class="btn btn-primary" href="./attractions?total_id=${attractions[0].total_id }">詳細介紹</a> 							
								<button class="btn " onclick="addUser_favorite(${attractions[0].total_id})">收藏</button> 
							</p>
						</div>
					</div>
				</div>
				
				<div class="col-md-7">
					<div class="embed-responsive embed-responsive-16by9">
						<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/Q4p-TINFi7Y" frameborder="0" allowfullscreen></iframe>
			    	</div>
			  <!--美食介紹影音結束-->
				</div>
			</div>
			
			
			<div class="row">
				<c:forEach var="i" begin="1" end="${size-1 }" step="1">
			
				<div class="col-md-4 col-sm-6">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail Third" src="${attractions[i].imgs[0].url }" />
						<div class="card-block">
							<h5 class="card-title">
								${attractions[i].stitle }
							</h5>
							<p class="card-text">
								${text[i] }
							</p>
							<p>
								<a class="btn btn-primary" href="./attractions?total_id=${attractions[i].total_id }">詳細介紹</a> 							
								<button class="btn " onclick="addUser_favorite(${attractions[i].total_id})">收藏</button> 
							</p>	
						</div>
					</div>
			</div>
			</c:forEach>
			</div><!-- END of ROW -->
</div>
<div style="text-align:center">
					<c:if test="${start>0 }"><a class="pageStyle" href="./tourism?pager=${start*10-10 }">前十頁</a></c:if>		
				<c:forEach var="i" begin="${start*10+1 }" end="${start*10+10 }">
					<c:if test="${i<(length/10)+1 }">
				  	 <a class="pageStyle" href="./tourism?pager=${i-1 }">${i }</a>
				   </c:if>
				</c:forEach>
					<c:if test="${start<(length/100)-1 }">
					<a class="pageStyle" href="./tourism?pager=${start*10+10 }">下十頁</a>
					</c:if>
			</div>
<script>
	function addUser_favorite(number){
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	alert(this.responseText);
		    }
		  };
		  xhttp.open("POST", "./User_favorite", true);
		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send("total_id="+number);
	}
</script>


</body>
</html>