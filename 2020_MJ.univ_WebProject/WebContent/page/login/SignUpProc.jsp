<%@page import="model.dao.SignUpDAO"%>
<%@page import="model.bean.MemberBean" %>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

	<%
		request.setCharacterEncoding("utf-8");
	%>

	<!-- useBean 이용, 한번에 data를 받아오기 -->
	<jsp:useBean id="mbean" class="model.bean.MemberBean">
		<jsp:setProperty name="mbean" property="*"/> <!-- 맵핑작업 시행 -->
	</jsp:useBean>
	
	<%
		//DB 클래스 객체 생성
		SignUpDAO mdao = new SignUpDAO();
		mdao.insertMember(mbean);
		
		response.sendRedirect("./login.jsp");
	%>
	
</body>
</html>