<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.*" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
</head>
<%
	MemberDTO [] arr = (MemberDTO[])request.getAttribute("userlist");

%>
<body>
	<hr>
	<h2>리스트</h2>
	<a href="register.jsp">등록/검색/삭제</a>
	<br><br>
	<%
	if(arr==null|| arr.length==0){
		out.println("맴버가 없습니다");
		return;
	}
	%>
		<table style="width:100%;">
		<tr>
			<th>번호</th>
			<th>아이디</th>
			<th>비밀번호</th>
			<th>이름</th>
			<th>성별</th>
			<th>폰번호</th>
			<th>권한</th>
			<th>이메일</th>
			<th>생일</th>
			<th>가입일</th>
		</tr>
		
		<%
		for(int i=0;i<arr.length;i++){
			out.print("<tr>");
			out.println("<td>"+arr[i].getUnum()+"</td>");
			out.println("<td>"+arr[i].getId()+"</td>");
			out.println("<td>"+arr[i].getPasswd()+"</td>");
			out.println("<td>"+arr[i].getUname()+"</td>");
			out.println("<td>"+arr[i].getGender()+"</td>");
			out.println("<td>"+arr[i].getPerm()+"</td>");
			out.println("<td>"+arr[i].getEmail()+"</td>");
			out.println("<td>"+arr[i].getBirth()+"</td>");
			out.println("<td>"+arr[i].getUregdate()+"</td>");
		}
		%>
	
</body>
</html>