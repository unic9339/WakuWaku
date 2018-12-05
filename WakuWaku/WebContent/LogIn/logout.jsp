<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String sessionName = "id";

	// 세션 삭제
	session.removeAttribute(sessionName);
%>

<script>
alert("로그아웃 되었습니다");
location.href("../WakuMain/MainPage.jsp");
</script>
