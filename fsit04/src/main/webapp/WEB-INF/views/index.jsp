<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="tw-zh">
<head>
  <title>首頁</title>
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
body{
background: #ffffff; /* Old browsers */
background: -moz-linear-gradient(top, #ffffff 0%, #f1f1f1 50%, #f8f2fc 53%, #f4edf7 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #ffffff 0%,#f1f1f1 50%,#f8f2fc 53%,#f4edf7 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #ffffff 0%,#f1f1f1 50%,#f8f2fc 53%,#f4edf7 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f4edf7',GradientType=0 ); /* IE6-9 */
margin: 0;
font-family: 微軟正黑體, Arial, Helvetica, sans-serif;
font-size: 17px;
}

#myVideo {
    position: relative;
    right: 0;
    bottom:200px;
    min-width: 100%; 
    min-height: 0%;
}

.content {
    position:absolute;  
    bottom: 0;
    background: rgba(204, 204, 255, 0.3);
    color: #AAAAAA;
    width: 100%;
    margin-top:100px;
    padding: 20px;
}

#myBtn {
    width: 200px;
    font-size: 18px;
    /*padding: 10px;*/
    border: none;
    background:#0072e3;
    color: #fff;
    cursor: pointer;
}

#myBtn:hover {
    background: #ddd;
    color: black;
}
.ht{
	font-weight:900;
}
</style>
 <!--footer-->
<style>  
 section{
    text-align:center;
    background-color:#51321C
    
 }
 section>a{
     display:block;
 }

#span{
  padding-left:15px;
  letter-spacing:3px;
  color:white;
  font-size:3em;
}	
 	
</style>
<!--超過100個字以"..."取代-->
<style>
#ull{

/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f6f8f9+0,e5ebee+50,d7dee3+51,f5f7f9+100;White+Gloss */
background: rgb(246,248,249); /* Old browsers */
background: -moz-linear-gradient(top, rgba(246,248,249,1) 0%, rgba(229,235,238,1) 50%, rgba(215,222,227,1) 51%, rgba(245,247,249,1) 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, rgba(246,248,249,1) 0%,rgba(229,235,238,1) 50%,rgba(215,222,227,1) 51%,rgba(245,247,249,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f6f8f9', endColorstr='#f5f7f9',GradientType=0 ); /* IE6-9 */
}
</style>
<!--跑馬燈-->
<style>
	div#abgne_marquee {
	position: relative;
	overflow: hidden;	/* 超出範圍的部份要隱藏 */
	width: auto;
	height: 31px;
	border: 1px solid #ccc;
	background:#FFEE99;
	}
	div#abgne_marquee ul, div#abgne_marquee li {
		margin: 0;
		padding: 0;
		list-style: none;
	}
	div#abgne_marquee ul {
		position: absolute;
		left: 30px;
		}
	
	div#abgne_marquee ul li a {
		display: block;
		overflow: hidden;	
		font-size:18px;
		height: 30px;
		/*line-height: 15px;*/
		text-decoration: none;
	}
	div#abgne_marquee div.marquee_btn {
		position: absolute;
		cursor: pointer;
	}
	div#abgne_marquee div#marquee_next_btn {
		left: 5px;
	}
	div#abgne_marquee div#marquee_prev_btn {
		right: 5px;
	}
</style>
<!--跑馬燈-->

<script>
	$(function(){
	    var len = 100; 
	    $(".JQellipsis").each(function(i){
	        if($(this).text().length>len){
	            $(this).attr("title",$(this).text());
	            var text=$(this).text().substring(0,len-1)+"...";
	            $(this).text(text);
	        }
	    });
	});
	$(function(){
	    var len = 16; 
	    $(".ht").each(function(i){
	        if($(this).text().length>len){
	            $(this).attr("title",$(this).text());
	            var text=$(this).text().substring(0,len-1)+"...";
	            $(this).text(text);
	        }
	    });
	});
</script>
</head>
<body>
<c:if test="${empty sessionScope.user}">
	<jsp:include page="navbar.jsp" flush="true"></jsp:include>
</c:if>
<c:if test="${!empty sessionScope.user}">
	<jsp:include page="navbarOut.jsp" flush="true"></jsp:include>
