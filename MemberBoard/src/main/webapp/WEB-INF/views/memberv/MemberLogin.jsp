<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{text-align : center;}
</style>
</head>
<body>
	<h2>MemberLogin Page</h2>
	<form action="memberlogin" method="post">
		ID<br>
		<input type="text" name="mid"><br>
		PS<br>
		<input type="password" name="mps"><br>
		<input type="submit" value="로그인">
	</form>
	
	<a href="kakaologin">
		<img src="${pageContext.request.contextPath}/resources/img/kakao_login_medium_narrow.png"/>
	</a><br>
	<a href="naverlogin">
		<img src="${pageContext.request.contextPath}/resources/img/네이버 아이디로 로그인_축약형_White.png"/>	
	</a>
</body>
</html>