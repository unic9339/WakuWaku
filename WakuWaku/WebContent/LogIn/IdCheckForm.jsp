<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<link href="../CSS/idCheckForm.css" rel="stylesheet" type="text/css">
<title>아이디 중복 체크</title>

<script>
	var httpRequest = null;

	// httpRequest 객체 생성
	function getXMLHttpRequest() {
		var httpRequest = null;

		if (window.ActiveXObject) {
			try {
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
				try {
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				} catch (e2) {
					httpRequest = null;
				}
			}
		} else if (window.XMLHttpRequest) {
			httpRequest = new window.XMLHttpRequest();
		}
		return httpRequest;
	}
	
	// 회원가입창의 아이디 입력란의 값을 가져온다.
	function pValue(){
		document.getElementById("userId").value = opener.document.userInfo.id.value;
	}


	
	function idCheck(){
		var id = document.getElementById("userId").value;
		
		if(!id){
			alert("ID를 입력하시 않았습니다.");
			return false;
		}else if((id<"0"||id>"9")&&(id<"A"||id>"Z")&&(id<"a"||id>"z")){ 
            alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
            return false;
        }else{
        	var param="id="+id
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = callback;
            httpRequest.open("POST", "userIdCheck.user", true);    
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
            httpRequest.send(param);
        }
	}
	
	function callback(){
		if(httpRequest.readyState == 4){
            // 결과값을 가져온다.
            var resultText = httpRequest.responseText;
            if(resultText == 0){
                alert("사용할수없는 아이디입니다.");
                document.getElementById("cancelBtn").style.visibility="visible";
                document.getElementById("useBtn").style.visibility="hidden";
                document.getElementById("msg").innerHTML ="";
            } 
            else if(resultText == 1){ 
            	document.getElementById("cancelBtn").style.visibility="hidden";
            	document.getElementById("useBtn").style.visibility="visible";
                document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
            }
        }
    }
	
	// 부모창으로 값 전달
      function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.userInfo.idDuplication.value ="idCheck";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.userInfo.id.value = document.getElementById("userId").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }  
</script>
</head>
<body onload="pValue()">
<div id="wrap">
	<br>
	<b><font size="4" color="gray">아이디 중복체크</font></b>
	<hr size="1"width="460">
	<br>
	<div id="chk">
		<form id="checkForm">
			<input type="text" name="userId" id="userId">
			<input type="button" value="중복확인" onclick="idCheck()">
		</form>
		<div id="msg"></div>
		<br>
		<input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">		
		<input id="cancelBtn" type="button" value="취소" onclick="window.close()">
		<br>
	</div>
</div>
</body>
</html>