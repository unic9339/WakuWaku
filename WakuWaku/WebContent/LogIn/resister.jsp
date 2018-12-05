<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../CSS/LogIn.css" rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>

<title>회원가입창</title>
<script type="text/javascript">
	//회원가입 화면의 입력값들을 검사
	function checkValue(){
		var form = document.userInfo;
		
		if(!form.id.value){
			alert("아이디를 입력하세요");
			return false;
		}
		if(form.idDuplication.value != "idCheck"){
			alert("아이디를 중복체크해주세요");
			return false;
		}
		if(!form.passwd.value){
			alert("비밀번호를 입력하세요");
			return false;
		}
		if(form.passwd.value != form.passwdcheck.value){
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}
		if(!form.uname.value){
			alert("이름을 입력하세요");
			return false;
		}
	}
	
	function openIdChk(){
		window.name = "parentForm";
		window.open("IdCheckForm.jsp",
        "chkForm", "width=500, height=300, resizable = no, scrollbars = no");    
    }
	
    function inputIdChk(){
        document.userInfo.idDuplication.value ="idUncheck";
    }

</script>
</head>
<body>

	<form action="userinsert.user" method="post" name="userInfo" onsubmit="return checkValue()">
		<div class="container">
		
			<div class="form-group">
				<label for="inputdefault">아이디(1 ~ 10자 이내, 공백불가능)</label>
				<input class="form-control" id="inputdefault" type="text" placeholder="아이디입력" name="id" onkeydown="inputIdChk()">
				<input type="button" value="중복확인" onclick="openIdChk()">
				<input type="hidden" name="idDuplication" value="idUncheck">				
			</div>
			
			<div class="form-group">
				<label for="inputdefault">휴대폰번호</label>
				<input class="form-control" id="inputdefault" type="text" placeholder="휴대폰번호 입력" name="phone">
			</div>
			
		
			
			<div class="form-group">
				<label for="inputdefault">비밀번호(4 ~ 8자리 이내)</label>
				<input class="form-control" id="inputdefault" type="text" placeholder="비밀번호 입력" name="passwd">
			</div>
			
			<div class="form-group">
				<label for="inputdefault">이름입력</label>
				<input class="form-control" id="inputdefault" type="text" placeholder="이름" name="uname">
			</div>
			
			<div class="form-group">
				<label for="inputdefault">이메일 입력</label>
				<input class="form-control" id="inputdefault" type="text" placeholder="이메일 주소" name="이메일">
			</div>
			
			<div class="form-group">
				<label for="datepicker1">생년월일</label>
				<input class="form-control" id="datepicker1" type="text" name="birth">
			</div>
		</div>

		<div class="container">
			<h4>성별</h4>
			<div class="form-check-inline">
				<label class="form-check-label" for="radio1">
				<input type="radio" class="form-check-input" name="gender" value="male" checked>남성
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label" for="radio2">
				<input type="radio" class="form-check-input" name="gender" value="female">여성
				</label>
			</div>
		</div>

		<br>
		<input id="sub" type="submit" class="btn btn-primary btn-sm" value="회원등록""/>&nbsp;
		<input onclick="location.href = '../WakuMain/MainPage.jsp'" id="sub" type="reset" class="btn btn-primary btn-sm" value="이전화면" />
	</form>
</body>
<script src="register.js" type="text/javascript"></script>
</html>