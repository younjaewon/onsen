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
<style>
.d {text-decoration: underline;}
.font_underline { color: #64a19d;}

.dd{border:5px;}
</style>

    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>OnSen 어플소개</title>
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
                <a class="navbar-brand js-scroll-trigger" href="home"> <img class="img-fluid" width="200px" src="<%=request.getContextPath() %>/resources/assets/img/onsenlogo.png" alt="" /></a>
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
						href="product"><b>제품소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app"><font class="font_underline"><p class="d"><b>어플소개</b></p></font></a></li>
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
						href="product"><b>제품소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app"><font class="font_underline"><p class="d"><b>어플소개</b></p></font></a></li>
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
        <!-- Mastheadd-->
        <header class="mastheadd">
            <div class="container d-flex h-100 align-items-center">
                <div class="mx-auto text-center">
                             

                </div>
            </div>
        </header>
        
         <section class="projects-section bg-light" id="projects">
            <div class="container">
        <!-- Featured Project Row-->
                <div class="row align-items-center no-gutters mb-4 mb-lg-5">
                    <div class="col-xl-8 col-lg-7"><img  class="img-fluid mb-3 mb-lg-0" src="${pageContext.request.contextPath}/resources/assets/img/app2.png" border="20" /></div>
                    <div class="col-xl-4 col-lg-5">
                        <div class="featured-text text-center text-lg-left">
                            <h1> Device registration</h1>
                            <br>
						<p class="text-black-50 mb-0">모바일 기기에 온센 앱을 설치하고</font></p>
						<p class="text-black-50 mb-0">편리하게 체온 정보를 관리해 보세요.</p>
					</div>
                    </div>
                </div>
                </div>

                </section>

<!--             <section class="bg-light" id="projects"> -->

    <div class="container">

      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="p-5">
          
            <img width="695" class="img-fluid " src="${pageContext.request.contextPath}/resources/assets/img/step1.png" alt="" />
            
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-5">
          
          
            <h2 class="display-4"> <img width="250" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/resources/assets/img/s1.png" alt="" /></h2>

             <p>온센 앱을 모바일 기기에 </p>
            <P> 설치하고 회원가입 후 로그인</p>
            
          </div>
        </div>
      </div>
    </div>
<!--   </section> -->

<!--   <section class="bg-light" id="projects"> -->
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
        
         
          <div class="p-5">
            <h2 class="display-4"><img width="250" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/resources/assets/img/s2.png" alt="" /></h2>
          	 <p>온센 앱 상단 '기기등록' 탭 접속</p>
          </div>
          
        </div>
        <div class="col-lg-6">
        
           <div class="p-5">
            <img width="695" class="img-fluid " src="${pageContext.request.contextPath}/resources/assets/img/step2.jpg" alt="" />
          </div>
          
        </div>
        
      </div>
    </div>
<!--   </section> -->
<!--   <section class="bg-light" id="projects"> -->
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
          <div class="p-5">
            <img width="695" class="img-fluid " src="${pageContext.request.contextPath}/resources/assets/img/step3.jpg" alt="" />
          </div>
        </div>
        <div class="col-lg-6">
          <div class="p-5">
            <h2 class="display-4"><img width="250" border="3px"  class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/resources/assets/img/s3.png" alt="" /></h2>
            <p>모바일 기기와 온센 체온계의 </p> 
            <p>블루투스 활성화</p>
          </div>
        </div>
      </div>
    </div>
<!--   </section> -->
<!--   <section class="bg-light" id="projects"> -->
    <div class="container">
      <div class="row align-items-center">
        <div class="col-lg-6">
        
         
          
          
          <div class="p-5">
            <h2 class="display-4"><img width="250" class="img-fluid rounded-circle" src="${pageContext.request.contextPath}/resources/assets/img/s4.png" alt="" /></h2>
            <p>모바일 기기와 온센 체온계가 </p>
            <p>연동되면 써모케어 앱 상단에 '연결됨' 표시</p>
          </div>
          
        </div>
        <div class="col-lg-6">
         <div class="p-5">
            <img width="695" class="img-fluid "  src="${pageContext.request.contextPath}/resources/assets/img/step4.jpg"/>
          </div>
          
        </div>
      </div>
    </div>
<!--   </section> -->
           


        
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