</c:if>
<video autoplay muted loop id="myVideo">
  <source src="./video/w.mp4" type="video/mp4">
  Your browser does not support HTML5 video.
</video>
<div class="content">
  <h1>臺灣觀光</h1>
  <p>交通部觀光局為全力爭取日本來台超過30％年青族群市場，再次延續106年宣傳力道，由長澤雅美擔綱臺灣對日宣傳的形象代言人，於107年度推出嶄新宣傳影片。長澤小姐於去年(106年)12月專程來臺拍攝宣傳影片及平面視覺設計，以日本演藝圈的「臺灣通」來詮釋臺灣新觀光形象。原訂於今年2月推出的首映，基於對臺灣的情感和同理心，經多方討論後，建議以協助花蓮復甦為最優先考量，爰延後相關宣傳活動。花蓮地區在政府及民間團體的同力合作之下，逐步導入國際旅客，已漸漸恢復往昔。交通部觀光局於本(4)月16日起在日本正式推出新年度宣傳，長澤雅美延續106年「Meet Colors!台灣」宣傳主題，107年則傳達更豐富多彩及魅力十足的「新。臺灣－Taiwan+」觀光形象。</p>
  <button id="myBtn" onclick="myFunction()">Pause</button>

</div>

<div class="container-fluid" style="margin-top:-150px" >
        <div class="col-md-12" id="abgne_marquee">
    		<div class="marquee_btn" id="marquee_next_btn"><i class="fas fa-bullhorn"></i></div>
        		<ul>
        			<li><a href="http://news.ltn.com.tw/news/life/breakingnews/2402663">【旅遊快訊】螢光大爆發 全台賞螢景點報你知</a></li>
        			<li><a href="http://www.cpfcnews.tw/index.php/newmsg/20681-2018-3">【旅遊快訊】澎湖海上花火節4/19燦爛登場</a></li>
        			<li><a href="https://www.travelking.com.tw/news/2018/april/fulong-sand-sculpture-art.html">【旅遊快訊】金沙奇航冒險去 福隆沙雕季4/21精彩啟航</a></li>
        		</ul>
    	
    	</div>
    <div style="display:block;text-align:left;color:#444444"><h4  style="font-weight:900">相片集</h4></div>
	<div class="row" style="margin:20px">
	
	    		<div class="col-md-9">
	    		<div class="row" style="margin:0;padding:0">
	    		    <div id="col-md-4" class="col-md-4" style="border:4px solid;padding:20px;color:#DCDCDC"><img alt="Bootstrap Image Preview" src="${views[0].imgs[1].url }" style="text-align:center;display:block; margin:auto; "/></div>
	    		    <div id="col-md-4" class="col-md-4" style="border:4px solid;padding:20px;color:#DCDCDC"><img alt="Bootstrap Image Preview" src="${views[1].imgs[0].url }" style="text-align:center;display:block; margin:auto; "/></div>
	    		    <div id="col-md-4" class="col-md-4" style="border:4px solid;padding:20px;color:#DCDCDC"><img alt="Bootstrap Image Preview" src="${views[4].imgs[0].url }" style="text-align:center;display:block; margin:auto; "/></div>
		        </div>
		        	    		<div class="row" style="margin:0;padding:0">
	    		    <div id="col-md-4" class="col-md-4" style="border:4px solid;padding:20px;color:#DCDCDC"><img alt="Bootstrap Image Preview" src="${restaurant[0].imgs[0].url }" style="text-align:center;display:block; margin:auto;"/></div>
	    		    <div id="col-md-4" class="col-md-4" style="border:4px solid;padding:20px;color:#DCDCDC"><img alt="Bootstrap Image Preview" src="${restaurant[1].imgs[0].url }" style="text-align:center;display:block; margin:auto;"/></div>
	    		    <div id="col-md-4" class="col-md-4" style="border:4px solid;padding:20px;color:#DCDCDC"><img alt="Bootstrap Image Preview" src="${restaurant[4].imgs[0].url }" style="text-align:center;display:block; margin:auto;"/></div>
		        </div>
				</div>
				<div class="col-md-3">
					<div class="index-news">
                        <div class="title" style="background:#FFAA33;color:#FFFFFF">最 新 消 息 <span>News</span></div>
                        <div class="news-list"style="border-style:solid solid none solid;border-color:#DCDCDC;opacity:0.5">
                            <div class="date">2018-04-10</div>
                            <p>【超商付款取貨啟用】公告</p>
                            <p>即日起超商取貨付款服務正式啟用，<br>
							24小時皆可到店取貨，歡迎大家多加利用！<br>
							</p>
                            <a href="https://www.ximo.com.tw/news/【超商付款取貨啟用】公告.html">詳全文</a>
                        </div>
	                        <div class="news-list" style="border-style:dotted solid solid solid;border-color:#DCDCDC;opacity:0.5">
                            <div class="date">2017-11-07</div>
                            <p>【會員帳號】更換公告</p>
                            <p>改版後會員帳號一律改成註冊信箱，已註冊過的會員不用再重新註冊喔~</p>
                            <a href="https://www.ximo.com.tw/news/【會員帳號】更換公告.html">詳全文</a>
                        </div>
	                    </div>
				</div>

	</div>
