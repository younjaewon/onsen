<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<%
	Object name  = session.getAttribute("name"); 
	Object id = session.getAttribute("id"); 
	session.setAttribute("id",id);
%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath() %>/resources/css/styles.css" rel="stylesheet" />

<title>Onsen : ${board.title}</title>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- 구글 icon -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<script type="text/javascript">
	function errCodeCheck(){
		var errCode = <%=request.getParameter("errCode")%>;
		if(errCode != null || errCode != ""){
			switch (errCode) {
			case 1:
				alert("댓글 내용이 없습니다!");
				break;
			case 2:
				alert("이미 추천하셨습니다!");
				break;
			case 3:
				alert("자기 글은 추천할 수 없습니다.!");
				break;
			case 4:
				alert("로그인하셔야 추천할 수 있습니다.!");
				break;
			}
		}		
	}
	
	function deleteReply(rno, bno){
		if(confirm("선택하신 댓글을 삭제하시겠습니까?")){
			location.href = "deleteReply.do?rno=" + rno + "&bno=" + bno;
		}		
	}
	
	function recommendReply(rno, bno){
		if(confirm("선택하신 댓글을 추천하시겠습니까?")){
			location.href = "recommendReply.do?rno=" + rno + "&bno=" + bno;	
		}		
	}
	
	function moveAction(where){
		switch (where) {
		case 1:
			if(confirm("글을 삭제하시겠습니까?")){
				location.href ="delete?bno=${board.bno}";
			}
			break;

		case 2:
			if(confirm("글을 수정하시겠습니까?")){
				location.href = "modify?bno=${board.bno}";
			}
			break;
			
		case 3:
			location.href = "list.do";			
			break;
			
		case 4:
			if(confirm("글을 추천하시겠습니까?")){
				location.href = "recommend.do?bno=${board.bno}";
			}
			break;
		}
	}
</script>

