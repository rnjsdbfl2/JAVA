<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<script>
	function memberupdate(){
		location.href="memberupdate";
	}
	function goMain(){
		location.href="boardlist";
	}
</script>
<meta charset="UTF-8">

</head>
<body>
	<h2>${sessionScope.loginID}님의 Page</h2>
	
	<button onclick="memberupdate()">정보수정</button><br><br>
	<!-- 내가 쓴 글 목록 -->
	<table border="1" style="border-collapse:collapse">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="myList" items="${myList}">
				<tr>
					<td>${myList.bnumber}</td>
					<td>${myList.bwriter}</td>					
					<td><a href="boardview?bnumber=${myList.bnumber}">${myList.btitle}</a></td>
					<td>${myList.bhits}</td>
				</tr>
				<br>
			</c:forEach>
		</tbody>
	</table>
	
	<button onclick=goMain()>메인 페이지</button>
	<!-- 내가 쓴 글 목록 끝 -->
	function goMain(){
		location.href="boardlist";
	}
	<button onclick=goMain()>메인 페이지</button>
	
	
	
	
</body>
</html>