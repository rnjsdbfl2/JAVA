<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
	text-align : center;
	display:table;
	margin-left : auto;
	margin-right : auto;
	}
	#boardlist {
	border : 1px black solid;
	border-collapse : collapse;
	text-align : center;	
	}
</style>

<script>
	// 로그아웃
	function memberlogout(){
		location.href="memberlogout";
	}	
	//페이징
	function boardListPaging() {
		location.href = 'boardlistpaging';
	}
</script>
</head>
<body>
	<h2>MainPage</h2>
	<h3><a href="gomypage">${sessionScope.loginID}</a>님 환영합니다.</h3>			
	<button onclick="memberlogout()">로그아웃</button>
	<!-- admin 한정기능 -->
	<c:if test="${sessionScope.loginID eq 'admin'}">
		<a href="memberlist">회원목록 조회</a>
	</c:if>
	<br><br>
	<!-- admin 끝 -->
	
	<!-- 글목록 출력 -->
	<table id="boardlist">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="boardList" items="${boardList}">
				<tr>
					<td>${boardList.bnumber}</td>
					<td>${boardList.bwriter}</td>					
					<td><a href="boardview?bnumber=${boardList.bnumber}">${boardList.btitle}</a></td>
					<td>${boardList.bhits}</td>
				</tr>
				<br>
			</c:forEach>
		</tbody>
	</table>
	<!-- 글 목록 끝 -->
		<button onclick="location.href='boardwriteform'">글쓰기</button><br><br>
		<button onclick="boardListPaging()">페이징글목록</button>
	
</body>
</html>