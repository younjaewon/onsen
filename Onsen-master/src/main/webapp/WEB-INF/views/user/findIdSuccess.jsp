<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./jsp_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
</head>
<body>
	

	
<script>
alert("${findUser.name}님의 아이디는 ${findUser.id}입니다.");
location.href="login";
</script>

</body>
</html>