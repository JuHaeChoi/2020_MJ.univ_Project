<%@page import="model.dao.LoginDAO"%>
<%@page import="model.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		request.setCharacterEncoding("UTF-8");	
	%>
		<jsp:useBean id="mbean" class="model.bean.MemberBean">
			<jsp:setProperty name="mbean" property = "*" />
		</jsp:useBean>


	<% 
		LoginDAO mbao = new LoginDAO();
		
		String pass = request.getParameter("pw");
		String pass1 = mbao.getPass(mbean.getId());
		//스트링 타입으로 저장 되어 있는 패스워드를 가져옴(데이터 베이스에서 가져온 pass 값이 저장) 

		System.out.println(mbean.getId());
		System.out.println(pass); 
		System.out.println(pass1);
		
		if(pass.equals(pass1)){
			mbao.deleteMember(mbean.getId());
			//세션 종료
			session.setAttribute("id", null);
			session.setMaxInactiveInterval(0);
	%>	
		<script type="text/javascript">
		alert("탈퇴되었습니다.")
		location.href="${pageContext.request.contextPath}/page/MainHome.jsp"
		</script>	
	<% 	}else{	%>
		<script type="text/javascript">
		alert("비밀번호가 맞지 않습니다. 다시 확인해주세요.")
		history.go(-1);
		</script>	
	<%	}	 %>


</body>
</html>