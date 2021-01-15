<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
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
	bottom: 0;
	width: 100%;
	height: 1%;
	position: absolute;
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

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">Team</h1>

		<ol class="breadcrumb">
		</ol>

		<!-- Intro Content -->
		<div class="row">
			<div class="col-lg-6">
				<img class="img-fluid rounded mb-4"
					src="${pageContext.request.contextPath}/img/logo1.png" height="750"
					width="450" alt="">
			</div>
			<div class="col-lg-6">
				<h2>홈페이지만들조</h2>
				<p>'홈페이지만들조'는 명지대학교 경영정보학과의 2020년 2학기 객체지향언어 기말 프로젝트를 위해 구성된
					팀입니다. 명지대 학생들을 대상으로 부동산 정보(원룸, 투룸, 하숙, 쉐어하우스 등)를 제공하는 서비스를 준비했습니다.</p>


			</div>
		</div>
		<!-- /.row -->

		<!-- Team Members -->
		<h2>Team Member</h2>

		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100 text-center">
					<img class="card-img-top"
						src="${pageContext.request.contextPath}/img/mj.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">이명진</h4>
						<h6 class="card-subtitle mb-2 text-muted">팀원</h6>
						<p class="card-text">명지대학교 경영정보학과 이명진 입니다.</p>
					</div>
					<div class="card-footer">경영정보학과</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100 text-center">
					<img class="card-img-top"
						src="${pageContext.request.contextPath}/img/jh.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">최주해</h4>
						<h6 class="card-subtitle mb-2 text-muted">팀장</h6>
						<p class="card-text">명지대학교 경영정보학과 최주해 입니다.</p>
					</div>
					<div class="card-footer">경영정보학과</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100 text-center">
					<img class="card-img-top"
						src="${pageContext.request.contextPath}/img/enju.jpg" alt="">
					<div class="card-body">
						<h4 class="card-title">이은주</h4>
						<h6 class="card-subtitle mb-2 text-muted">팀원</h6>
						<p class="card-text">명지대학교 경영정보학과 이은주 입니다.</p>
					</div>
					<div class="card-footer">경영정보학과</div>
				</div>
			</div>
		</div>


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

</body>
</html>