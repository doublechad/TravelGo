<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script defer src="https://use.fontawesome.com/releases/v5.0.9/js/all.js" integrity="sha384-8iPTk2s/jMVj81dnzb/iFR2sdA7u06vHJyyLlAd4snFpCl/SnyUjRrbdJsw1pGIl" crossorigin="anonymous"></script>
    <nav id="sidebar" style="height:auto;">
                <div class="sidebar-header"style="margin-top:60px;margin-right:2px">
                  <img src="/fsit04/userimg/${user.id }.jpg" style="height:250px;width:220px"></img>
                </div>
                <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div id="card-763941">
				<div class="card">
					<div class="card-header">
						 <a  href="./pedit">個人資料管理</a>
					</div>
	
				</div>
				<div class="card">
					<div class="card-header"style="color:blue">
						 <a class="collapsed card-link" data-toggle="collapse" data-parent="#card-763941" href="#card-element-457705" style="color:blue">相簿管理</a>
					</div>
					<div id="card-element-457705" class="collapse">
						<div class="card-block">
						<a href="./myMap">足跡地圖</a>
						</div>
												<div class="card-block">
						<a href="./perimg">照片集</a>
						</div>
					</div>
				</div>
								<div class="card">
					<div class="card-header">
						 <a href="./myFavorite">我的最愛</a>
					</div>
		
				</div>
			</div>
		</div>
	</div>
</div>
            </nav>