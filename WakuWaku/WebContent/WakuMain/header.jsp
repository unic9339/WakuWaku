<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="../CSS/main.css"  rel="stylesheet" type="text/css">
<!-- Header시작 -->
<div id="bg">
	<ul class="searchLogo">
		<li id="word"><img src="../img/logo.png" id="wakuwakuLogo">ワクワク</li>
	</ul>
	<nav class="navbar ">
		<div class="container-fluid">
			<div class="navbar-header"></div>
			<ul class="nav nav-pills">
			
			</ul>
		</div>
	</nav>

	<div class="container">
		<form action="/action_page.php">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="맛집 검색"
					name="search">
				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<br>
</div>

<!-- Header끝 -->