<style>
.d {text-decoration: underline;}
.font_underline { color: #64a19d;}

.dd{border:5px;}
</style>
</head>
<body class="bg-light" onload="errCodeCheck()">
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
        <br><br><br><br><br><br><br><br>

<section class="mt-2">
		<div class="container">

			<table class="table table-borderless">
				<tr class="tcenter " bgcolor="#64a19d">
					<th colspan="4">
						<h4 class="#"><b><font color="white">FAQ 공지사항</font></b></h4>
					</th>
				</tr>
				<tr class="tcenter border-bottom">
					<th>
						<h6 class="#">작성자</h6>
					</th>
					<td class="text-left">
						<span>${board.writerId}</span>
					</td>
				</tr>
				<tr class="tcenter border-bottom">
					<th class="">
						<span>첨부파일</span>
					</th>
					<td colspan="4" align="left">
						<c:forEach var="file" items="${fileList}">
							<a href="filedown.do?fileName=${file.ofilename}" class="fileview">
								<%-- <img id="blah" src="<c:url value="/resources/uploadfile/${file.ofilename}"/>"  style="width: 50px; height: 50px;" /> --%>
								<font size="2px">${file.ofilename}</font> <font size="2px">(${file.filesize} byte)</font><br>
							</a>
						</c:forEach>
						<c:if test="${empty fileList}">
							<font color="#A6A6A6" size="2px"> 첨부된 파일이 없습니다. </font>
						</c:if>
					</td>
				</tr>
				<tr class="text-left">
					<th colspan="4">
						<span class="" style="font-size: 1.5em">${board.title}</span>
					</th>
				</tr>
				<tr class="text-left">
					<td colspan="4">
						<span>${board.content}</span>
						<c:if test="${board.writerId != userId}">
							<div class="d-flex justify-content-end mt-5">
								
								<button type="button" class="btn btn-light mr-1" disabled="disabled">
									<i class="fas fa-eye"></i>&nbsp;조회수&nbsp;&nbsp;${board.viewcnt}
								</button>
							</div>
							<%-- 							<p class="tcenter">
								<a href="#" onclick="moveAction(4)">
									<i class="fas fa-thumbs-up"></i>&nbsp;좋아요 ${board.recommendcnt}
								</a>
								<span>
									<small class="text-primary">:${message}</small>
								</span>
							</p> --%>
						</c:if>
					</td>
				</tr>

				<tr class="text-right thead-light border-bottom">
					<td colspan="4">
						<span>
							<small class="text-muted font-weight-bold">${board.regDate}</small>
						</span>
					</td>
				</tr>
			</table>
		</div>
	</section>
	<section>
		<div class="container">
<!-- 			<table class="table table-bordered"> -->
<!-- 				<tr class="tcenter" bgcolor="#64a19d"> -->
<!-- 					<th colspan="2"><font color="white">댓글</font></th> -->
<!-- 				</tr> -->
<%-- 				<c:forEach var="comment" items="${replyList}"> --%>
<!-- 					<tr class="tcenter"> -->
<!-- 						<td class="font-weight-bold"> -->
<%-- 							<p>${comment.writerId} --%>
<%-- <%-- 								<c:if test="${comment.writerId == id}"> --%> 
<%-- <%-- 									<a href="#" onclick="deleteReply(${comment.rno}, ${comment.bno})"> --%> 
<!-- <!-- 										<span> --> 
<!-- <!-- 											<small class="text-danger">삭제</small> --> 
<!-- <!-- 										</span> --> 
<!-- <!-- 									</a> --> 
<%-- <%-- 								</c:if> --%> 
<!-- 							</p> -->
<!-- 						</td> -->
<!-- 						<td class="content" align="left"> -->
<%-- 							<span class="date">${comment.regDate}</span> --%>
<%-- 							<p class="text-break">${comment.content}</p> --%>
<%-- <%-- 							<c:if test="${comment.writerId != id}"> --%> 
<!-- <!-- 								<p class="tcenter"> --> 
<%-- <%-- 									<a href="#" onclick="recommendReply(${comment.rno}, ${comment.bno})"> --%> 
<%-- <%-- 										<small class="text-primary"><i class="fas fa-thumbs-up"></i>&nbsp;좋아요 ${comment.recommendcnt}</small> --%> 
<!-- <!-- 									</a> --> 
<!-- <!-- 									<span> -->
<%-- <%-- 										<small class="text-primary">:${message}</small> --%> 
<!-- <!-- 									</span> --> 
<!-- <!-- 								</p> --> 
<%-- <%-- 							</c:if> --%> 

<!-- 						</td> -->

<!-- 					</tr> -->
<%-- 				</c:forEach> --%>
<!-- 				<tr class="tcenter"> -->
<!-- 					<td class="writer"> -->
<!-- 						<strong>댓글 쓰기</strong> -->
<!-- 					</td> -->
<!-- 					<td class="content"> -->
<!-- 						<form action="writeReply.do" method="post"> -->
<%-- 							<input type="hidden" id="writer" name="writer" value="${userName}" /> --%>
<%-- 							<input type="hidden" id="writerId" name="writerId" value="${id}" /> --%>
<%-- 							<input type="hidden" id="bno" name="bno" value="${board.bno}" /> --%>
<!-- 							<div class="form-inline"> -->
<!-- 								<textarea id="content" name="content" rows="1" class="form-control rounded w-75"></textarea> -->
<!-- 								<input type="submit" value="확인" class="btn btn-secondary ml-2" /> -->
<!-- 							</div> -->
<!-- 						</form> -->
<!-- 					</td> -->
<!-- 				</tr> -->
<!-- 			</table> -->

			<br />
			<div class="row justify-content-center">
				<c:choose>
					<c:when test="${board.writerId == id}">
						<input type="button" value="삭제" class="btn btn-outline-secondary" onclick="moveAction(1)" />
						<input type="button" value="수정" class="btn btn-outline-secondary mx-1" onclick="moveAction(2)" />
						<input type="button" value="목록" class="btn btn-outline-secondary" onclick="moveAction(3)" />
					</c:when>
					<c:otherwise>
						<input type="button" value="목록" class="btn btn-outline-secondary" onclick="moveAction(3)" />
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</section>
	  <br><br><br>

        <!-- Footer-->
        <footer class="footer bg-blacks small text-center "><div class="container">Copyright © Onsen Corp. All Rights Reserved.</div></footer>
        
	
</body>
</html>