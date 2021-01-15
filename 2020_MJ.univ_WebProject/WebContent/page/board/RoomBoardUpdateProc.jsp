<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.*"%>
<%@page import="model.bean.RoomBoardBean"%>
<%@page import="model.dao.RoomBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
	
		//세션
		String id = (String)session.getAttribute("id");
	
		/*<!-- 사용자 데이터를 읽는 bean 클래스 설정 -->
		<jsp:useBean id="bean" class="model.bean.RoomBoardBean">
			<jsp:setProperty name="bean" property="*" />
		</jsp:useBean>
		*/
		
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
			
			int sales_num = Integer.parseInt(multi.getParameter("sales_num"));
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
			
			//DB에 연결
			RoomBoardDAO bdao = new RoomBoardDAO();
			
			bdao.getUpdateRoomBoard_w(montcost_w, dep_w, mac_w, op_w, sp_w, ad_w, fl_w, img_w, info_w, title_w, sales_num);
			
			response.sendRedirect("../MainHome.jsp");
			}catch(Exception e){
				e.printStackTrace();
			}
	%>
			
</body>
</html>