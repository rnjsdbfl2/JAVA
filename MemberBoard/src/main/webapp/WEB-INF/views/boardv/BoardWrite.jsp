<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardWritePage</title>/title>
<style>
	body{text-align : center;}
</style>
</head>
<body>
	<h2>Board Write Page</h2>
	<form action="boardwrite" method="post" enctype="multipart/form-data">
		제목<br>
			<input type="text" name="btitle" id="btitle"><br>
		작성자<br>
			<input type="text" name="bwriter" id="bwriter" value="${sessionScope.loginID}" readonly><br>	
		내용<br>
			<textarea name="bcontents" name="bcontents" id="bcontents" rows="5"></textarea><br>
		첨부파일<br>
			<input type="file" name="bfile" id="bfile"><br>
			<input type="submit">
	</form>
	
	
</body>
</html>