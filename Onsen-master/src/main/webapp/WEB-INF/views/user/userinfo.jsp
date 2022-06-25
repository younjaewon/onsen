<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>

<link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />


<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">

<html>
<style>

/*  html {  */

/* 	height: 100%;  */

/* } */

 

/* body { */

/* 	margin: 0; */

/* 	height: 100%; */

/* 	background: #f5f6f7; */

/* 	font-family: Dotum, '돋움', Helvetica, sans-serif; */

/* } */

 

.notuser a {

	font-stretch: expanded;

	font-size: 1.0em;

}

 

.notuser a { /*클릭하지 않은 링크*/

	color: #970A42;

	text-decoration: none;

}

 

.notuser a:hover { /*링크를 클릭하려고 마우스를 가져갔을때*/

	color: #970A42;

	text-decoration: none; /*밑줄 없음*/

}

 

.form-group .row .col-lg-8 {

	font-size: 0.813em;

}

 
a span {

	font-stretch: expanded;

	font-size: 1.5em;

}

 

.buttons {

	display: inline-block;

	background: #970A42;

	width: 540px;

	border-radius: 8px;

	letter-spacing: 0.10em;

	line-height: 3em;

	text-decoration: none;

	text-transform: uppercase;

	font-weight: 400;

	font-size: 10px;

	color: #64a19d;

}

 

.a {

	background: #ffffff; 

	border-spacing: 40px;

	border-color: #64a19d;

}

 

.btns {

	display: inline-block;

	background: #64a19d;

	width: 80px;

	border-radius: 8px;

	letter-spacing: 0.10em;

	line-height: 4em;

	text-decoration: none;

	text-transform: uppercase;

	font-size: 10px;

	color: #FFF;

}

.btnss {

	display: inline-block;

	background: #ff0000;

	width: 80px;

	border-radius: 8px;

	letter-spacing: 0.10em;

	line-height: 4em;

	text-decoration: none;

	text-transform: uppercase;

	font-size: 10px;

	color: #FFF;

}

.d {text-decoration: underline;}
.font_underline { color: #64a19d;}

</style>

 

<SCRIPT>  

 

	function Delete() {

		if (confirm("탈퇴하시겠습니까?")) {

			userinfo.action = 'delete';

			userinfo.submit();

		}

	}

	

</SCRIPT>   

<head>
<meta charset="UTF-8">
<title>Onsen 내정보</title>
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
						href="app"><b>어플소개</b></a></li>
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
						href="list"><b>공지사항</b></a></li>
				

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">&nbsp;</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="userinfo"><font class="font_underline"><p class="d">내정보</p></font></a></li>
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
<center><h1>내 정보</h1></center>

<br><br>

<form:form modelAttribute="user" Name='userinfo' Method='post' Action='userinfo'>
<form:input type="hidden" path="id" name="id" value="${uesr.id }"/>
		<table class="a" border="0" align="center" width="800px" height="300px">
		<tr >
			<th algin="center"  rowspan="5"  padding="20px" width="200px" style="border: none;"></th>
			<th style="border: none;" align="left">아이디</th>
			<td style="border: none;" colspan="2">${user.id}</td>
		</tr>
		<tr>
			<th style="border: none;"><span class="">이름</span></th>
			<td style="border: none;" colspan="2"><span class="">${user.name}</span></td>
		</tr>
		<tr>
			<th style="border: none;"><span class="">주소</span></th>
			<td style="border: none;" colspan="2"><span class="">${user.addr1}   ${user.addr2}</span></td>
		</tr>
		<tr>
			<th style="border: none;"><span class="">휴대폰번호</span></th>
			<td style="border: none;" colspan="2"><span class="">${user.phone}</span></td>
		</tr>
		<tr>
			<th style="border: none;"><span class="">E-Mail</span></th>
			<td style="border: none;" colspan="2"><span class="">${user.email}</span></td>
		</tr>
	</table ><br>
<table align="center">
	<tr>
	<td>
	<input type="button" class="btns" value="회원정보수정" onclick="location.href='edit?userId=${user.id}'">&nbsp;
	<input type='button'  class="btnss"  value='탈퇴하기' onclick = 'Delete()'> 
	</td>
	</tr>
	</table>
</form:form>

<br><br><br>
<br><br>
<!-- Footer-->
        <footer class="footer bg-blacks small text-center "><div class="container">Copyright © Onsen Corp. All Rights Reserved.</div></footer>
</body>
</html>