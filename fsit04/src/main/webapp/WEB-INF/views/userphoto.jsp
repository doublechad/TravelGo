<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<html>
<head>
    <style>
        html, body {
        height:100%;
        margin:0;
      }
      
      #frame{
          position: absolute;
          height:90%;
          width: 100%;
           top:10%;
      }
      #map {
       position: absolute;
       margin-right:5%;
       margin-left:5%;
       float:left;
       background-color:#0ff;
       width: 90%;
       height: 70%;
       }
       #test{
        margin-right:5%;
        margin-left:5%;
        position: absolute;
        width: 90%;
        height: 30%;
        top:70%;
       }
     
       #imglist{
        white-space:nowrap;
        height: 90%;
        width: 100%;
        overflow-x:auto;
        overflow-y:hidden;
       
       }
       img{
        width:auto;
        height:100%;
        margin-right:10px;
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
    </style>
</head>
<body>
    <button id="debug">測試</button>
     <div id="frame">
        <div id="map"></div>
    </div>
</body>   

<script>
      //googleMap 
      var map
      var debugbutton =document.getElementById("debug");
      var arrayTest =[];
      //圖片來源
      var test = '<img src="/FSIT04/photo/3.jpg"></img>';
      
      var pos = {
              lat: 25.047202,
              lng: 121.516863
            };
      debugbutton.onclick = function(){
            // 圖標
        loadUserimgs();
       /* var text ='[{"stitle":"新北投溫泉區","filepath":"/fsit04/upload/1_1524347529863.jpg","lng":121.516863,"name":"測試員01","id":1,"lat":25.047202}]';
        var arr = JSON.parse(text);
        alert(arr[0].stitle  +" : "+arr.length);
        updateMap(arr);*/
        
      };
      function loadUserimgs() {
           var xhttp = new XMLHttpRequest();
           xhttp.onreadystatechange = function() {
             if (this.readyState == 4 && this.status == 200) {
            	 var arr = JSON.parse( this.responseText);
           // 	 alert(arr[0].stitle  +" : "+arr.length)
           // 	  alert(arr[0].lat  +" : "+arr[0].lng)
                 updateMap(arr);                
             }
           };
           xhttp.open("GET", "http://36.235.39.18:8080/fsit04/userimgs?user_id=1", true);
           xhttp.send();
         }
      
      function updateMap(arr) {
          var map = new google.maps.Map(document.getElementById('map'), {
                 zoom: 10,
                 center: pos
               });
         for(var i=0;i<arr.length;i++){
             var postion = {
                   lat: arr[i].lat,
                   lng: arr[i].lng
                 };
            
             var  marker = new google.maps.Marker({
               map: map,
               position: postion,
               draggable: false
             });
            
             var boxText = document.createElement("div");
     		boxText.style.cssText = "border: 0px solid #ff0; margin-top: 0px;  padding: 0px;";
     		boxText.innerHTML = '<img src="'+arr[i].filepath+'" style="width:150px; "/>'+
     		                    '<div class="phoneytext">日期:107/01/01</div>'+
     		                    '<div class="phoneytext">'+arr[i].stitle+'</div>';
             //對話窗
             var infoBubble = new InfoBubble({
               borderRadius: 6,
               shadowStyle: 1,
               backgroundColor: '#0072e3',
               hideCloseButton: true,
               content: boxText,
               maxWidth: 300
             });
             infoBubble.setPadding(10);
             infoBubble.open(map, marker);
             
             
             var object ={"index":i,"marker":marker,"infoBubble":infoBubble};
             arrayTest.push(object);
         }
         
         arrayTest.forEach(function(element) {
           element.marker.addListener('click', function() {
                  if (!element.infoBubble.isOpen()) {
                     element.infoBubble.open(map, element.marker);
                   }else{
                     element.infoBubble.close(); 
                   }
                 
               });
           
         });
         
        
         
     } 
         
    
    
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 13,
            center: pos
          });

    }
    </script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCGgxfNALIYB5ngyxEQuvfIswpw96yiA8o&callback=initMap">
</script>
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