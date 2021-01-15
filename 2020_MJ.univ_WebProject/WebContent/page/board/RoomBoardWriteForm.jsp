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
		
		  <title>띵동산_게시글작성</title>
		
		  <!-- Bootstrap core CSS -->
		  <link href="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
		
		  <!-- Custom styles for this template -->
		  <link href="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/css/modern-business.css" rel="stylesheet">
		
		<!-- CKEditor -->
		<script src="https://cdn.ckeditor.com/ckeditor5/23.1.0/classic/ckeditor.js"></script>
		
			<style type="text/css">
			
				footer{
					
					width: 100%;
					bottom:0;
					height:1%;
				}
			
				.ck-editor__editable{
					min-height: 530px;
				}
				
				main{
					margin-bottom: 10rem;
				}
				
				#title-txt{
					width: 100%;
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
	
		RoomBoardDAO bdao = new RoomBoardDAO();
		String tel = bdao.getMemberTel(id);
		
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
				            <a class="dropdown-item"><%=id %> 고객님 반갑습니다</a>
				            <a class="dropdown-item" href="${pageContext.request.contextPath}/page/login/login.jsp">로그인</a>
				            <a class="dropdown-item" href="${pageContext.request.contextPath}/page/login/SignUp.jsp">회원가입</a>
				            </div>
		           <%
		            	}else{
		           %>
		            		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPages">
				              <a class="dropdown-item"><%=id %> 고객님 반갑습니다</a>
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
		  <main>
			  <div class="container">
			
			    <!-- Page Heading/Breadcrumbs -->
			    <h1 class="mt-4 mb-3">
			      <small>게시글 작성</small>
			    </h1>
			
			    <div class="breadcrumb">
			    <!-- hover -->
			  
			 <!-- enctype="multipart/form-data" -->
	 	 	<form action="./RoomBoardWriteProc.jsp" method="post" enctype="multipart/form-data" id="frm" >
	 	 	
			    	<table class="table table-bordered">
						
							<tr>
								<td width="90">제목
								</td>
								
								<td colspan="6"><input type="text" id="title-txt" name="sales_title" required></td>
								<td align="left" width="80"><select name="sales_type">
									<option value="원룸">원룸</option>
									<option value="투룸이상">투룸이상</option>
									<option value="쉐어하우스">쉐어하우스</option>
									<option value="하숙 및 기타">하숙 및 기타</option>
									</select>
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><%=id %></td>
								<td><input type="hidden" value="<%=id %>" name="member_id"><td>
							</tr>
							<tr>
								<td>전화번호</td>
								<td><%=tel %></td>
								<td><input type="hidden" value="<%=tel %>" name="member_phonenum"><td>
								<td>예약금</td>
								<td><input type="text" name="sales_reservation_num" value="20,000원" readonly="readonly"></td>
							</tr>
							<tr>
								<td>월세</td>
								<td><input type="text" name="sales_monthly_rent_cost" required></td>
								<td>보증금</td>
								<td><input type="text" name="sales_deposit" required></td>
								<td>관리비</td>
								<td><input type="text" name="sales_maintenance_cost" required></td>
							</tr>
							<tr>
								<td>평수</td>
								<td><input type="text" name="sales_space" required></td>
								
								<td>층수</td>
								<td><input type="text" name="sales_floor" required></td>
							</tr>
							<tr>
								<td>옵션</td>
								<td  colspan="7"><input id="title-txt" type="text" name="sales_option" required></td>								
							</tr>
							<tr>
								<td>주소</td>
								<td  colspan="7"><input id="title-txt" type="text" name="sales_address" required></td>
							</tr>
							<tr>

								<td colspan="9"><textarea class="form-control" name="sales_info" cols="50rem" id="editor" placeholder="글 내용" ></textarea></td>	

							</tr>
							<tr>
								<td colspan="9"><input type="file" name="sales_img"></td>
							</tr>
							<tr>
							<!-- 0. <div align="right">	-->	
								<td align="right"  colspan="9" >
					  			<button type="button" value = "cancel" onclick="location.href='../MainHome.jsp'">취소</button>
					  			<input type="submit" value="작성"/>
					  			
					  			
					  			</td>
							<!-- 0.	</div>	-->	
							</tr>
					</table>				  
				
			</form>	
				  
				  </div>		    
			    
			  </div>
			  <!-- /.container -->
			</main>
		
		  <!-- Footer -->
		  <footer class="py-5 bg-dark">
		    <div class="container">
		      <p class="m-0 text-center text-white">Copyright &copy; TingDongSan 2020</p>
		    </div>
		    <!-- /.container -->
		  </footer>
		
		  <!-- Bootstrap core JavaScript -->
		  <script src="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/vendor/jquery/jquery.min.js"></script>
		  <script src="${pageContext.request.contextPath}/sources_MODERN_BUSINESS/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		  
		 
		  
		  <script type="text/javascript">
		  
		  	ClassicEditor
		  		.create( document.querySelector('#editor') ,{
		  			cloudServices: {
						tokenUrl:'개인 토큰',
						uploadUrl:'개인 토큰'
					}
		  		})
		  		.catch(error => {
		  			console.error(error);
		  		});
		  
		  </script>
		
</body>
</html>