<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Object name  = session.getAttribute("name"); 
	Object id = session.getAttribute("id"); 
	session.setAttribute("id",id);
%>


<!DOCTYPE html>
<html>
<head>

<link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Onsen : 공지사항작성</title>

<style>
.d {text-decoration: underline;}
.font_underline { color: #64a19d;}


</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 구글 icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function writeFormCheck() {
		if ($("#title").val() == null || $("#title").val() == "") {
			alert("제목을 입력해 주세요!");
			$("#title").focus();
			return false;
		}

		if ($("#content").val() == null || $("#content").val() == "") {
			alert("내용을 입력해 주세요!");
			$("#content").focus();
			return false;
		}
		return true;
	}
</script>
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
						href="business"><b>사업소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="product"><b>제품소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="app"><b>어플소개</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="chart"><b>그래프</b></a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="list"><font class="font_underline"><p class="d"><b>공지사항</b></p></font></a></li>
						

				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#">&nbsp;</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="login">로그인</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="join">회원가입</a></li>
				</ul>
			</div>

			<%
				} else{
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
						href="list"><font class="font_underline"><p class="d"><b>공지사항</b></p></font></a></li>
				

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
        
	<div class="container mt-5">
		<h1 class="text-center">공지사항 작성</h1>
		
		<br><br><br>
		<form action="write" method="post" onsubmit="return writeFormCheck()" enctype="multipart/form-data">
			<table class="table table-bordered "  >
				<tr>
					<th class="tcenter" bgcolor="#64a19d">
						<label for="subject" ><font color="white">제목</font></label>
					</th>
					<td>
						<input type="text" id="title" name="title" class="form-control" maxlength="50"/>
						<input type="hidden" id="writer" name="writer" value="${userName}" />
						<!-- 세션변수 -->
						<input type="hidden" id="writerId" name="writerId" value="${userId}" />
					</td>
				</tr>
				
				<tr >
					<th class="tcenter" bgcolor="#64a19d">
						<label for="content"><font color="white">내용</font></label>
					</th>
					<td>
						<textarea id="content" name="content" rows="8" class="form-control w-100"></textarea>
					</td>
				</tr>
				
				<tr >
				<th class="tcenter" bgcolor="#64a19d" >
				<label for="file"><font color="white">파일</font></label>
				</th>
				<td><input type="file" id="file" name="file" multiple /> <span
					class="date">&nbsp;&nbsp;*&nbsp;임의로 파일명이 변경될 수 있습니다.</span></td>
				</tr>
				
				
			</table>
			<br />
			<div class="row justify-content-center">
				<input type="reset" value="재작성" class="btn btn-outline-secondary" />
				<input type="submit" value="확인" class="btn btn-outline-secondary mx-1" />
				<input type="button" value="목록" class="btn btn-outline-secondary" onclick="location.href='list';" />
			</div>
		</form>
	</div>
	<br><br><br><br>
	  
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