<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{text-align : center;}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<h2>Board Update Page</h2>
	
	<form action="boardmodify" method="post" enctype="multipart/form-data">
		
		글번호<br>
		<input type="text" name="bnumber" id="bnumber" value="${boardView.bnumber}" readonly><br><br>
		작성자<br>
		<input type="text" name="bwriter" id="bwriter" value="${boardView.bwriter}" readonly><br><br>
		글제목<br>
		<input type="text" name="btitle" id="btitle" value="${boardView.btitle}"><br><br>
		글내용<br>
		<textarea name="bcontents" name="bcontents" id="bcontents" rows="5"></textarea><br><br>
		작성일자<br>
		<input type="text" name="bdate" id="bdate" value="${boardView.bdate}" readonly><br><br>
		조회수<br>
		<input type="text" name="bhits" id="bhits" value="${boardView.bhits}" readonly><br><br>
		첨부파일<br>
		<input type="file" name="bfile" id="bfile" value="${boardView.bfile}"><br><br>
		<input type="submit" value="수정 완료">					
	</form>					
	
	
</body>
</html>