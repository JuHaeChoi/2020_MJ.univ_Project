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
        <title>회원가입</title>
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
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원가입</h3></div>
                                    <div class="card-body">
                                        
                                        <form action="./SignUpProc.jsp" method="post">
                                        	<div class="form-group">
                                                <label class="small mb-1" for="inputName">이름</label>
                                                <input class="form-control py-4" id="inputName" name="name" type="text" placeholder="이름을 입력하세요" required/>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputID">아이디</label>
                                                <input class="form-control py-4" id="inputID" name="id" type="text" placeholder="ID를 입력하세요" required/>
                                            </div>
                                        	<div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputPassword">비밀번호</label>
                                                        <input class="form-control py-4" id="inputPassword" name="pw" type="password" placeholder="비밀번호를 입력하세요" required/>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputConfirmPassword">비밀번호 확인</label>
                                                        <input class="form-control py-4" id="inputConfirmPassword" name="pw2" type="password" placeholder="비밀번호를 입력하세요" required/>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputTel">전화번호</label>
                                                <input class="form-control py-4" id="inputTel" type="text" name="tel" placeholder="전화번호를 입력하세요" required/>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputEmailAddress">이메일</label>
                                                <input class="form-control py-4" id="inputEmailAddress" name="email" type="email" aria-describedby="emailHelp" placeholder="이메일을 입력하세요" required/>
                                            </div>
                                            <div class="form-group">
                                                <label class="small mb-1" for="inputAddress">주소</label>
                                                <input class="form-control py-4" id="inputAddress" name="address" type="text" placeholder="주소를 입력하세요" required/>
                                            </div>
                                            
                                            <div class="form-group mt-4 mb-0"><button type="submit" class="btn btn-primary btn-block">계정 생성</button></div>
                                        </form>
                                    </div>
                                    <div class="card-footer text-center">
                                        <div class="small"><a href="${pageContext.request.contextPath}/page/login/login.jsp">이미 계정이 있는 경우, 로그인</a></div>
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
                            <div class="text-muted">Copyright &copy; TingDongSan 2020</div>
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