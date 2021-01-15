<%@page import="model.dao.RoomBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

	<%
		int num = Integer.parseInt(request.getParameter("sales_num"));	
		RoomBoardDAO bdao = new RoomBoardDAO();
		
		bdao.deleteRoomBoard(num);
		
		response.sendRedirect("../MainHome.jsp");
	%>
</body>
</html>