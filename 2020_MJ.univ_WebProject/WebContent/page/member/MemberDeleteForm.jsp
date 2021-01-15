<%@page import="model.dao.LoginDAO"%>
<%@page import="model.bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>띵동산_명지대 부동산</title>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/css/modern-business.css"
	rel="stylesheet">

<style type="text/css">
footer {
	width: 100%;
	bottom: 0;
	position: absolute;
	height: 1%;
}

main {
	margin-bottom: 10rem;
}
</style>
</head>
<body>
	<%
		//로그아웃
		String logout = request.getParameter("logout");
		if (logout != null) {
			//id에 null 값 부여 및 세션 유지시간 종료
			session.setAttribute("id", null);
			session.setMaxInactiveInterval(0);
		}

		//세션
		String id = (String) session.getAttribute("id");

		if (id == null) {
			id = "비회원";
		}
	%>
	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand"
				href="${pageContext.request.contextPath}/page/MainHome.jsp"><img
				src="${pageContext.request.contextPath}/img/logo2.png" height="30"
				width=110></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/page/AboutTeam.jsp">팀소개</a>
					</li>

					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/page/AboutTingDongSan.jsp">띵동산
							소개</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownPortfolio" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> 매물정보 </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPortfolio">
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=원룸">원룸</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=투룸이상">투룸
								이상</a> <a class="dropdown-item"
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=쉐어하우스">쉐어하우스</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=하숙 및 기타">하숙
								및 기타</a>

						</div></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							회원정보 </a> <%
 	if (id.equals("비회원")) {
 %>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item"><%=id%> 고객님 반갑습니다</a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath}/page/login/login.jsp">로그인</a>
							<a class="dropdown-item"
								href="${pageContext.request.contextPath}/page/login/SignUp.jsp">회원가입</a>
						</div> <%
 	} else {
 %>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownPages">
							<a class="dropdown-item"><%=id%> 고객님 반갑습니다</a> <a
								class="dropdown-item"
								href="${pageContext.request.contextPath}/page/MemberInfo.jsp">내
								정보</a> <a class="dropdown-item"
								href="${pageContext.request.contextPath}/page/MyReservation.jsp">예약
								정보</a> <a class="dropdown-item"
								href="${pageContext.request.contextPath}/page/MainHome.jsp?logout=1">로그아웃</a>
						</div> <%
 	}
 %></li>
				</ul>
			</div>
		</div>
	</nav>


	<%
		String member_id = (String) session.getAttribute("id");

		//데이터 베이스 접근
		LoginDAO bdao = new LoginDAO();

		//하나의 멤버 리턴
		MemberBean bean = bdao.getOneMember(member_id);
	%>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3"><%=bean.getName()%>
			회원 <small> 탈퇴 하기</small>
		</h1>

		<ol class="breadcrumb">
		</ol>


		<table class="table table-hover">
			<form action="MemberDeleteProc.jsp" metod="post">
				<thead>
					<tr>
						<td>ID</td>
						<td><%=bean.getId()%></td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>PW</td>
						<td><input type="password" name="pw"></td>
					</tr>
				</tbody>
				<tr>
					<td align="center" colspan="4"><br> <input type="hidden"
						name="id" value="<%=bean.getId()%>"> <input type="submit"
						value="회원 탈퇴 하기" onclick='member/MemberDeleteProc.jsp'>
			</form>
			<button onclick="history.go(-1)">취소</button>
			</td>
			</tr>

		</table>

	</div>

	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;
				TingDongSan 2020</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>


</body>
</html>