</div>

<div class="container-fluid">
	<div style="display:block;text-align:left;color:#444444;"><h4 style="font-weight:900">媒體報導</h4></div>
	<div class="row">
		<div class="col-md-4" >
			<div class="jumbotron"style="background-color:rgba(0,51,119,0.5);opacity:0.8">
				<h2 class="ht">
					觀光局攜FOX體育台，推廣單車環島遊台
				</h2>
				<p class="JQellipsis">
					觀光局今年委由FOX體育台創建單車環島遊台灣國際入口網站（Taiwan on 2 Wheels），已於1月正式啟用，透過此專門提供台灣自行車旅遊資訊的網路平台，向熱愛自行車旅遊的外籍旅客介紹不同的自行車路線、租車資訊及裝備建議。
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="http://www.chinatimes.com/realtimenews/20180424001065-260410">詳細介紹</a>
				</p>
			</div>
		</div>
		<div class="col-md-4">
			<div class="jumbotron"  style="background:#5599FF">
				<h2 class="ht">
					台灣觀巴旅遊護照花蓮6行程拚觀光
				</h2>
				<p class="JQellipsis">
				交通部觀光局委託台灣觀光巴士協會，發售限量一千本的「Train-Bus台灣觀巴旅遊護照」，每本售價八八八元，精選全國十條路線供遊客自由選擇，但觀光局為提振花蓮觀光，特別把原本只有一條優惠路線的花蓮，另外由旅行社加碼規畫，推出共六條優惠行程，歡迎遊客搭火車到花蓮，再透過觀光巴士把花蓮玩透透。
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="http://news.ltn.com.tw/news/local/paper/1194885">詳細介紹</a>
				</p>
			</div>
		</div>
		<div class="col-md-4">
			<div class="jumbotron" style="background:#99BBFF">
				<h2 class="ht">
					台北國際觀光博覽會下周登場 暑假團破盤搶市
				</h2>
				<p class="JQellipsis">
				上半年度觀光盛事「2018台北國際觀光博覽會」即將在5月4日至5月7日於世貿一館舉行。雄獅旅遊（2731）表示，今年不僅將祭出澳門自由行3,000元有找、暑假出發韓國四日萬元有找等超值優惠，更瞄準分眾旅遊需求推出世界節慶、極地探險、達人帶路等特色行程，另外，不論是家族旅遊、親子旅遊暑假往往是旺季，暑假團在博覽會上也是一大熱門。
				</p>
				<p>
					<a class="btn btn-primary btn-large" href="https://udn.com/news/story/7241/3106499">詳細介紹</a>
				</p>
			</div>
		</div>
	</div>
</div>


