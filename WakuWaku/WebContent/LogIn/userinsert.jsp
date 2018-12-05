<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int cntUser = (Integer) request.getAttribute("result");

	if (cntUser > 0) {
%>
 <script type="text/javascript">
	alert("회원가입 성공!!");
	location.href = "../WakuMain/MainPage.jsp"; //성공 후 화면으로! 수정
</script>
<%
	} else {
%>
 <script type="text/javascript">
	alert("회원가입 실패!!");
	location.herf = "../WakuMain/MainPage.jsp";
</script>
<%
	}
%>