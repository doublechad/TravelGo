<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="tw-zh">
<head>
  <title>各點介紹</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
 
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
<!--    <script>
//   if(screen.width<768){
// document.getElementById("sign").style.border="none";}
// </script> -->
</head>
<style type="text/css">
	.fb_iframe_widget, .fb_iframe_widget span, .fb_iframe_widget span iframe[style] {width: 100% !important;} 
</style>
<style type="text/css">
	
		#fb-root {
	    display: none;
	}

	/* 讓所有容器的寬度都變成 100% */
	.fb_iframe_widget, .fb_iframe_widget span, .fb_iframe_widget span iframe[style] {
	    width: 100% !important;
	}
</style>
<script>
	(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v2.12&appId=357547311424270&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
</script>
<body>
 <c:if test="${empty sessionScope.user}">
	<jsp:include page="navbar.jsp" flush="true"></jsp:include>
</c:if>
<c:if test="${!empty sessionScope.user}">
	<jsp:include page="navbarOut.jsp" flush="true"></jsp:include>
</c:if>


  <div class="container" style="margin-top:100px">
	<div class="row">
<div class="carousel slide col-md-6" id="carousel-31516">
				<ol class="carousel-indicators">
					<li data-slide-to="0" data-target="#carousel-31516" class="active">
					</li>
					<li data-slide-to="1" data-target="#carousel-31516">
					</li>
					<li data-slide-to="2" data-target="#carousel-31516">
					</li>
				</ol>
				<div class="carousel-inner">
					<c:forEach var="i" begin="0" end="${length-1}" step="1">
					<c:if test="${i==0 }">
						<div class="carousel-item active">
							<img class="d-block w-100" alt="Carousel Bootstrap First" src="${attractions.imgs[0].url }" />
							<div class="carousel-caption">							
							</div>
						</div>
					</c:if>
					<c:if test="${i!=0 }">
					<div class="carousel-item">
						<img class="d-block w-100" alt="Carousel Bootstrap Second" src="${attractions.imgs[i].url }" />
						<div class="carousel-caption">						
						</div>
					</div>
					</c:if>
					</c:forEach>
										
				</div> <a class="carousel-control-prev" href="#carousel-31516" data-slide="prev"><span class="carousel-control-prev-icon"></span> <span class="sr-only">Previous</span></a> <a class="carousel-control-next" href="#carousel-31516" data-slide="next"><span class="carousel-control-next-icon"></span> <span class="sr-only">Next</span></a>
		</div>	
		
		<div class="col-md-6">
		
		<h1 style="text-align:center">${attractions.stitle }</h1>
		<p>
			${attractions.xbody }
		</p>
		<p>
			營業時間:${attractions.memo_time }
		</p>
		<p>
			<a href="./gmap?lat=${attractions.lat }&lng=${attractions.lng }&postion=${attractions.address}">地址:${attractions.address }</a>
		</p>
		</div>
		

		<div id="fb-root"></div>
		<div class="fb-comments" data-href="https://topic-timgyes123.c9users.io/point.html" data-numposts="5"></div>
	</div>
</div>

</body>
</html>