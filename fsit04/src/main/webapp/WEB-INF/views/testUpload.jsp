<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="saveFile" method="post" enctype="multipart/form-data">
			<input type="file" id="file" name="file" accept="image/gif, image/jpeg, image/png" style="float: right;" />
			user_id<input type="text" id="user_id" name="user_id"   />
			total_id<input type="text" id="total_id" name="total_id"   />
			lat<input type="text" id="lat" name="lat"   />
			lng<input type="text" id="lng" name="lng"   />
			<button type="submit" class="btn btn-default"id="submit">GO</button>
	</form>
	

</body>
</html>