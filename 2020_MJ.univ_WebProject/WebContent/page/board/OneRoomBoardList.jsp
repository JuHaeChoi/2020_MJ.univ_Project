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
			
			  <title>띵동산</title>
			
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
		
		String type = request.getParameter("type");

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
		  
		  
		  <!-- Page Content -->
		  <div class="container">
		
		    <div class="row">
		
		      <div class="col-lg-3">
		
		        <h1 class="my-4"><%=type%></h1>
		        <div class="list-group">
		          <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=원룸" class="list-group-item">원룸</a>
		          <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=투룸이상" class="list-group-item">투룸 이상</a>
		          <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=쉐어하우스" class="list-group-item">쉐어하우스</a>
        		  <a href="${pageContext.request.contextPath}/page/board/OneRoomBoardList.jsp?type=하숙 및 기타" class="list-group-item">하숙 및 기타</a>
		        </div>
		      </div>
		    
		     
		      <!-- /.col-lg-3 -->
		
		      <div class="col-lg-9">
		
		        <div id="carouselExampleIndicators" class="carousel slide my-4" data-ride="carousel">
		          <ol class="carousel-indicators">
		            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		          </ol>
		          <div class="carousel-inner" role="listbox">
		            <div class="carousel-item active">
		              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/listimg2 (1).jpg" alt="First slide">
		            </div>
		            <div class="carousel-item">
		              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/listimg2 (2).jpg" alt="Second slide">
		            </div>
		            <div class="carousel-item">
		              <img class="d-block img-fluid" src="${pageContext.request.contextPath}/img/listimg2 (3).jpg" alt="Third slide">
		            </div>
		          </div>
		          <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		            <span class="sr-only">Previous</span>
		          </a>
		          <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		            <span class="carousel-control-next-icon" aria-hidden="true"></span>
		            <span class="sr-only">Next</span>
		          </a>
		        </div>
		<main> 	
		
		<%
 				//화면에 보여질 게시글의 개수를 지정
 				 int pageSize=10;
 				//현재 카운터를 클릭한 번호값을 읽어옴
 				String pageNum = request.getParameter("pageNum");
 				//만약 처음 list를 클릭하거나 수정 삭제 등 다른 게시글에서 이페이지로 넘어오며 pageNum 값이 없기에 null 처리
 				if(pageNum==null){
 					pageNum = "1";
 				}
 				int count = 0; //전체 글의 갯수를 저장하는 변수
 				int number = 0; //페이지 넘버링 변수
 					 							
 				//현재 보고자 하는 페이지 숫자를 저장
 				int currentPage = Integer.parseInt(pageNum);
 					 							
 				//전체 게시글의 내용을 jsp로 가져와야 한다.
 				RoomBoardDAO bdao = new RoomBoardDAO();
 					 							
 				//전체게시글의 갯수를 읽어드린 메소드 호출
 				count = bdao.getAllCount(type);
 					 							
 				//현재 페이지에 보여줄 시작 번호를 설정 = 데이터 베이스에서 불러올 시작번호
 				int startRow = (currentPage-1)*pageSize+1;
 				int endRow = currentPage*pageSize;
 
 				//최신글 10기준으로 전체 게시글을 리턴 받아주는 소스 (one)
 				Vector<RoomBoardBean> vec = bdao.getAllBoard(startRow, endRow, type);
 				//테이블에 표시할 번호를 지정
 				number = count - (currentPage -1) * pageSize;
 		%>
 		
		        <div class="row">
		
					<table class="table table-hover" >
						<thead>
							<tr>
								<td align="left" width="80">글번호</td>
								<td align="left" width="550">제목</td>
								<td align="center" width="100">작성자</td>
								<td align="center" width="120">작성일</td>
								<td align="center" width="100">조회수</td>
							</tr>
						</thead>
						<%
						for(int i = 0; i<vec.size(); i++){
							RoomBoardBean bean = vec.get(i);
						%>
						<tbody>
							<tr>
								<td align="left" width="80"><%=bean.getSales_num()%></td>
								<td align="left" width="550"><a href="./RoomBoardDetailed.jsp?num=<%=bean.getSales_num()%>"> <%=bean.getSales_title() %></a></td>
								<td align="center" width="100"><%=bean.getMember_id() %></td>
								<td align="center" width="120"><%=bean.getSales_regdate()%></td>
								<td align="center" width="100"><%=bean.getSales_readcount()%></td>
							</tr>
						<% } %>
						</tbody>
						
					<tr height = "40">
						<td align="right"  colspan="5">
					<%
						if(id.equals("비회원")){
					%>
						로그인 후 게시글을 작성할 수 있습니다.
					<%
						}else{
					%>
						<input type="button" value="글쓰기" onclick="location.href='./RoomBoardWriteForm.jsp'"/>
						</td>
					<% 
						}
					%>
					</tr>
						
					</table>
			
				</div>
		        <!-- /.row -->		
					
				<p>
					<center> 
					<!-- 페이지 카운터링 소스 -->
					<%
						if(count > 0){
							int pageCount = count / pageSize + (count%pageSize == 0 ? 0 : 1); //카운터링 숫자 어디까지 보여줄 건지 결정
							
							//시작페이지 설정
							int startPage = 1;
							
							if(currentPage % 10 != 0){
								startPage=(int)(currentPage/10)*10+1;
							}else{
								startPage=((int)(currentPage/10)-1)*10+1;
							}
							
							int pageBlock = 10; //카운터링 처리 숫자
							int endPage = startPage+pageBlock-1;//화면에 보여질 페이지의 마지막 숫자
							
							if(endPage > pageCount) endPage = pageCount;
					
							//이전 링크 만들건지 파악
							if(startPage > 10){
					%>	
							<a href="./OneRoomBoardList.jsp?type=<%=type %>&pageNum=<%=startPage-10%>"> [이전]	</a>
					<%			
							}
							//페이징 처리
							for(int i = startPage; i <= endPage ; i++){
					%>
						<a href="./OneRoomBoardList.jsp?type=<%=type%>&pageNum=<%=i%>"> [<%= i %>] </a>
					<%			
								
							}
							//다음이라는 링크를 만들건지 파악
							if(endPage < pageCount){
					%>
						<a href="./OneRoomBoardList.jsp?type=<%=type %>&pageNum=<%=startPage+10%>"> [다음]	</a>
					<%			
							}					
						}
					
					%>
					</center>
				</p>
				
										

		</main>
		      </div>
		      <!-- /.col-lg-9 -->
		
		    </div>
		    <!-- /.row -->
		
		  </div>
		  <!-- /.container -->
	
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