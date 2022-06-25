<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Varela+Round"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous"/>
	
	<%
	Object name  = session.getAttribute("name"); 
	Object id = session.getAttribute("id"); 
	session.setAttribute("id",id);
%>

<Style>



.mastheads h2 {
  max-width: 20rem;
  font-size: 1rem;
}
@media (min-width: 768px) {
  .mastheads h1 {
    font-size: 4rem;
    line-height: 4rem;
  }
}
@media (min-width: 992px) {
  .mastheads {
    height: 100vh;
    padding: 0;
  }
  .mastheads h1 {
    font-size: 6.5rem;
    line-height: 6.5rem;
    letter-spacing: 0.8rem;
  }
  .mastheads h2 {
    max-width: 30rem;
    font-size: 1.25rem;
  }
.d {text-decoration: underline;}
.font_underline { color: #64a19d;}
  
}
</Style>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Onsen 제품소개</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />
    </head>
    <body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="home"><img class="img-fluid" width="200px" src="<%=request.getContextPath() %>/resources/assets/img/onsenlogo.png" alt="" /></a>
                <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>

			<%
				//회원 아이디에 대한 세션이 없을 경우
				if (session.getValue("id") == null) {
			%>

			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="business"><b>사업소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="product"><font class="font_underline"><p class="d"><b>제품소개</b></p></font></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app"><b>어플소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="chart"><b>그래프</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="list"><b>공지사항</b></a></li>
						

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">&nbsp;</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="login">로그인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="join">회원가입</a></li>
				</ul>
			</div>

			<%
				} else {
			%>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="business"><b>사업소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="product"><font class="font_underline"><p class="d"><b>제품소개</b></p></font></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app"><b>어플소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="chart"><b>그래프</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="list"><b>공지사항</b></a></li>
				

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">&nbsp;</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="userinfo">내정보</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="logout">로그아웃</a></li>
				</ul>
			</div>
			<%
				}
			%>




		</div>
        </nav>
        <br><br><br><br><br>
                <!-- Mastheads-->
        <header class="mastheads">
            <div class="container d-flex h-100 align-items-center">
                <div class="mx-auto text-center">
                   <h1 class="mx-auto my-0 text-uppercase"> 제품소개  </h1>
                </div>
            </div>
        </header>
       
        
     
        
        
        <!-- About-->
        <section class="about-section text-center" id="about">
            <div class="container">
                            <img class="img-fluid" src="<%=request.getContextPath() %>/resources/assets/img/pahipro.png" alt=""/><br><br><br><br>
                <div class="row">
                    <div class="col-lg-8 mx-auto">
                        <h2 class=" mb-4">Products Concept </h2>
                        <p class="#">온센은 인체의 온도를 측정하는 정밀한
						온도센서와 위치인지,인터넷 연결이 가능한 블루투스와의 연결을 통하여 스티커형태의 1회용 패치로 개발된 Wearable
						온도계입니다. 단지, 보호지를 제거하고 몸에 붙이기만 하면 곧바로 온도를 측정하여 스마트폰으로 확인할 수 있어 누구나
						손쉽게 사용이 가능합니다. 3g의 가벼운 무게로 인체 부착 시 쉽게 떨어지지 않으며 소프트한 재질로 이질감과 거부감이
						적어 체온 측정 시 행동이 자유롭고 이동의 불편함이 없습니다.</p><br><Br>
                    </div>
                </div>
            </div>
            
       
            <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <h4 class="text-uppercase m-0">체온관리</h4>
                                 <hr class="my-4" />
                                <img class="img-fluid" src="<%=request.getContextPath() %>/resources/assets/img/graph.png" alt="" />
                                <div class="small text-black-50">그래프로 한눈에 보는 체온 변화 트렌드</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <h4 class="text-uppercase m-0">블루투스</h4>
                                <hr class="my-4" />
                                <img class="img-fluid" src="<%=request.getContextPath() %>/resources/assets/img/blue.png" alt="" />
                                <div class="small text-black-50">블루투스를 연동한 체온 정보 관리</a></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <h4 class="text-uppercase m-0">발열알람</h4>
                                <hr class="my-4" />
                                <img class="img-fluid" src="<%=request.getContextPath() %>/resources/assets/img/ar.png" alt="" />
                                <div class="small text-black-50">체온 측정 시간 알람 설정</a></div>
                            </div>
                        </div>
                    </div>
                     
                  
                    
                </div>
                <br><br><br>
                <div class="social d-flex justify-content-center">
                    <a class="mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                    <a class="mx-2" href="#!"><i class="fab fa-github"></i></a>
                </div>
                <br><br>
            </div>
            
        </section>
        
        
        <!-- Footer-->
        <footer class="footer bg-blacks small text-center "><div class="container">Copyright © Onsen Corp. All Rights Reserved.</div></footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
    </body>
</html>
