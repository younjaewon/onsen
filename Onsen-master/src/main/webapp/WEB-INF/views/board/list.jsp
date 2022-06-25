<!DOCTYPE html>
<html lang="en">
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	Object name  = session.getAttribute("name"); 
	Object id = session.getAttribute("id"); 
	session.setAttribute("id",id);
%>


<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Varela+Round"
	rel="stylesheet" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous"/>



<title>Onsen 공지사항</title>



<head>
<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Onsen FAQ Page</title>
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet" />
        <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
		<link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />
	
</head>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">

function selectedOptionCheck(){
    $("#type > option[value=<%=request.getParameter("type")%>]").attr("selected", "true");
}

function moveAction(where){
switch (where) {
case 1:
location.href = "write";
break;

case 2:
location.href = "list";
break;
}
}

</script>

<style>
.d {text-decoration: underline;}
.font_underline { color: #64a19d;}
</style>

<body onload="selectedOptionCheck()" id = "page-top">
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
        
	<!--Mastheadf -->
        <header class="mastheadf">
            <div class="container d-flex h-100 align-items-center">
                <div class="mx-auto text-center">
                    
                </div>
            </div>
        </header>
      
<!--         About --> 
        <section class="about-section text-center" id="about">
            <div class="container">
                <div class="row">
                
                    <div class="col-lg-8 mx-auto">
                        <h2 class=" mb-4">공지사항</h2>
                        
               
                        
               <%
				//회원 아이디에 대한 세션이 관리자일 경우 
				if (session.getValue("id") == null) {
			%>
                
                     
                        <a href="write">  </a>
        
        <%
				} else if(session.getValue("id").equals("admin")){
			%>
			
			 <a href="write"> 공지사항작성 </a>
			 
			 
			 
			<%
				}else{
					
					
				
			%>
				 <a href="write">  </a>
			
			<%
				}
			%>
        
                   </div>
                         
                         
				<div class="col-12 mb-2 ">
					<div class="d-flex justify-content-center mb-2  " style="height: 100px;">
						<form action="list" modelAttribute="searchVO" method="get" class="option form-inline my-2 my-lg-0">
							<div class="form-group">
								<select class="form-control mr-sm-2" id="type" name="type">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="writerId">작성자</option>
								</select>
								<input class="form-control border mr-sm-2" type="text" id="keyword" name="keyword" style="width: 600px;" placeholder="통합검색" value="<%if (request.getParameter("keyword") != null) {
					out.print(request.getParameter("keyword"));
				} else {
					out.print("");
			}%>" /> 
								<input type="submit" value="검색" />
							</div>
						</form>
					</div>
					
                        </div>
                        
                        
                       
                        
                        <table class="table table-hover">
                       <tr>
<th>글번호</th><th>제목</th><th>작성자</th><th>조회수</th><th>작성일</th>
</tr>
<c:forEach var="board" items="${boardList}">
<tr>
<td class="idx">${board.bno}</td>
<td align="left" class="subject">
<a href="view?bno=${board.bno}">${board.title}</a></td>
<td class="writer">  ${board.writerId}</td>
<td class="hitcount">${board.viewcnt}</td>
<td class="writeDate">${board.regDate}</td>
</tr>
     </c:forEach>
                    </table>
	
                   
               </div>
		
${pageHttp}<br><br><br>
              
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
