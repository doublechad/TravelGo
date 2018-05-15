<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="tw-zh">
<head>
  <title>註冊</title>
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
	.gal img{ width: 100%; padding: 7px 0;}</style>
</head>

<body>
<c:if test="${empty sessionScope.user}">
	<jsp:include page="navbar.jsp" flush="true"></jsp:include>
</c:if>
<c:if test="${!empty sessionScope.user}">
	<jsp:include page="navbarOut.jsp" flush="true"></jsp:include>
</c:if>

<div class="container-fluid" style="margin-top:65px">

<h1>相片集</h1>
<hr>
<div class="row">	
		<c:forEach var="attraction" items="${attractions }">
		<div class="col-md-4">
			<div class="jumbotron">
				<a href="./attractions?total_id=${attraction.allviews.total_id }"><img class="card-img-top" alt="Bootstrap Thumbnail Third" src="${attraction.filepath }" /></a>
				<p style="padding-top:5px">${attraction.allviews.stitle}</p><p style="padding-top:5px">${attraction.user.name}</p>
			</div>
			
		</div>
		</c:forEach>
</div>

</div>




</body>
</html>