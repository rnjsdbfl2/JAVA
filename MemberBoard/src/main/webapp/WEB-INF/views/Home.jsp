<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
<style>
	body {text-align : center;}

</style>
	
</head>
<body>

	<h1> Home </h1>
	
	<button onclick="location.href='memberloginform'">로그인</button>
	<button onclick="location.href='memberjoinform'">회원가입</button><br>
	<button onclick="location.href='goParser'">크롤링 페이지</button><br>
	<button onclick="location.href='addcolumn'">컬럼추가</button>
</body>
</html>
