<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{text-align : center;}
</style>
<script>
	// 검색 함수
	function boardSearch() {
		searchform.submit();
	}
	// 메인 페이지가기
	function goMain(){
		location.href="boardlist";
	}
</script>
</head>
<body>
	<h2>BoardListPaging.jsp</h2>
	<!-- 검색 -->
	<form action="boardsearch" method="get" name="searchform">
		<select id="searchtype" name="searchtype">
			<option value="searchtitle">제목</option>
			<option value="searchwriter">작성자</option>
		</select>
		<input type="text" name="keyword" placeholder="검색어입력">
		<input type="button" onclick="boardSearch()" value="검색">
	</form>
	<!-- 검색 끝 -->
	
	<!-- 페이징 리스트 -->
		<table border="1">
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>글제목</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="board" items="${boardList}" >
			<tr>
				<td>${board.bnumber}</td>
				<td>${board.bwriter}</td>
				<td><a href="boardview?bnumber=${board.bnumber}&page=${paging.page}">${board.btitle}</a></td>
				<td>${board.bhits}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><button onclick="location.href='boardwriteform'">글쓰기</button> </td>
		</tr>
	</table>
	<!-- 리스트 끝 -->
	<!-- 페이징 처리 -->
	<c:if test="${paging.page<=1}">
	[이전]&nbsp;
	</c:if>
	
	<c:if test="${paging.page>1}">
		<a href="boardlistpaging?page=${paging.page-1}">[이전]</a>&nbsp;
	</c:if>
	
	<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
		<c:choose>
			<c:when test="${i eq paging.page}">
			${i}
			</c:when>
			<c:otherwise>
				<a href="boardlistpaging?page=${i}">${i}</a>
			</c:otherwise>
		</c:choose>
	</c:forEach>

	<c:if test="${paging.page>=paging.maxPage}">
		[다음]
	</c:if>
	
	<c:if test="${paging.page<paging.maxPage}">
		<a href="boardlistpaging?page=${paging.page+1}">[다음]</a>
	</c:if>
	
	<button onclick=goMain()>메인 페이지</button>
</body>
</html>