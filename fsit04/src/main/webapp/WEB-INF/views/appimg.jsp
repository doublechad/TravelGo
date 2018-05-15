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

<div id="content" style="width:100%;margin-left:10px">
  			<div class="row">
  				<c:forEach var="img" items="${imgs }">
				<div class="responsive" id="t_box${img.id}">
				   <div class="gallery col-md-12" id="t_box2${img.id}">
				  		<form style="text-align:center" id="t_box3${img.id}">
				    		<a href="${img.filepath }" id="t_box4${img.id}">
				    		  <img src="${img.filepath }" alt="Northern Lights" style="width:600;height:400" id="img${img.id}">
				    		 
				    		</a>
				  		</form>
				   </div>
				</div>
				</c:forEach>
			</div>
		</div>		
</div>
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
		window.location = "./appimg"
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