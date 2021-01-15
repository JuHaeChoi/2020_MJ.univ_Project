<%@page import="model.bean.RoomBoardBean"%>
<%@page import="java.util.Vector"%>
<%@page import="model.dao.RoomBoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		
<head>
		
			  <meta charset="utf-8">
			  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
			  <meta name="description" content="">
			  <meta name="author" content="">
			
			  <title>띵동산_원룸</title>
			
			  <!-- Bootstrap core CSS -->
			  <link href="${pageContext.request.contextPath}/sources_SHOP/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
			
			  <!-- Custom styles for this template -->
			  <link href="${pageContext.request.contextPath}/sources_SHOP/css/shop-homepage.css" rel="stylesheet">
			  <link href="${pageContext.request.contextPath}/sources_SHOP/common/bootstrap.jsp" rel="stylesheet">
			  
			  
			  <style type="text/css">
			  	footer{
			  		
			  		bottom: 0;
			  		width: 100%;
			  		height:1%;
			  	}
			  	thead{
			  		text-align: center;
			  		font-weight: bold;
			  	}
			  
				main{
					margin-bottom: 10rem;
				}
				
			</style>
</head>
		
<body>
	<%
		//로그아웃
		String logout = request.getParameter("logout");
		if(logout != null){
			//id에 null 값 부여 및 세션 유지시간 종료
			session.setAttribute("id", null);
			session.setMaxInactiveInterval(0);
		}
		
		
		//세션
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			id="비회원";
		}
		
		if(id.equals("비회원")){
	%>
		<script>
			alert("로그인 후 열람할 수 있습니다.")
			history.go(-1);
		</script>
	<%
		}
	%>
		  <!-- Navigation -->
		  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		    <div class="container">
		      <a class="navbar-brand" href="${pageContext.request.contextPath}/page/MainHome.jsp"><img src="${pageContext.request.contextPath}/img/logo2.png" height="30" width=110></a>
		      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
		        <span class="navbar-toggler-icon"></span>
		      </button>
		      <div class="collapse navbar-collapse" id="navbarResponsive">
		        <ul class="navbar-nav ml-auto">
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/page/AboutTeam.jsp">팀소개</a>
		          </li>
		          
		          <li class="nav-item">
		            <a class="nav-link" href="${pageContext.request.contextPath}/page/AboutTingDongSan.jsp">띵동산 소개</a>
		          </li>
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		              매물정보
		            </a>
		            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
		              <a class="dropdown-item" href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=원룸">원룸</a>
		              <a class="dropdown-item" href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=투룸이상">투룸 이상</a>
		              <a class="dropdown-item" href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=쉐어하우스">쉐어하우스</a>
		              <a class="dropdown-item" href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=하숙 및 기타">하숙 및 기타</a>
		            </div>
		          </li>
		          
		          <li class="nav-item dropdown">
		            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownPages" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		              회원정보
		            </a>
		            
		            <%
		            		            	if(id.equals("비회원")){
		            		            %>
		            		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
				            <a class="dropdown-item"><%=id%> 고객님 반갑습니다</a>
				            <a class="dropdown-item" href="${pageContext.request.contextPath}/page/login/login.jsp">로그인</a>
				            <a class="dropdown-item" href="${pageContext.request.contextPath}/page/login/SignUp.jsp">회원가입</a>
				            </div>
		           <%
		           	}else{
		           %>
		            		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
				              <a class="dropdown-item"><%=id%> 고객님 반갑습니다</a>
				              <a class="dropdown-item" href="${pageContext.request.contextPath}/page/MemberInfo.jsp">내 정보</a>
				              <a class="dropdown-item" href="${pageContext.request.contextPath}/page/MyReservation.jsp">예약 정보</a>
				              <a class="dropdown-item" href="${pageContext.request.contextPath}/page/MainHome.jsp?logout=1">로그아웃</a>
				            </div>
		            <%
		            	}
		            %>
		              
		          </li>
		        </ul>
		      </div>
		    </div>
		  </nav>
		  
	<main>	  
		  <!-- Page Content -->
		  <div class="container">
		
		    <div class="row">
		
		      <div class="col-lg-3">
		
		        <h3 class="my-4"></h3>
		        <div class="list-group">
		          <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=원룸" class="list-group-item">원룸</a>
		          <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=투룸이상" class="list-group-item">투룸 이상</a>
		          <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=쉐어하우스" class="list-group-item">쉐어하우스</a>
		          <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=하숙 및 기타" class="list-group-item">하숙 및 기타</a>
		        </div>
		      </div>
		    
		     
		      <!-- /.col-lg-4 -->
		<%
			int num = Integer.parseInt(request.getParameter("num").trim());//공백 제거후 정수형으로 바뀜
			//데이터 베이스 접근
			RoomBoardDAO bdao = new RoomBoardDAO();
				
			//boardbean타입으로 하나의 게시글을 리턴
			RoomBoardBean bean = bdao.getOneBoard(num);
				
		%>	     
		
			 <div class="col-lg-9">
			 	
			 	<!-- Page Content -->
					  <div class="container">
					
					    <!-- Page Heading/Breadcrumbs -->
					    <h1 class="mt-4 mb-3">매물정보</h1>
					
					    <ol class="breadcrumb">
					 		<h6><%=bean.getSales_title() %></h6>
					    </ol>
					
					    <!-- Portfolio Item Row -->
					    <div class="row">
					
					      <div class="col-md-8">
					        <img class="img-fluid" src="http://placehold.it/750x500" alt="">
					      </div>
					
					      <div class="col-md-4">
					       
					        <p><%=bean.getSales_info() %></p>
					        <p>주소 : <%=bean.getSales_address() %></p>
					        <h5 class="my-3">매물 정보</h5>
					        <ul>
					          <li>보증금 : <%=bean.getSales_deposit() %></li>
					          <li>월  세 : <%=bean.getSales_monthly_rent_cost() %></li>
					          <li>관리비 : <%=bean.getSales_maintenance_cost() %></li>
					          <li>평  수 : <%=bean.getSales_space() %></li>
					          <li>층  수 : <%=bean.getSales_floor() %></li>
					        </ul>
					        <h5 class="my-3">게시자 정보</h5>
					        <ul>
					          <li>아이디 : <%=bean.getMember_id() %></li>
					          <li>연락처 : <%=bean.getMember_phonenum() %></li>
					        </ul>
					      </div>
					
					    </div>
					    <!-- /.row -->
					
					    <!-- Related Projects Row -->
					    <h3 class="my-4">매물 사진</h3>
					
					    <table class="table table-hover" >
					<tr height = "40">
						<td>
							<input type="date">
						</td>
						<td align ="center" colspan = "4">
							<input type="button" value="예약금 결제하기" onclick="location.href='./RoomBoardUpdateForm.jsp?num=<%=bean.getSales_num()%>'">
						</td>
					</tr>
				</table> 
					
					    </div>
					    <!-- /.row -->
				
					  </div>
			 	
			 <div class="col-lg-9">
			 <br><br>
				  
   		    </div>
		  <!-- /.container -->
			</div>
			</div>
			</div>
	</main>
		  <!-- Footer -->
		  <footer class="py-5 bg-dark">
		    <div class="container">
		      <p class="m-0 text-center text-white">Copyright &copy; TingDongSan 2020</p>
		    </div>
		    <!-- /.container -->
		  </footer>
		
		  <!-- Bootstrap core JavaScript -->
		  <script src="${pageContext.request.contextPath}/sources_SHOP/vendor/jquery/jquery.min.js"></script>
		  <script src="${pageContext.request.contextPath}/sources_SHOP/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		
</body>
</html>