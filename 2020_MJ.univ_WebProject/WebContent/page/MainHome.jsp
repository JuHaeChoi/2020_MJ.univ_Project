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

<style type="text/css">
.map-info {
	font-size: 0.8rem;
	width: 8rem;
}
</style>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/css/modern-business.css"
	rel="stylesheet">

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

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('${pageContext.request.contextPath}/img/mju.jpg'); background-size:100%;">
					<div class="carousel-caption d-none d-md-block">
						<h1>띵동산 홈페이지 개설</h1>
						<p>명지대학교 주변 자취방을 쉽게 검색해보세요.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('${pageContext.request.contextPath}/img/hand.JPG'); background-size:100%;">
					<div class="carousel-caption d-none d-md-block">
						<h1>부동산 거래시 주의사항</h1>
						<p>주의사항을 살펴보고 소중한 재산을 지키세요.</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('${pageContext.request.contextPath}/img/checklist.jpg'); background-size:100%;">
					<div class="carousel-caption d-none d-md-block">
						<h1>자취방 체크리스트</h1>
						<p>체크리스트를 확인하면 계약전 하자를 쉽게 찾아낼 수 있습니다.</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4">명지대학교 주변 부동산 한눈에 살펴보기</h1>


		<div id="map" style="width: 100%; height: 600px;"></div>

		<script type="text/javascript" src="카카오 개인코드"></script>
		<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new kakao.maps.LatLng(37.579641, 126.923950), // 지도의 중심좌표
				level : 5
			// 지도의 확대 레벨
			};

			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 마커 클러스터러를 생성합니다 
			var clusterer = new kakao.maps.MarkerClusterer({
				map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				minLevel : 4
			// 클러스터 할 최소 지도 레벨 
			});

			var data = [
					[
							37.578354,
							126.925075,
							'<div class="map-info" style="padding: 4px"><a href="http://localhost:8181/2020_obj_project/page/board/RoomBoardDetailed.jsp?num=142">서울특별시 서대문구남가좌2동 325-38</a></div>' ],
					[ 37.578648, 126.924612,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 남가좌2동 325-20</div>' ],
					[ 37.579109, 126.926137,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 410-28</div>' ],
					[ 37.580080, 126.925759,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 409-24</div>' ],
					[ 37.581312, 126.923989,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 남가좌2동 명지대1길</div>' ],
					[ 37.581527, 126.923300,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 남가좌2동 5-245</div>' ],
					[ 37.580815, 126.921624,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 명지대1나길</div>' ],
					[ 37.582224, 126.926694,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 379-2</div>' ],
					[ 37.577900, 126.923721,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 남가좌2동 341-33</div>' ],
					[ 37.578387, 126.926763,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 412-26</div>' ],
					[ 37.582764, 126.926200,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 365-2</div>' ],
					[ 37.583283, 126.923157,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 남가좌동 3-77번지</div>' ],
					[ 37.583246, 126.921772,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 남가좌2동 5-31</div>' ],
					[ 37.578737, 126.928660,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 294-51</div>' ],
					[ 37.578503, 126.929550,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 404-7</div>' ],
					[ 37.578341, 126.928332,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 294-9</div>' ],
					[ 37.578179, 126.927798,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 홍은2동 414-28</div>' ],
					[ 37.578795, 126.924266,
							'<div class="map-info" style="padding: 4px">서울특별시 서대문구 남가좌2동 325-15</div>' ] ];

			var markers = [];

			for (var i = 0; i < data.length; i++) {

				// 마커가 표시될 위치입니다 
				var markerPosition = new kakao.maps.LatLng(data[i][0],
						data[i][1]);

				// 마커를 생성합니다
				var marker = new kakao.maps.Marker({
					position : markerPosition
				});

				// 마커가 지도 위에 표시되도록 설정합니다
				marker.setMap(map);

				var iwContent = data[i][2], iwPosition = new kakao.maps.LatLng(
						37.579641, 126.923950);

				// 인포윈도우를 생성합니다
				var infowindow = new kakao.maps.InfoWindow({
					position : iwPosition,
					content : data[i][2]
				});

				markers.push(marker);

				kakao.maps.event.addListener(marker, 'mouseover',
						makeOverListener(map, marker, infowindow));
				kakao.maps.event.addListener(marker, 'click',
						makeOutListener(infowindow));
			}
			// 클러스터러에 마커들을 추가합니다
			clusterer.addMarkers(markers);

			// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(infowindow) {
				return function() {
					infowindow.close();
				};
			}

			// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, infowindow) {
				return function() {
					infowindow.open(map, marker);
				};
			}
		</script>

		<!-- Board Section -->
		<h2>
			<br>게시판 바로가기
		</h2>

		<div class="row">
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a
						href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=원룸"><img
						class="card-img-top"
						src="${pageContext.request.contextPath}/img/oneroom.JPG"
						height="200" width="300" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=원룸">원룸(One-room)</a>
						</h4>
						<p class="card-text">대학교에서 1인 자취하는 학생들이 가장 많이 선택하는 구조로 평균
							7~10평 이내의 방입니다.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a
						href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=투룸이상"><img
						class="card-img-top"
						src="${pageContext.request.contextPath}/img/tworoom.JPG"
						height="200" width="300" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=투룸이상">투룸
								이상(Two-room)</a>
						</h4>
						<p class="card-text">2인 이상이 함께 자취하는 투룸, 2개 이상 방을 가지고 있습니다.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a
						href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=쉐어하우스"><img
						class="card-img-top"
						src="${pageContext.request.contextPath}/img/sharehouse.jpeg"
						height="200" width="300" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=쉐어하우스">쉐어하우스(Share-House)</a>
						</h4>
						<p class="card-text">여러명이 함께 건물/층을 사용합니다.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<a
						href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=하숙 및 기타"><img
						class="card-img-top"
						src="${pageContext.request.contextPath}/img/boardinghouse.JPG"
						height="200" width="300" alt=""></a>
					<div class="card-body">
						<h4 class="card-title">
							<a
								href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=하숙 및 기타">하숙(Boarding-House)</a>
						</h4>
						<p class="card-text">인근 가정집 구성원들과 함께 거주하는 매물을 살펴보세요.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<span onclick="alert('준비중입니다.')"><img class="card-img-top"
						src="${pageContext.request.contextPath}/img/report.jpg"
						height="200" width="300" alt=""></span>
					<div class="card-body">
						<h4 class="card-title">
							<span onclick="alert('준비중입니다.')">신고게시판</span>
						</h4>
						<p class="card-text">불법증축물, 미등록건축물, 허위매물, 악성유저를 신고하세요.</p>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-sm-6 portfolio-item">
				<div class="card h-100">
					<span onclick="alert('준비중입니다.')"><img class="card-img-top"
						src="${pageContext.request.contextPath}/img/notice.JPG"
						height="200" width="300" alt=""></span>
					<div class="card-body">
						<h4 class="card-title">
							<span onclick="alert('준비중입니다.')">공지사항</span>
						</h4>
						<p class="card-text">이용 규칙 및 공지사항을 살펴보세요.</p>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6">
				<h2>TingDongSan</h2>
				<p>Real estate website for Myong-ji University students</p>
				<ul>
					<li>Java, Jsp</li>
					<li>Html, Css, JavaScript</li>
					<li>jQuery</li>
					<li>KaKao API</li>
					<li>Bootstrap v4</li>
					<li>CkEditor</li>
					<li>Json</li>
				</ul>
				<p>2020 2nd semester, Myongji University Department of Business
					Information, Object Oriented Language Final Team Project, Myungjin
					Lee, Juhae Choi, Eunjoo Lee Participated</p>
			</div>
			<div class="col-lg-6">
				<img class="img-fluid rounded"
					src="${pageContext.request.contextPath}/img/logo1.png" height="700"
					width="450" alt="">
			</div>
		</div>
		<!-- /.row -->

		<hr>

		<!-- Call to Action Section -->
		<div class="row mb-4"></div>

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Your
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