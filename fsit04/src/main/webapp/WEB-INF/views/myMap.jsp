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
		.scrollFix {
			padding:10px;
		    line-height: 1.35;
		    overflow: hidden;
		    white-space: nowrap;
		}
       a:active
        {
            color: grey;
        }
         a::before{
        
            color: grey;
        }
        #map {
       position: relative;
       margin-right:0%;
       margin-left:0%;
       float:right;
       background-color:#0ff;
       width: 100%;
       height: 100%;
       }

      .phoneytext {
        text-shadow: 0 -1px 0 #000;
        color: #fff;
        font-family: Helvetica Neue, Helvetica, arial;
        font-size: 12px;
        line-height: 15px;
        padding: 4px 8px 4px 5px;
        font-weight: bold;
        
      }
      .tbm{
     	 margin-bottom:20px;
      }
  </style>
 <body>
		<nav class="navbar navbar-expand-md navbar-dark fixed-top cell" id="title_nav" style="background:#99BBFF;">
		  <a class="navbar-brand" href="./" id="tilte_bt">TravelGO</a>
		  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar"style="border-width:2px">
		    <span class="navbar-toggler-icon" id="sp"></span>
		  </button>
		  <div class="collapse navbar-collapse " id="collapsibleNavbar">
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
		    <li class="nav-item">
			    帳號:${sessionScope.user.mail}<br>名稱:${sessionScope.user.name}
			 </li> 
		      <li class="nav-item"  >
		        <a class="nav-link sign btn-circle" href="./signout"title="登出"style="border-style:dashed;text-align:center"><i class="fas fa-sign-out-alt"></i></a>
		      </li>
		    </ul>
		  </div>
		</nav>
		<div class="wrapper" style="height:1000px">
		   <jsp:include page="personBar.jsp" flush="true"></jsp:include>
		   <div class="dropdown" style="z-index:1;margin-top:70px;margin-right:42px;position:absolute;right:0px;">			 
				<select>
				  <option value="103">103</option>
				  <option value="104">104</option>
				  <option value="105">105</option>
				  <option value="106">106</option>
				  <option value="107">107</option>
				</select>      
				<select required>
				  <option value="1">一月</option>
				  <option value="2">二月</option>
				  <option value="3">三月</option>
				  <option value="4">四月</option>
				  <option value="5">五月</option>
				  <option value="6">六月</option>
				  <option value="7">七月</option>
				  <option value="8">八月</option>
				  <option value="9">九月</option>
				  <option value="10">十月</option>
				  <option value="11">十一月</option>
				  <option value="12">十二月</option>
				</select>
				<button id="debug" >查詢</button>			
  			</div>
		   <div id="map" ></div>
		</div>  
		 
		
		 
		<!-- map放這 -->
		<script>
		      //googleMap 
		      var map
		      var debugbutton =document.getElementById("debug");
		    //  var arrayTest =[]; 
		      var markers=[];
		      var pos = {
		              lat: 25.047202,
		              lng: 121.516863
		            };
		      var center ={
		    		  lat: 23.782662,
		    		  lng: 120.919262
		      };
		      var arr ;		     
		      debugbutton.onclick = function(){
		            // 圖標
		        loadUserimgs();
		      };
		      
		      function loadUserimgs() {
		           var xhttp = new XMLHttpRequest();
		           xhttp.onreadystatechange = function() {
		             if (this.readyState == 4 && this.status == 200) {
		            	 var arr = JSON.parse( this.responseText);		     
		            	 parseLats(arr);
		            	 updateMap();
		             }
		           };
		           xhttp.open("GET", "/fsit04/userimgs", true);
		           xhttp.send();
		      }
		      var data =[];
		      function parseLats(arr){
		          for (var i = 0; i < markers.length; i++) {
		            markers[i].setMap(null);
		          }
		          markers.length=0;
		          data.length=0;
		          for(var i=0;i<arr.length;i++){
		              var test ='<div class="scrollFix"><img src="'+arr[i].filepath+'" style="width:200px; height:150px"/>'+
		  		     			'<div class="phoneytext">日期:'+arr[i].uploadtime+'</div>'+
		  		     			'<div class="phoneytext tbm" >'+arr[i].stitle+'</div>';
		              var postion = {
		                    lat: arr[i].lat,
		                    lng: arr[i].lng,
		                    text:test
		                  };
		              data.push(postion);
		          }
		           window.mapData = data;
		      }
		      //更新地圖
		      var mapLibsReady = 0;
		      function updateMap() {
		          if (++ mapLibsReady < 2) return;
		          var map = new google.maps.Map(document.getElementById('map'), {
		                      zoom: 10,
		                      center: pos
		                  });
		          var oms = new OverlappingMarkerSpiderfier(map, { 
		                      markersWontMove: true,   // we promise not to move any markers, allowing optimizations
		                      markersWontHide: true,   // we promise not to change visibility of any markers, allowing optimizations
		                      basicFormatEvents: true  // allow the library to skip calculating advanced formatting information
		                  });
		                
		          for (var i = 0 ; i < window.mapData.length; i ++) {
		              
		              (function() {  // make a closure over the marker and marker data
		               /*  var infoBubble = new InfoBubble({
		                        borderRadius: 6,
		                        shadowStyle: 1,
		                        backgroundColor: '#0072e3',
		                        disableAutoPan: true,
		                        hideCloseButton: false,
		                        content: window.mapData[i].text,
		                        maxWidth: 300
		                    });*/
		                var infoBubble = new InfoBubble({
		                     map: map,
		                     content: window.mapData[i].text,		                    
		                     shadowStyle: 1,
		                     padding: 15,
		                     backgroundColor: 'rgb(57,57,57)',
		                     borderRadius: 4,
		                     arrowSize: 10,
		                     borderWidth: 1,
		                     borderColor: '#2c2c2c',
		                     disableAutoPan: true,
		                     hideCloseButton: false,
		                     arrowPosition: 30,
		                     backgroundClassName: 'phoney',
		                     arrowStyle: 2
		                   });
		                
		               // infoBubble.setPadding(15);
		                infoBubble.setMaxHeight(500);
		                var markerData = window.mapData[i];  // e.g. { lat: 50.123, lng: 0.123, text: 'XYZ' }
		                var marker = new google.maps.Marker({ position: markerData });  // markerData works here as a LatLngLiteral
		                google.maps.event.addListener(marker, 'spider_click', function(e) {  // 'spider_click', not plain 'click'
		                  if (!infoBubble.isOpen()) {
		                      infoBubble.open(map, marker);
		                    }else{
		                      infoBubble.close(); 
		                    }
		                });
		               oms.addMarker(marker);  // adds the marker to the spiderfier _and_ the map
		                markers.push(marker);
		              })();
		            }
		            var markerCluster = new MarkerClusterer(map, markers,{imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
		            markerCluster.setMaxZoom(15);
		      }   
		    function initMap() {
		        var map = new google.maps.Map(document.getElementById('map'), {
		            zoom: 8,
		            center: center
		          });		
		    }
		    </script>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGgxfNALIYB5ngyxEQuvfIswpw96yiA8o&callback=initMap"></script>
			<script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/OverlappingMarkerSpiderfier/1.0.3/oms.min.js?spiderfier_callback=updateMap"></script>			
			<script>
		      var script = '<script src="/fsit04/script/infoBubble';
		      if (document.location.search.indexOf('compiled') !== -1) {
		        script += '-compiled';
		      }
		      script += '.js"><' + '/script>';
		      document.write(script);
		    </script>
	</body>
</html>
