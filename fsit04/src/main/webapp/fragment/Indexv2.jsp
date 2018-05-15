<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="tw-zh">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="./css/padding.css"/>
</head>
<style type="text/css">
body{
background: -moz-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #e1e1e1 51%, #f6f6f6 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #ffffff 0%,#f1f1f1 50%,#e1e1e1 51%,#f6f6f6 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0 ); /* IE6-9 */
}
</style>
<body>

<nav class="navbar navbar-expand-md fixed-top"style="background-color:#e3f2fd;">
  <a class="navbar-brand" href="#">Attraction</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="#" style="color:black">行程規劃</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"style="color:black">相片集</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"style="color:black">附近景點</a>
      </li>    
    </ul>
  </div>  
</nav>
<div id="demo" class="carousel slide" data-ride="carousel" style="padding-top:60px">

  <!--輪播張數設定-->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
  </ul>
  
 <!--輪播圖片設定-->
  <div class="carousel-inner " >
    <div class="carousel-item active">
      <img src="./imgs/carousel.jpg" alt="1200*300" width="100%">
    </div>
    <div class="carousel-item">
      <img src="./imgs/carousel.jpg" alt="Chicago" width="100%">
    </div>
    <div class="carousel-item">
      <img src="./imgs/carousel.jpg" alt="New York" width="100%" >
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
<!--輪播結束-->


<!--中間按鈕(熱門、景點、美食)-->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4 btnp" style="text-align:center">
			 
			<button type="button" class="btn btn-outline-danger"
			onclick="javascript:location.href='http://www.yahoo.com.tw'"  style="width:100px;border-radius:30px;">
				熱&nbsp;門
			</button>
		</div>
		<div class="col-md-4 btnp" style="text-align:center">
			 
			<button type="button" class="btn btn-outline-success"
			onclick="javascript:location.href='http://www.yahoo.com.tw'" style="width:100px;border-radius:30px;">
				景&nbsp;點
			</button>
		</div>
		<div class="col-md-4 btnp" style="text-align:center">
			 
			<button type="button" class="btn btn-outline-warning"
			onclick="javascript:location.href='http://www.yahoo.com.tw'" style="width:100px;border-radius:30px;">
				美&nbsp;食
			</button>
		</div>
	</div>
</div>
 <!--中間按鈕結束-->
 <!--<中間 隨機旅遊景點介紹>-->
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="row">
			  <!--旅遊景點介紹-->
				<div class="col-md-8">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail First" src="http://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
						<div class="card-block">
							<h5 class="card-title">
								Card title
							</h5>
							<p class="card-text">
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
				<!--旅遊景點介紹 結束-->
				<!--美食介紹-->
				<div class="col-md-4">
			<div class="embed-responsive embed-responsive-16by9">
				<iframe class="embed-responsive-item" src="https://www.youtube.com/embed/Q4p-TINFi7Y" frameborder="0" allowfullscreen></iframe>
			</di>
			  </div>
			  <!--美食介紹結束-->
					<div class="col-md-12" style="padding:15px">
			<div class="list-group">
				 <a href="#" class="list-group-item list-group-item-action active">Home</a>
				<div class="list-group-item">
					List header
				</div>
				<div class="list-group-item">
					<h4 class="list-group-item-heading">
						List group item heading
					</h4>
					<p class="list-group-item-text">
						...
					</p>
				</div>
				<div class="list-group-item justify-content-between">
					Help<span class="badge badge-default badge-pill">14</span>
				</div> <a href="#" class="list-group-item list-group-item-action active justify-content-between">Home <span class="badge bg-white badge-pill">14</span></a>
			</div>
		</div>
			</div>
		</div>
	</div>
</div>
	<div class="row">
		<div class="col-md-12">
			<div class="row">
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail First" src="http://www.layoutit.com/img/people-q-c-600-200-1.jpg" />
						<div class="card-block">
							<h5 class="card-title">
								Card title
							</h5>
							<p class="card-text">
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail Second" src="http://www.layoutit.com/img/city-q-c-600-200-1.jpg" />
						<div class="card-block">
							<h5 class="card-title">
								Card title
							</h5>
							<p class="card-text">
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-4">
					<div class="card">
						<img class="card-img-top" alt="Bootstrap Thumbnail Third" src="http://www.layoutit.com/img/sports-q-c-600-200-1.jpg" />
						<div class="card-block">
							<h5 class="card-title">
								Card title
							</h5>
							<p class="card-text">
								Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.
							</p>
							<p>
								<a class="btn btn-primary" href="#">Action</a> <a class="btn" href="#">Action</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="col-md-12">
  	<div class="media">
				<img class="mr-3" alt="Bootstrap Media Preview" src="http://www.layoutit.com/img/sports-q-c-64-64-8.jpg" />
				<div class="media-body">
					<h5 class="mt-0">
						Nested media heading
					</h5> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
					<div class="media mt-3">
						 <a class="pr-3" href="#"><img alt="Bootstrap Media Another Preview" src="http://www.layoutit.com/img/sports-q-c-64-64-2.jpg" /></a>
						<div class="media-body">
							<h5 class="mt-0">
								Nested media heading
							</h5> Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin commodo. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis.
						</div>
					</div>
				</div>
			</div>
</div>



  	<!--<div class="row im" id="hot" >-->
			<!--	<div class="col-md-12">-->
			<!--	    <img src="./imgs/hot.jpg" alt="Cinque Terre" style="width:100%;">-->
			<!--	</div>-->
			<!--</div>-->
			<!--<div class="row im" id="attractions">-->
			<!--	<div class="col-md-12">-->
			<!--	    <img src="/imgs/attractions.jpg" alt="Cinque Terre" style="width:100%;">-->
			<!--	</div>-->
			<!--</div>-->
			<!--<div class="row im" id="food">-->
			<!--	<div class="col-md-12">-->
			<!--	    <img src="/imgs/food.jpg" alt="Cinque Terre" style="width:100%;">-->
			<!--	</div>-->
			<!--</div>-->
			<!--<div class="row">-->
			<!--	<div class="col-md-4">-->
			<!--		<h2>-->
			<!--			Heading-->
			<!--		</h2>-->
			<!--		<p>-->
			<!--			Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.-->
			<!--		</p>-->
			<!--		<p>-->
			<!--			<a class="btn" href="#">View details »</a>-->
			<!--		</p>-->
			<!--	</div>-->
			<!--	<div class="col-md-4">-->
			<!--		<h2>-->
			<!--			Heading-->
			<!--		</h2>-->
			<!--		<p>-->
			<!--			Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.-->
			<!--		</p>-->
			<!--		<p>-->
			<!--			<a class="btn" href="#">View details »</a>-->
			<!--		</p>-->
			<!--	</div>-->
			<!--	<div class="col-md-4">-->
			<!--		<h2>-->
			<!--			Heading-->
			<!--		</h2>-->
			<!--		<p>-->
			<!--			Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.-->
			<!--		</p>-->
			<!--		<p>-->
			<!--			<a class="btn" href="#">View details »</a>-->
			<!--		</p>-->
			<!--	</div>-->
			
			</div>
  

</body>
</html>