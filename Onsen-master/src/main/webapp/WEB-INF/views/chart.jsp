<!-- chart.jsp-->
<%@ page language="java" contentType="text/html; charset = UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600,700,900|Varela+Round"
	rel="stylesheet" />

<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z"
	crossorigin="anonymous" />

<link href="<%=request.getContextPath() %>/resources/css/styles.css"
	rel="stylesheet" />


<%
	Object name  = session.getAttribute("name"); 
	Object id = session.getAttribute("id"); 
	session.setAttribute("id",id);
%>

<style>
.d {
	text-decoration: underline;
}

.font_underline {
	color: #64a19d;
}
</style>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Onsen 그래프</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script>
var y = new Array();
</script>
<table>
	<c:forEach var="result" items="${chartdata}" varStatus="status">

		<script>
			y[${status.index}] = ${result.tempc};
			console.log(y[${status.index}]);
			</script>


	</c:forEach>
</table>


<script>
	google.charts.load('current', {
		packages : [ 'corechart', 'line' ]
	});
	google.charts.setOnLoadCallback(drawBasic);
	
	
	

	function drawBasic() {
		
		var data = new google.visualization.DataTable();
		data.addColumn('number', 'X');
		data.addColumn('number', '°C');
		
	
 		
		data.addRows([ [1, y[0]], [2, y[1]], [3,y[2]], [4,y[3]], [5,y[4]], [6,y[5]], [7,y[6]],[8,y[7]], [9,y[8]], [10,y[9]], [11,y[10]],[12,y[11]],
		[13,y[12]], [14,y[13]], [15,y[14]], [16,y[15]], [17,y[16]], [18,y[17]], [19,y[18]], [20,y[19]], [21,y[20]], [22,y[21]], [23,y[22]], [24,y[23]] ]);
		
		
		console.log(y[0]);
		console.log(y[1]);
		

		var options = {
			hAxis : {
				title : 'Time'
			},
			vAxis : {
				title : 'in C'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('chart_div'));

		chart.draw(data, options);
	}
</script>
</head>
<body>
	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top"
		id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="home"> <img
			class="img-fluid" width="200px"
			src="<%=request.getContextPath() %>/resources/assets/img/onsenlogo.png"
			alt="" /></a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			Menu <i class="fas fa-bars"></i>
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
					href="chart"><font class="font_underline"><p class="d"><b>그래프</b></p></font></a></li>
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
					href="chart"><font class="font_underline"><p class="d"><b>그래프</b></p></font></a></li>
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
	<div>
		<img width="1903" height="560"
			src="<%=request.getContextPath() %>/resources/assets/img/graphic.png"
			alt="" /><br>
		
	
	
	</div>
	<!-- About-->
	<section class="about-section text-center" id="about">
	<div class="container">
		<div class="row">
			<div class="col-lg-8 mx-auto">
				<h2 class=" mb-4">그래프</h2>
				<p class="#">
				<form action="chart" method="post">

					<select name="year" id="year">
						<option value="2019">2019</option>
						<option value="2020">2020</option>
					</select> 년 <select name="month" id="month">
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
						<option value="4">4</option>
						<option value="5">5</option>
						<option value="6">6</option>
						<option value="7">7</option>
						<option value="8">8</option>
						<option value="9">9</option>
						<option value="10">10</option>
						<option value="11">11</option>
						<option value="12">12</option>
					</select> 월 <select name="day" id="day">
						<option value="1">1</option>
						<option value="2">2</option>
					</select> 일
					<%
						//회원 아이디에 대한 세션이 없을 경우
						if (session.getValue("id") == null) {
					%>

					<input type="button" value="ok"
						onclick="location.href='charterror' ">


					<%
				} else {
			%>

					<input type="submit" value="확인">
					<%
				}
			%>


				</form>

				</p>
			</div>
		</div>
		<div id="chart_div" style="width: auto; height: 500px;"></div>
	
		<br>
		<br>
	</div>
	</section>


	<!-- Footer-->
	<footer class="footer bg-blacks small text-center ">
	<div class="container">Copyright © Onsen Corp. All Rights
		Reserved.</div>
	</footer>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>





</body>
</html>
