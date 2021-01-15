<%@page import="model.dao.RoomBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<%
		String id = (String)session.getAttribute("id");
		request.setCharacterEncoding("utf-8");
	%>
	
	<!-- bean 사용 -->
	<jsp:useBean id="bean" class="model.bean.ReservationBean">
		<jsp:setProperty name="bean" property="*"/>
	</jsp:useBean>
	
	<%
	//DB로 빈 클래스 전송
	RoomBoardDAO bdao = new RoomBoardDAO();
	
	//메소드 호출
	bdao.reservationInfo(bean);
	
	/*
	$("#merchant_uid").val(rsp.merchant_uid);
	$("#sales_num").val($("#get_ales_num").val());
	$("#member_id").val($("#buyer-id").text());
	$("#member_reservation_num").val(rsp.amount);
	$("#reservation_title").val(rsp.name);
	$("#reservation_date").val(rsp.paid_at);
	*/
	
	//호출 후 예약 정보 게시판으로 이동
	response.sendRedirect("./MyReservation.jsp");
	%>
</body>
</html>