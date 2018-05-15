<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% String stat =request.getParameter("erro");
   request.setAttribute("erro", stat);
%>
<html lang="tw-zh">
<head>
  <title>會員登入</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
 
  <style type="text/css">
.b{
/* Permalink - use to edit and share this gradient: http://colorzilla.com/gradient-editor/#f9fcf7+0,f5f9f0+100;L+Green+3D */
background: #f9fcf7; /* Old browsers */
background: -moz-linear-gradient(top, #f9fcf7 0%, #f5f9f0 100%); /* FF3.6-15 */
background: -webkit-linear-gradient(top, #f9fcf7 0%,#f5f9f0 100%); /* Chrome10-25,Safari5.1-6 */
background: linear-gradient(to bottom, #f9fcf7 0%,#f5f9f0 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f9fcf7', endColorstr='#f5f9f0',GradientType=0 ); /* IE6-9 */
}
.panel-heading{
    margin-top:50px;
    width:400px;
    height:50px;
    z-index:2;
    background:#F5F5F5;
    border-top:inset 0.5px;
    border-bottom: groove 0.4px;
    border-right:outset 0.5px;
    border-left:inset 0.5px;
    border-top-left-radius:5px;
    border-top-right-radius: 5px;
}
.panel-content{
  width:400px;
  height:400px;
  margin-bottom:-40px;
  background:#ffffff;
  z-index:-1;  
  border:ridge 0.5px;
  border-right:outset 0.3px;
  border-left:inset 0.5px;
}
.panel-footer{
    margin-bottom:50px;
    width:400px;
    height:50px;
    z-index:3;
    background:#F5F5F5;
    border-top:groove 0.8px;
    border-bottom:outset 2px;
    border-right:outset 0.5px;
    border-left:inset 0.5px;
    border-bottom-left-radius:5px;
    border-bottom-right-radius: 5px;
}
.fb-login-button{
	margin-top:10px;
}
  </style>
</head>
<body class="b">
		<div>${erro }</div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-4" id="accountb" style="text-align:center">
                   <div class="panel-heading">
                   </div>
                        <div class="panel-content">
                            <img src="./imgs/user.png"class="img-responsive" style="text-align:center;width:30%;height:30%">
                            <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="user/login" method="post">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						帳號
					</label>
					<input type="text" name="email" class="form-control" id="exampleInputEmail1" placeholder="電子郵件"/>
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						密碼
					</label>
					<input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="密碼"/>
				</div>

				<button type="submit" class="btn btn-primary" style="width:250px">
					登入
				</button>  
			</form>
			<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="continue_with" data-show-faces="false"  data-use-continue-as="false" onlogin="checkLoginState();"></div>
		</div>
	</div>
</div>

                        </div>
                   <div class="panel-footer" style="margin-top:20px">
                <a href="register" style="position: absolute;right:0;">Register!!</a>     
                   </div>    
                </div>
                
            </div>
        </div>   
      
        
</body>

<script>
		//This is called with the results from from FB.getLoginStatus().
		function statusChangeCallback(response) {
		  
		  if (response.status === 'connected') {
		    // Logged into your app and Facebook.
		         FB.api('/me',{fields: 'email,name'}, function(response) {
		          redirectPost(response);
		      })
		      
		  } else {
		   
		      alert("請先登入");
		  }
		}
		 //redirectPost to login
		 function redirectPost(response) {
		          console.log(response);
		          var form = document.createElement('form');
		          document.body.appendChild(form);
		          form.method = 'post';
		          form.action = '/fsit04/fbLogin';
		          var input = document.createElement('input');
		          input.type = 'hidden';
		          input.name = 'name';
		          input.value = response.name;
		          form.appendChild(input);
		          var input2 = document.createElement('input');
		          input2.type = 'hidden';
		          input2.name = 'mail';
		          input2.value = response.email;
		          form.appendChild(input2);
		          var input3 = document.createElement('input');
		          input3.type = 'hidden';
		          input3.name = 'type';
		          input3.value = 'fb';
		          form.appendChild(input3);
		          form.submit();
		      }
		
		function checkLoginState() {
		  FB.getLoginStatus(function(response) {
		    statusChangeCallback(response);
		  },{scope: 'public_profile,email'});
		}
		//initfblogin
		window.fbAsyncInit = function() {
		  FB.init({
		    appId      : '741220869419033',
		    cookie     : true,  
		                       
		    xfbml      : true,  
		    version    : 'v2.8' 
		  });
		};
			
		(function(d, s, id) {
		  var js, fjs = d.getElementsByTagName(s)[0];
		  if (d.getElementById(id)) return;
		  js = d.createElement(s); js.id = id;
		  js.src = "https://connect.facebook.net/zh_TW/sdk.js";
		  fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
</script>
</html>