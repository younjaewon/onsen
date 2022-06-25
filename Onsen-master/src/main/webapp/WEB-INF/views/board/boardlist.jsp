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
        <title>Onsen Main Page</title>
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
						href="business">Business</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="product">Product</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app">App</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="chart">Graph</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="list">FAQ</a></li>
					</ul>
					
						

				<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="login">Login</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="join">Join</a></li>
				</ul>
			</div>

			<%
				} else {
			%>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="business">Business</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="product">Product</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app">App</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="chart">Graph</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="boardlist">FAQ</a></li>
				

				</ul>
				<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="userinfo">MyPage</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="logout">Logout</a></li>
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
                <div class="mx-auto text-center">
                    
                </div>
            </div>
        </header>
        
        
        
       

        <!-- Footer-->
        <footer class="footer bg-black small text-center text-white-50"><div class="container">Copyright © Onsen Corp. All Rights Reserved.</div></footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
    </body>
</html>
