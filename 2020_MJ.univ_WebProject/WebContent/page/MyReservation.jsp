<%@page import="java.util.Vector"%>
<%@page import="model.dao.RoomBoardDAO"%>
<%@page import="model.bean.ReservationBean"%>
<%@page import="model.bean.MemberBean"%>
<%@page import="model.dao.SignUpDAO"%>
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
		int pageSize = 10; //화면 게시글 개수 지정
		String pageNum = request.getParameter("pageNum"); //카운터 번호값 호출
		if (pageNum == null) {
			pageNum = "1";
		}
		int count = 0; //전체 글 개수 저장하는 변수
		int number = 0; //페이지 넘버링 변수

		int currentPage = Integer.parseInt(pageNum);

		RoomBoardDAO bdao = new RoomBoardDAO();
		count = bdao.getRevAllCount();

		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;

		Vector<ReservationBean> vec = bdao.getRevAllBoard(startRow, endRow, id);

		number = count - (currentPage - 1) * pageSize;
	%>

	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3"><%=id%>
			회원님 <small>예약내역</small>
		</h1>

		<ol class="breadcrumb"></ol>

		<table class="table table-hover">
			<thead>
				<tr>
					<td>예약번호</td>
					<td>예약매물</td>
					<td>예약금</td>
					<td>방문일</td>
				</tr>
			</thead>
			<%
				for (int i = 0; i < vec.size(); i++) {
					ReservationBean bean = vec.get(i);
			%>
			<tbody>
				<tr>
					<td align="left" width="150"><%=bean.getMerchant_uid()%></td>
					<td align="left" width="300"><a
						href="./board/RoomBoardDetailed.jsp?num=<%=bean.getSales_num()%>"><%=bean.getReservation_title()%></a></td>
					<td align="left" width="100"><%=bean.getMember_reservation_num()%></td>
					<td align="left" width="100"><%=bean.getReservation_date()%>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>

	<p>
	<center>
		<!-- 페이지 카운터링 소스 -->
		<%
			if (count > 0) {
				int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1); //카운터링 숫자 어디까지 보여줄 건지 결정

				//시작페이지 설정
				int startPage = 1;

				if (currentPage % 10 != 0) {
					startPage = (int) (currentPage / 10) * 10 + 1;
				} else {
					startPage = ((int) (currentPage / 10) - 1) * 10 + 1;
				}

				int pageBlock = 10; //카운터링 처리 숫자
				int endPage = startPage + pageBlock - 1;//화면에 보여질 페이지의 마지막 숫자

				if (endPage > pageCount)
					endPage = pageCount;

				//이전 링크 만들건지 파악
				if (startPage > 10) {
		%>
		<a href="./MyReservation.jsp?=pageNum=<%=startPage - 10%>"> [이전] </a>
		<%
			}
				//페이징 처리
				for (int i = startPage; i <= endPage; i++) {
		%>
		<a href="./MyReservation.jsp?=pageNum=<%=i%>"> [<%=i%>]
		</a>
		<%
			}
				//다음이라는 링크를 만들건지 파악
				if (endPage < pageCount) {
		%>
		<a href="./MyReservation.jsp?=pageNum=<%=startPage + 10%>"> [다음] </a>
		<%
			}
			}
		%>
	</center>
	</p>


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