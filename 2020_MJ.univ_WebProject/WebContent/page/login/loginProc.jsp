<%@page import="model.dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	
	<%
		request.setCharacterEncoding("utf-8");
		
		//아이디 저장 체크 여부 판단
		String save = request.getParameter("save");
		
		//사용자 정보
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		//회원아이디와 패스워드가 DB값과 일치하는지 확인
		LoginDAO ldao = new LoginDAO();
		int result = ldao.getMember(id, pw);
		out.print(result);
		if(result == 0){
	%>
			<script>
				alert("아이디 또는 비밀번호가 일치하지 않습니다.")
				location.href="./login.jsp"
			</script>
	<%		
		} else {
		
			//세션 사용
			session.setAttribute("id", id);
			session.setAttribute("pw", pw);
			
			//세션 유지시간
			session.setMaxInactiveInterval(60*30); //30분 유지		
			
		
			if(save != null){
				//쿠키 사용을 위해 쿠키 클래스 생성
				Cookie cookie = new Cookie("id",id); 	//(Key, Value) 
				
				//쿠키 유효시간
				cookie.setMaxAge(60*10); //10분간 유효
				
				//사용자에게 쿠키 값 전달
				response.addCookie(cookie);
				
			}
			
			response.sendRedirect("../MainHome.jsp");
			
		}
	%>
	
</body>
</html>