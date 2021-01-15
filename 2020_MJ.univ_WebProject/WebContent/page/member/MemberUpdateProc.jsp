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
		//String id = (String)session.getAttribute("id");
		LoginDAO mdao = new LoginDAO();
		//	String pass = mdao.getPass(id);

		mdao.updateMember(mbean, mbean.getId());
		
		System.out.println(mbean.getId());

	%>	
		<script type="text/javascript">
		alert("회원 정보 수정 되었습니다.")
		history.go(-1);
		</script>
		
</body>
</html>