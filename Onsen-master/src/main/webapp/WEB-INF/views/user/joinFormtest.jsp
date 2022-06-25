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
    
    <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<SCRIPT>

	function DaumPostcode() {

		new daum.Postcode({

			oncomplete : function(data) {

 

				var addr = ''; // 주소 변수

				var extraAddr = ''; // 참고항목 변수

 

				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우

					addr = data.roadAddress;

				} else { // 사용자가 지번 주소를 선택했을 경우(J)

					addr = data.jibunAddress;

				}

				if (data.userSelectedType === 'R') {

 

					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {

						extraAddr += data.bname;

					}

					if (data.buildingName !== '' && data.apartment === 'Y') {

						extraAddr += (extraAddr !== '' ? ', '

								+ data.buildingName : data.buildingName);

					}

					if (extraAddr !== '') {

						extraAddr = ' (' + extraAddr + ')';

					}

					// 조합된 참고항목을 상세주소 필드에 넣는다.

					document.getElementById("addr2").value = extraAddr;

				} else {

					document.getElementById("addr2").value = '';

				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.

				document.getElementById('zip').value = data.zonecode;

				document.getElementById("addr1").value = addr;

				// 커서를 상세주소 필드로 이동한다.

				document.getElementById("addr2").focus();

			}

		}).open();

	}

	function Check_id() {

		if (joinForm.id.value.length < 1) {

			alert("아이디를 입력하세요");

			joinForm.id.focus();

			return false;

		}

		var loc = '/doc/checkid.do?userId=' + joinForm.id.value

		location.href = loc;

	}
	function Check_Pre() {
		if (joinForm.available_id.value != "1") {

			alert("중복확인을 클릭하여 주세요");

			joinForm.id.value = "";

			joinForm.id.focus();

			return false;

			System.out.println("joinForm.available_id.value")

		}

		if (joinForm.pass.value != joinForm.pass2.value) {

			alert("패스워드가 일치하지않습니다.");

			joinForm.pass.value = "";

			joinForm.pass2.value = "";

			joinForm.pass.focus();

			return false;

		}

		else{

			return true;

		}

	}

</SCRIPT>

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
	border-radius: 5px;
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
						href="board/list">FAQ</a></li>
				

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
        
        <br><br><br><br><br><br><br><br>
	<center><font size='5'><b> 회원 가입 </b></font>  
	<!-- header -->

	<div id="header">
        
		<!-- wrapper -->

		<div id="wrapper">

			<!-- content-->

			<div id="content">

				<form:form modelAttribute="user" Name='joinForm' Method='post'
					Action='join' onsubmit='return Check_Pre()'>



					<!-- ID -->

					<div>

						<h3 class="join_title">

							<label for="id">아이디</label>

						</h3>

						<span class="box int_id"> <form:input path="id"
								value="${userId}" class="int" maxlength="20" /> <span
							class="step_url"></span></span> <span class="error_next_box"></span> <input
							type='button' OnClick='Check_id()' value='ID 중복검사' class="button">
							
						<span class="fieldErrors"><form:errors path="id"/></span> 
						
						<span class="fieldErrors"> ${message}</span> <input type="hidden"
							name="available_id" value="${available}">
							

					</div>
					

					<!-- PW1 -->

					<div>

						<h3 class="join_title">

							<label for="pswd1">비밀번호</label>

						</h3>

						<span class="box int_pass"> <form:password path="pass"
								id="pass" name="pass" class="int" maxlength="20" /> <span
							id="alertTxt">사용불가</span></span> 
							<span class="fieldErrors"><form:errors path="pass"/></span>



					</div>



					<!-- PW2 -->

					<div>

						<h3 class="join_title">

							<label for="pswd2">비밀번호 재확인</label>

						</h3>

						<span class="box int_pass_check"> <input type="password"
							name="pass2" class="int" maxlength="20" value=""
							showPassword="true" />

						</span> 
						<span class="fieldErrors"><form:errors path="pass"/></span>

					</div>



					<!-- NAME -->

					<div>

						<h3 class="join_title">

							<label for="name">이름</label>

						</h3>

						<span class="box int_name"> <form:input path="name"
								id="name" name="name" class="int" maxlength="20" /></span>
								
								<span class="fieldErrors"><form:errors path="name"/></span>

					</div>



					<!-- ADDR -->

					<div>

						<h3 class="join_title">

							<label for="addr">우편번호</label>

						</h3>

						<span class="box int_addr"> <form:input path="zip"
								name="zip" class="int" maxlength="20" /></span> <input type='button'
							OnClick='DaumPostcode()' value='우편번호검색' class="button"> 
							
							<span class="fieldErrors"><form:errors path="zip"/></span>

					</div>



					<!-- ADDR -->

					<div>

						<h3 class="join_title">

							<label for="addr">주소</label>

						</h3>

						<span class="box int_addr"> <form:input path='addr1'
								id="addr1" name="addr1" class="int" maxlength="20" /></span> 
								
								<span class="fieldErrors"><form:errors path="addr1"/></span>

					</div>

					<!-- ADDR -->

					<div>

						<h3 class="join_title">

							<label for="addr">나머지 주소</label>

						</h3>

						<span class="box int_addr"> <form:input path='addr2'
								id="addr2" name="addr2" class="int" maxlength="20" /></span> 
								<span class="fieldErrors"><form:errors path="addr2"/></span>

					</div>



					<!-- EMAIL -->

					<div>

						<h3 class="join_title">

							<label for="email">본인확인 이메일</label>

						</h3>

						<span class="box int_email"> <input type='text'
							name='email' id="email" class="int" maxlength="100" /></span> 
							<span class="fieldErrors"><form:errors path="email"/></span>

					</div>



					<!-- MOBILE -->

					<div>

						<h3 class="join_title">

							<label for="phoneNo">휴대전화</label>
						</h3>

						<span class="box int_mobile"> <input type="text"
							name='phone' id="phone" class="int" maxlength="16"
							placeholder="전화번호 입력" /></span> 
						<span class="fieldErrors"><form:errors path="phone"/></span>

					</div>

					<!-- JOIN BTN-->

					<div class="btn_area">

						<button type="submit" id="btnJoin">

							<span>가입하기</span>

						</button>

					</div>

				</form:form>

 <br><br><br><br><br>
		<center>
			<div class="copyright-wrap">

			<span>Copyright © OnSen Corp. All Rights Reserved.</span>

			</div></center>
<br><br><br>
			</div>

			<!-- content-->

		</div>
        
        
        <!-- wrapper -->


	</div>
        
        
       
       <!-- Footer-->
<!--         <footer class="footer bg-black small text-center text-white-50"><div class="container">Copyright © Onsen Corp. All Rights Reserved.</div></footer> -->
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
     
    </body>
</html>
