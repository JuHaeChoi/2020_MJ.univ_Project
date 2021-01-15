<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="model.dao.RoomBoardDAO"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>

<%
	request.setCharacterEncoding("utf-8");
	
	//세션
	String id = (String)session.getAttribute("id");	
	
	//첨부파일을 저장할 폴더
	String realfolder="";
	//실제 폴더명, 경로
	String savefolder="/Users/SAMSUNG/eclipse-workspace/2020_obj_project/WebContent/page/board/upload";
	//한글 설정
	String encType="utf-8";
	//저장될 파일 사이즈
	int maxSize = 1024*1024*10; //10m
	//파일 저장 경로값 객체 선언
	//ServletContext context = getServletContext();
	realfolder = savefolder;//context.getRealPath(savefolder);
	
	try{
		//클라이언트로 부터 받은 데이터를 저장하는 객체
		MultipartRequest multi = new MultipartRequest(request, realfolder, maxSize, encType, new DefaultFileRenamePolicy()); //자동으로 파일 이름 변경
		Enumeration file = multi.getFileNames();
		String tmpFile = "";
		if(file.hasMoreElements()){
			tmpFile = (String)file.nextElement();
			System.out.println(tmpFile);
		}
		
		
		String id_w = multi.getParameter("member_id");
		String tel_w = multi.getParameter("member_phonenum");
		String rv_w = multi.getParameter("sales_reservation_num");
		String type_w = multi.getParameter("sales_type");
		String montcost_w = multi.getParameter("sales_monthly_rent_cost");
		String dep_w = multi.getParameter("sales_deposit");
		String mac_w = multi.getParameter("sales_maintenance_cost");
		String op_w = multi.getParameter("sales_option");
		String sp_w = multi.getParameter("sales_space");
		String ad_w = multi.getParameter("sales_address");
		String fl_w = multi.getParameter("sales_floor");
		String img_w = (String)multi.getFilesystemName(tmpFile); //multi.getParameter("save_img");
		String info_w = multi.getParameter("sales_info");
		String title_w = multi.getParameter("sales_title");
		
		System.out.println(realfolder);
		
		//데이터베이스 쪽으로 넘겨줌
		RoomBoardDAO bdao = new RoomBoardDAO();

		//데이터 저장 메소드를 호출
		bdao.insertBoard_w(id_w, tel_w, rv_w, type_w, montcost_w, dep_w, mac_w, op_w, sp_w, ad_w, fl_w, img_w, info_w, title_w);
		
		//게시물 저장 후  전체 게시글 보기
		response.sendRedirect("../MainHome.jsp");
			
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	/*
		<jsp:useBean id="bean" class="model.bean.RoomBoardBean">
			<jsp:setProperty name="bean" property="*"/>
		</jsp:useBean>
	
	*/
	
%>

</body>
</html>