<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./jsp_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인화면</title>
</head>
<body>
	<div align="center" class="body">
		<H2>로그인성공</H2>
		
		<br>환영합니다,${ loginUser.name } 님!<br>
		<br>테스트,${loginUser.id }님!<br>
		<br>
		<br><a href="edit?userId=${loginUser.id}">[회원정보수정]</a> 

	</div>
</body>
</html>