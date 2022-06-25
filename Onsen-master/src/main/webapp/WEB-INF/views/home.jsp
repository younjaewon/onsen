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
</style>


    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Onsen</title>
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
						href="product"><b>제품소개</b></a></li>
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
						href="product"><b>제품소개</b></a></li>
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
        
        <!-- Masthead-->
        <header class="masthead">
            <div class="container d-flex h-100 align-items-center">
            </div>
        </header>
        
        
               
                    
        
        
        
        <section class="about-section text-center" id="about">
                                <h2 class=" mb-4">Onsen 소식</h2><br><br>
        
         <div class="container">
                <div class="row">
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <h4 class="text-uppercase m-0"><a href="product"><img class="img-fluid"  src="${pageContext.request.contextPath}/resources/assets/img/ppp.jpg" alt="" width="270" /></a></h4>
                                 <hr class="my-4" />
                                
                                <div class="small "><b>코로나19 위기관리, 원격 웨어러블 체온계 등장 </b></div><br>
                           		<div class="small text-black-50"><b>코로나19로 인한 장기적 감염병 위기 시대 속 질환을 예방하기 위해 개인이 할수 있는 가장 기본적인 관리는 체온 측정에서 시작된다.체온은 직관적 ...
                           		</b></div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <h4 class="text-uppercase m-0"><a href="app"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/assets/img/app2.png" alt=""width="500" /></a></h4>
                                <hr class="my-4" />
                                <div class="small"><b>APP와 블루투스를 연동한 체온 정보 관리</b></div><Br>
                                <div class="small text-black-50" ><b> 

								최재건은 올해 상반기에 스마트 체온계 'Onsen'을 출시할 예정이라고 밝혔다.
								Onsen은 가슴에 붙이는 패치형 체온계로 아이나 환자의 신체에 무리..</b></div>
								
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-md-4 mb-3 mb-md-0">
                        <div class="card py-4 h-100">
                            <div class="card-body text-center">
                                <h4 class="text-uppercase m-0"><a href="chart"><img class="img-fluid" src="<%=request.getContextPath() %>/resources/assets/img/mmm.png" alt=""  width="245"/></a></h4>
                                <hr class="my-4" />
                                <div class="small"><b>체온데이터를 그래프로 시각화</b></a></div><br>
                                <div class="small text-black-50" ><b> 
								최재건의 스마트 패치형 체온계 ‘Onsen’은 신종 코로나바이러스 감염증(코로나19) 필수품으로 부각되면서 피부 패치형 체온계 부문 대상을 차지...
								
								
								</b></div>
                            </div>
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
        
        <div id="frogue-container" class="position-right-bottom"
      data-chatbot="919e10d5-86e5-41ff-88bd-6f9822cd39e2"
      data-user="사용자ID"
      data-init-key="value"
      ></div>
<!-- data-init-식별키=값 으로 셋팅하면 챗플로우에 파라미터와 연동가능. 식별키는 소문자만 가능 -->
<script>
(function(d, s, id){
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) {return;}
    js = d.createElement(s); js.id = id;
    js.src = "https:\/\/danbee.ai/js/plugins/frogue-embed/frogue-embed.min.js";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'frogue-embed'));
</script>
    </body>
</html>
