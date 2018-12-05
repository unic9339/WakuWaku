<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="../CSS/LeftMenu.css" rel="stylesheet" type="text/css">
<%
	int menu = 1; // menu parameter 가 없으면 디폴트 1 로 동작
	String menu_param = request.getParameter("menu");
	if (menu_param != null) { // menu parameter가 넘어온 경우에만
		menu = Integer.parseInt(menu_param);
	}
	// 1 <= menu <= 6
	if (menu > 5)
		menu = 5;
	if (menu < 1)
		menu = 1;
%>
<!-- left 사이트 메뉴 시작 -->
<script type="text/javascript">

	function checkValue(){
		inputForm = eval("document.loginInfo");
		if(!inputForm.id.value){
			alert("아이디를 입력하세요");
			inputForm.id.focus();
			return false;
		}
		if(!inputForm.passwd.value){
			alert("패스워드를 입력하세요");
			inputForm.passwd.focus();
			return false;
		}
	}
	function goJoinForm(){		//로그인 창으로 이동
		location.href="../LogIn/resister.jsp";
	}
</script>

<div class="col-sm-4">

	<%
	// "id" 값이 있으면 로그인 상태
	if(session.getAttribute("id")!=null){
	%>
		<h2>로그인 상태입니다.</h2>
		<h3><%=session.getAttribute("id") %>님 로그인</h3>
		<form action="../LogIn/logout.jsp">
			<input type="submit" value="로그아웃"><br>
		</form>
	<%
	}else{	// 로그인 상태가 아닌경우 로그인 하기
	%>
		<form action="../LogIn/loginOK.jsp" method="post" name="loginInfo" onsubmit="return checkValue()">
			<table>
				<tr>
					<td>아이디 : </td>
					<td><input type="text" name="id" id="id"></td>
				</tr>
				<tr>
					<td>비밀번호: </td>
					<td><input type="password" name="passwd" id="passwd"></td>
			</table>
			<br>
			<input type="submit" value="로그인"/>
			<input type="button" value="회원가입" onclick="goJoinForm()"/>
		</form>
	<%
		String msg=request.getParameter("msg");
		
		if(msg!=null && msg.equals("0"))
		{
			out.println("<br>");
			out.println("<font color='red' size='5'>비밀번호를 확인해 주세요.</font>");
		}else if(msg!=null && msg.equals("-1")){
			out.println("<br>");
			out.println("<font color='red' size='5'>아이디를 확인해 주세요.</font>");
		}
	} %>
	<br><br>

	<div class="vertical-menu">

		<a class="nav-link <%=(menu == 1)?"active":""%>"
			href="<%=(menu == 1)?"#":"MainPage.jsp?menu=1"%>">Main</a>
			
		<a class="nav-link <%=(menu == 2)?"active":""%>"
			href="<%=(menu == 2)?"#":"MainPage.jsp?menu=2"%>">공지사항</a>
			
		<a class="nav-link <%=(menu == 3)?"active":""%>"
			href="<%=(menu == 3)?"#":"MainPage.jsp?menu=3"%>">음식사진 게시글</a>
			
		<a class="nav-link <%=(menu == 4)?"active":""%>"
			href="<%=(menu == 4)?"#":"MainPage.jsp?menu=4"%>">리뷰 방</a>
			
		<a class="nav-link <%=(menu == 5)?"active":""%>"
			href="<%=(menu == 5)?"#":"MainPage.jsp?menu=5"%>">평점 방</a>
	</div>
	<hr class="d-sm-none">
</div>


<!-- left 사이트 메뉴 끝 -->