<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>WelCome ワクワク</title>
<link href="../CSS/FirstView.css" rel="stylesheet"	type="text/css">
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<script>
$(document).ready(function(){
	setTimeout(function() {
		location.href = "MainPage.jsp";
		}, 10000);
});
</script>
<body>

<div class="conA">
<h1 >ワクワク</h1>

		<h4>시작하기</h4>
		<a href="MainPage.jsp">
			<span class="glyphicon glyphicon-triangle-right"></span>
		</a>
</div>

	<p>맛있고 즐거운 라이프로그</p>

</body>
</html>