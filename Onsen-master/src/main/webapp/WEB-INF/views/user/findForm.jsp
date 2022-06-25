<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Onsen : 아이디찾기</title>

<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet" type="text/css" />
	<link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />
	
<META http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="resources/css/style.css">
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Varela+Round"
	rel="stylesheet" />
<link href="default.css" rel="stylesheet" type="text/css" media="all" />
<link href="fonts.css" rel="stylesheet" type="text/css" media="all" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous" />
<script
	src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
html {
	height: 100%;
}

body {
	margin: 0;
	height: 100%;
	background: #f5f6f7;
	
}

#logo {
	width: 240px;
	height: 44px;
	cursor: pointer;
}

#header {
	padding-top: 62px;
	padding-bottom: 20px;
	text-align: left;
}

#wrapper {
	position: relative;
	height: 100%;
}

#content {
	position: absolute;
	left: 50%;
	transform: translate(-50%);
	width: 460px;
}

/* 입력폼 */
h3 {
	margin: 19px 0 8px;
	font-size: 14px;
	font-weight: 700;
}

.box {
	display: block;
	width: 100%;
	height: 51px;
	border: solid 1px #dadada;
	padding: 10px 14px 10px 14px;
	box-sizing: border-box;
	background: #fff;
	position: relative;
}

.int {
	display: block;
	position: relative;
	width: 100%;
	height: 29px;
	border: none;
	background: #fff;
	font-size: 15px;
}

input {
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

.box.int_id {
	padding-right: 110px;
}

.box.int_pass {
	padding-right: 40px;
}

.box.int_pass_check {
	padding-right: 40px;
}

.step_url {
	/*@naver.com*/
	position: absolute;
	top: 16px;
	right: 13px;
	font-size: 15px;
	color: #8e8e8e;
}

.pswdImg {
	width: 18px;
	height: 20px;
	display: inline-block;
	position: absolute;
	top: 50%;
	right: 16px;
	margin-top: -10px;
	cursor: pointer;
}

#bir_wrap {
	display: table;
	width: 100%;
}

#bir_yy {
	display: table-cell;
	width: 147px;
}

#bir_mm {
	display: table-cell;
	width: 147px;
	vertical-align: middle;
}

#bir_dd {
	display: table-cell;
	width: 147px;
}

#bir_mm, #bir_dd {
	padding-left: 10px;
}

select {
	width: 100%;
	height: 29px;
	font-size: 15px;
	background: #fff
		url(https://static.nid.naver.com/images/join/pc/sel_arr_2x.gif) 100%
		50% no-repeat;
	background-size: 20px 8px;
	-webkit-appearance: none;
	display: inline-block;
	text-align: start;
	border: none;
	cursor: default;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
}

/* 에러메세지 */
.error_next_box {
	margin-top: 9px;
	font-size: 12px;
	color: red;
	display: none;
}

#alertTxt {
	position: absolute;
	top: 19px;
	right: 38px;
	font-size: 12px;
	color: red;
	display: none;
}

/* 버튼 */
.button {
	width: 75px;
	background-color: #64a19d;;
	border: none;
	color: #fff;
	padding: 10px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 10px;
	margin: 0px;
	cursor: pointer;
}

.btn_area {
	margin: 30px 0 91px;
}

#btnJoin {
	width: 100%;
	padding: 21px 0 17px;
	border: 0;
	cursor: pointer;
	color: #fff;
	background-color: #64a19d;
	font-size: 20px;
	font-weight: 400;
	font-family: Dotum, '돋움', Helvetica, sans-serif;
	border-radius: 10px;
	letter-spacing: 5px;
}

span.fieldErrors {
	color: red;
	font-size: 15px;
	font-family: arial, sans-serif;
	align: "left";
	
	
	
}
.d {text-decoration: underline;}
.font_underline { color: #64a19d;}

</style>

</head>
<body>


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
						href="home"><b>사업소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="product"><b>제품소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app"><b>애플소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="chart"><b>그래프</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="list"><b>공지사항</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">&nbsp;</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="login"><font class="font_underline"><p class="d">로그인</p></font></a></li>
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
						href="home"><b>사업소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="product"><b>제품소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app"><b>어플소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="chart"><b>그래프</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="board/list"><b>공지사항</b></a></li>
				

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

<br><br><br><br><br><br><br><br>
	<center><h1>아이디 찾기 </h1> </center>
<br><br>


	<section>
		<div class="container">
			<div class="row">
				<div class="col-lg-6 offset-lg-3">

					<form:form modelAttribute="user" Name='findIdForm' Method='post'
						Action='findId'>

						<div>

							<h3 class="join_title">

								<label for="id">사용자이름</label>

							</h3>

							<form:input type="text" class="form-control" path="name"
								id="name" name="name" />
								
							<span class="fieldErrors"><form:errors path="name" /></span>


						</div>
						<div>

							<h3 class="join_title">

								<label for="pswd1">E-Mail</label>

							</h3>

							<form:input path="email" id='email' name="email"
								class="form-control" maxlength="30" size='10' />
							<span class="fieldErrors"><form:errors path="email" /></span>



						</div>


						<div class="btn_area">

							<button type="submit" id="btnJoin">

								<span>아이디 찾기</span>

							</button>

						</div>

					</form:form>
					

		

		
				</div>
			</div>
		</div>
	</section>
<br><br><br><br>
<br><br>



<!-- Footer-->
        <footer class="footer bg-blacks small text-center "><div class="container">Copyright © Onsen Corp. All Rights Reserved.</div></footer>


</body>
</html>