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

	<!-- Page Content -->
	<div class="container">
		<main> <!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			<small>띵동산 소개</small>
		</h1>

		<ol class="breadcrumb">

		</ol>

		<!-- Content Row -->
		<div class="row">
			<!-- Map Column -->
			<div class="col-lg-8 mb-4">

				<div id="map" style="width: 750px; height: 450px;"></div>

				<script
					src="카카오 개인코드"></script>
				<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
					mapOption = {
						center : new kakao.maps.LatLng(37.579641, 126.923950), // 지도의 중심좌표
						level : 3, // 지도의 확대 레벨
						mapTypeId : kakao.maps.MapTypeId.ROADMAP
					// 지도종류
					};

					// 지도를 생성한다 
					var map = new kakao.maps.Map(mapContainer, mapOption);

					// 마케 생성 및 표시
					var marker = new kakao.maps.Marker(
							{
								position : new kakao.maps.LatLng(37.579641,
										126.923950),
								map : map
							});
				</script>

			</div>


			<!-- Contact Details Column -->
			<div class="col-lg-4 mb-4">
				<h3>띵동산</h3>
				<p>
					명지대학교 학생들을 위한 부동산 서비스를 제공합니다.<br> <br>서울특별시 서대문구 거북골로
					34(명지대학교) <br>경영대학, 경영정보학과 <br>
				</p>
				<p>
					<abbr title="Phone">P</abbr>: (+82)10-0000-0000
				</p>
				<p>
					<abbr title="Email">E</abbr>: Manager@TingDongSan.com
				</p>
				<p>
					<abbr title="Hours">H</abbr>: 월 - 금 : 오전 9:00 ~ 오후 5:00
				</p>
			</div>
		</div>
		<!-- /.row --> </main>
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

	<!-- Contact form JavaScript -->
	<!-- Do not edit these files! In order to set the email address and subject line for the contact form go to the bin/contact_me.php file. -->
	<script
		src="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/js/jqBootstrapValidation.js"></script>
	<script
		src="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/js/contact_me.js"></script>

</body>

</html>