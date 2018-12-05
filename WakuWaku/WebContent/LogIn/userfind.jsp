<%@page import="user.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 입력값을 얻어오기
	String id = request.getParameter("id");
	// 유효성 체크
	if(id == null || id.trim().equals("")){
		%>
		<script>
			alert('검색할 ID를 입력하세요');
			history.back();
		</script>
		<%
		return;
	}

%>
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>검색</title>
</head>
<body>

<%
	MemberDTO userArr[] = (MemberDTO[])request.getAttribute("list");
	if(userArr == null || userArr.length == 0){

	}else{
	}
%>

</body>
</html>