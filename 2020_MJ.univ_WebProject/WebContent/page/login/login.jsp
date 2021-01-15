<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
	<head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>로그인</title>
        <link href="${pageContext.request.contextPath}/sources_AD/dist/css/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="bg-primary">
    <Style>
    body{
		background-image: url("${pageContext.request.contextPath}/img/BackGround_IMG4.jpg");
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	}
    </Style>
    	<%
    		//사용자 컴퓨터의 쿠키 저장소로부터 쿠키값을 읽어온다.(개수를 모르기 때문에 배열 사용)
    		Cookie[] cookies = request.getCookies();
    		String id = "";
    	
    		//쿠키 값이 없을 수도 있기 때문에 null 처리를 한다.
    		if(cookies != null){
    			for(int i = 0; i < cookies.length; i++){
    				if(cookies[i].getName().equals("id")){
    					id = cookies[i].getValue();
    					break; //원하는 데이터 찾으면 바로 break;
    				}
    			}
    		}
    	
    	
    	
    	%>
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-5">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">로그인</h3></div>
                                    <div class="card-body">
                                    
                                        <form action="./loginProc.jsp" method="post">
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputID">아이디</label>
                                                <input class="form-control py-4" id="inputID" type="text" name="id" value="<%=id %>" required/>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputPassword">비밀번호</label>
                                                <input class="form-control py-4" id="inputPassword" type="password" name="pw" required/>
                                            </div>
                                            <div class="form-group">
                                                <div class="custom-control custom-checkbox">
                                                    <input class="custom-control-input" id="rememberPasswordCheck" type="checkbox" name="save" value="1" />
                                                    <label class="custom-control-label" for="rememberPasswordCheck">아이디 저장하기</label>
                                                </div>
                                            </div>
                                            <div class="form-group d-flex align-items-center justify-content-between mt-4 mb-0">
                                                <a class="small" href="${pageContext.request.contextPath}/page/MainHome.jsp">취소</a>
                                                <input type="submit" class="btn btn-primary" value="로그인">
                                            </div>
                                        </form>
                                        
                                    </div>
                                    
                                        
                                    
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="./SignUp.jsp">계정이 없으신가요? 회원가입</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your TingDongSan 2020</div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/sources_AD/dist/js/scripts.js"></script>
    </body>
	
</body>
</html>