<section style="margin-top:30px">
<a  href="#" style="text-decoration:none;"><i class="far fa-envelope" style="color:white;font-size:3em;margin-top:5px;"></i><span id="span">聯絡我們</span></a>
</section>
<footer id="_footer">
    <div class="footer" id="footer">
        <div class="container">
            <div class="row">
                <div class="col-lg-4  col-md-4 col-sm-4 col-xs-6"style="text-align:center">
                    <h3 >關於TravelGO</h3>
                </div>
                <div class="col-lg-4  col-md-4 col-sm-4 col-xs-6"style="text-align:center">
                    <h3> 教學指南 </h3>
                    <ul>
                        <li> <a href="#">如何操作 How to use </a> </li>
                        <li> <a href="#"> 如何註冊 </a> </li>
                        <li> <a href="#"> 常見問題 </a> </li>
                    </ul>
                </div>
                <div class="col-lg-4  col-md-4 col-sm-4 col-xs-6"style="text-align:center">
                    <h3> 會員權益 </h3>
                    <ul>
                        <li> <a href="#"> 個人隱私保密政策 </a> </li>
                        <li> <a href="#"> 會員相關規定 </a> </li>
                        <li> <a href="#"> 服務條款 </a> </li>
                        <li> <a href="#"> 異業合作 </a> </li>
                    </ul>
                </div>
                </div>
            </div>
    <div class="footer-bottom">
        <div class="container">
            <p class="pull-left"> Copyright © 2018 Attractions Team. All right reserved. </p>
            <div class="pull-right">
            </div>
        </div>
    </div>
   </div>
</footer>
<script>
	var video = document.getElementById("myVideo");
	var btn = document.getElementById("myBtn");
	function myFunction() {
	  if (video.paused) {
	    video.play();
	    btn.innerHTML = "Pause";
	  } else {
	    video.pause();
	    btn.innerHTML = "Play";
	  }
	}
	//解決圖片溢出
	window.onload = function(){
	    var imgs = document.getElementsByTagName("img");
	    var contentLeft = document.getElementById("col-md-4");
	    for(var i=0; i<imgs.length; i++){
	        imgs[i].style["max-width"] = contentLeft.offsetWidth - 40 + "px";
	    }
	}
	window.onresize = function(){
	    var imgs = document.getElementsByTagName("img");
	    var contentLeft = document.getElementById("col-md-4");
	    for(var i=0; i<imgs.length; i++){
	        imgs[i].style["max-width"] = contentLeft.offsetWidth - 40 + "px";
	    }   
	}

</script>
<script>
	$(function(){
	// 先取得 div#abgne_marquee ul
	// 接著把 ul 中的 li 項目再重覆加入 ul 中(等於有兩組內容)
	// 再來取得 div#abgne_marquee 的高來決定每次跑馬燈移動的距離
	// 設定跑馬燈移動的速度及輪播的速度
	var $marqueeUl = $('div#abgne_marquee ul'),
		$marqueeli = $marqueeUl.append($marqueeUl.html()).children(),
		_height = $('div#abgne_marquee').height() * -1,
		scrollSpeed = 300,
		timer,
		speed = 3000 + scrollSpeed,
		direction = 0,	// 0 表示往上, 1 表示往下
		_lock = false;
 
	// 先把 $marqueeli 移動到第二組
	$marqueeUl.css('top', $marqueeli.length / 2 * _height);
 
	// 幫左邊 $marqueeli 加上 hover 事件
	// 當滑鼠移入時停止計時器；反之則啟動
	$marqueeli.hover(function(){
		clearTimeout(timer);
	}, function(){
		timer = setTimeout(showad, speed);
	});
 
	// 判斷要往上還是往下
	$('div#abgne_marquee .marquee_btn').click(function(){
		if(_lock) return;
		clearTimeout(timer);
		direction = $(this).attr('id') == 'marquee_next_btn' ? 0 : 1;
		showad();
	});
 
	// 控制跑馬燈上下移動的處理函式
	function showad(){
		_lock = !_lock;
		var _now = $marqueeUl.position().top / _height;
		_now = (direction ? _now - 1 + $marqueeli.length : _now + 1)  % $marqueeli.length;
 
		// $marqueeUl 移動
		$marqueeUl.animate({
			top: _now * _height
		}, scrollSpeed, function(){
			// 如果已經移動到第二組時...則馬上把 top 設回到第一組的最後一筆
			// 藉此產生不間斷的輪播
			if(_now == $marqueeli.length - 1){
				$marqueeUl.css('top', $marqueeli.length / 2 * _height - _height);
			}else if(_now == 0){
				$marqueeUl.css('top', $marqueeli.length / 2 * _height);
			}
			_lock = !_lock;
		});
 
		// 再啟動計時器
		timer = setTimeout(showad, speed);
	}
 
	// 啟動計時器
	timer = setTimeout(showad, speed);
 
	$('a').focus(function(){
		this.blur();
	});
});
</script>

</body>