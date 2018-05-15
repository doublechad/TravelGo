<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="tw-zh">
<head>
  <title>註冊</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
  <script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
</head>
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
  </style>
<body>
  <div class="container-fluid">
      <div class="col-md-12">
          <h1 style="font-weight:800;text-align:center">建立您的旅遊觀光帳戶</h1>
          <br>
      </div>
	<div class="row">
		<div class="col-md-6">
  <h4 style="text-align:center">只要一個帳戶，即可暢行所有 旅遊觀光 產品與服務</h4> 
  <br>
<h6 style="text-align:center">只要使用一個免費帳戶，就能盡享各種豐富的 旅遊觀光 服務。</h6> 
<br>
<div class="row">
<div class="col-md-1 offset-md-3"><i class="far fa-address-card" style="font-size:3em;"></i></div>
<div class="col-md-1"><i class="fab fa-android" style="font-size:3em;"></i></div>
<div class="col-md-1"><i class="far fa-envelope" style="font-size:3em;"></i></div>
<div class="col-md-1"><i class="fas fa-camera-retro" style="font-size:3em;"></i></div>
<div class="col-md-1"><i class="fas fa-search" style="font-size:3em;"></i></div>
</div>
<br>
<h5 style="text-align:center">隨時隨地使用所有服務</h3>
<img style="display:block; margin:auto;" src="./imgs/re1.png"></img>
		</div>
		<div class="col-md-6">
		      <div class="container">
            <div class="row"  style="text-align:center">
                <div class="col-md-6" id="accountb" style="text-align:center">
                   <div class="panel-heading" id="ck_Text">
                   </div>
                        <div class="panel-content">
                            <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="user/register" method="post">
			    <div class="row">
			        			<div class="form-group col-md-6">
					 
					<p style="text-align:left;font-weight:bold;">
						真實姓名
					</p>
					<input type="text" class="form-control" id="name" name="name"/>
				</div>
				<div class="form-group col-md-6">
					 
					<p style="text-align:left;font-weight:bold;">
						電話
					</p>
					<input type="text" class="form-control" id="phone" name="phone"/>
				</div>
			    </div>
	
								<div class="form-group">
					 
					<p style="text-align:left;font-weight:bold;">
						信箱
					</p>
					<input type="text" class="form-control" id="mail" name="mail" onchange="check_account()"/>
				</div>
			    <div class="row">
			        			<div class="form-group col-md-6">
					 
					<p style="text-align:left;font-weight:bold;">
						密碼
					</p>
					<input type="password" class="form-control" id="password" name ="password"/>
				</div>
				<div class="form-group col-md-6">
					 
					<p style="text-align:left;font-weight:bold;">
						密碼確認
					</p>
					<input type="password" class="form-control" id="ckpassword" />
				</div>
			    </div>

				<button type="submit" class="btn btn-primary">
					註冊
				</button>

                         
                 
			</form>
		</div>
	</div>
</div>

                        </div>
		                   <div class="panel-footer">
		            
		                   </div>    
		                </div>
		            </div>
		        </div>   
				</div>
			</div>
		</div>


</body>
<script type="text/javascript">
	var user_mail = document.getElementById("mail");
	var ck_Text = document.getElementById("ck_Text");
	function check_account (){
		var xhttp = new XMLHttpRequest();
		  xhttp.onreadystatechange = function() {
		    if (this.readyState == 4 && this.status == 200) {
		    	ck_Text.innerHTML=this.responseText;     
		    }
		  };
		  xhttp.open("POST", "user/check", true);
		  xhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		  xhttp.send("mail="+user_mail.value);
		
	}
</script>
</html>