<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="./jsp_header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�α���ȭ��</title>
</head>
<body>
	<div align="center" class="body">
		<H2>�α��μ���</H2>
		
		<br>ȯ���մϴ�,${ loginUser.name } ��!<br>
		<br>�׽�Ʈ,${loginUser.id }��!<br>
		<br>
		<br><a href="edit?userId=${loginUser.id}">[ȸ����������]</a> 

	</div>
</body>
</html>