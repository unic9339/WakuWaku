<%@page import="user.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	
	MemberDAO dao = new MemberDAO();
	
	int check = dao.loginCheck(id, passwd);
	
	out.println("확인!!");
	
	String msg = "";
	
	if(check == 1){// 로그인 성공
		session.setAttribute("id", id);
		msg = "../WakuMain/MainPage.jsp";
	}else if(check == 0){	// 비밀번호가 틀릴경우
		msg = "../WakuMain/MainPage.jsp?msg=0";
	}else{
		msg = "../WakuMain/MainPage.jsp?msg=-1";		
	}
	
	response.sendRedirect(msg);
%>
<script>
location.href = "../WakuMain/MainPage.jsp";
</script>