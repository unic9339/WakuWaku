<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int menu = 1; // menu parameter 가 없으면 디폴트 1 로 동작
	String menu_param = request.getParameter("menu");
	if (menu_param != null) { // menu parameter가 넘어온 경우에만
		menu = Integer.parseInt(menu_param);
	}
	// 1 <= menu <= 5
	if (menu > 5)
		menu = 5;
	if (menu < 1)
		menu = 1;
%>
<jsp:include page="top.jsp"/>
<jsp:include page="header.jsp"/>
<!-- 반응형 본문 시작 -->
<div class="container" style="margin-top:30px">
	<div class="row">
	<jsp:include page="LeftMenu.jsp">
		<jsp:param name="menu" value="<%= menu %>"/>
		</jsp:include>
	<% String MainView_page = "MainView" + menu +".jsp"; %>
	<jsp:include page="<%= MainView_page %>"/>
  </div>
</div>
<!-- 반응형 본문 끝 -->
<jsp:include page="footer.jsp" />
<jsp:include page="bottom.jsp" />