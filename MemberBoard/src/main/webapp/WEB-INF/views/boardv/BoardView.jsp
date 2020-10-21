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
<script>
	function goMain(){
		location.href="boardlist";
	}
	$(document).ready(function(){
		$("#commentWriteBtn").click(function(){
			var cwriter = $("#cwriter").val();
			var ccontents = $("#ccontents").val();
			var cbnumber = "${boardView.bnumber}";
			$.ajax({
				type : "post",
				url : "comment/commentwrite",
				data : {
						"cwriter" : cwriter,
						"ccontents" : ccontents,
						"cbnumber" : cbnumber},
				dataType : "json",
				success : function(result){
					console.log("댓글 등록 성공");
					console.log(result);
					var output = "<table border='1'>";
					output += "<tr><th>작성자</th>";
					output += "<th>내용</th></tr>";
					for(var i in result){
						output += "<tr>";
						output += "<td>"+result[i].cwriter+"</td>";
						output += "<td>"+result[i].ccontents+"</td>";
						output += "</tr>";
					}
					output += "</table>";
					$("#commentArea").html(output);
					$("#ccontents").val("");
				},
				error : function(){
					console.log("댓글 등록 실패");
				}
			});
		});
	});
</script>
</head>
<body>
	<h2>BoardViewPage</h2>
	<!-- 상세보기  -->		
		<table border="1" style="border-collapse:collapse">
		<thead>
			<tr>
				<th>글번호</th>
				<th>작성자</th>
				<th>글제목</th>
				<th>글내용</th>
				<th>작성일자</th>
				<th>조회수</th>
				<th>첨부파일</th>
				</tr>
		</thead>
		
		<tbody>
				<tr>
					<td>${boardView.bnumber}</td>					
					<td>${boardView.bwriter}</td>
					<td>${boardView.btitle}</td>
					<td>${boardView.bcontents}</td>
					<td>${boardView.bdate}</td>
					<td>${boardView.bhits}</td>
					<td>${boardView.bfilename}</td>
				</tr>			
		</tbody>		
	</table><br>
	<!-- 본인 한정기능 -->
	<c:choose>	
		<c:when test="${sessionScope.loginID eq boardView.bwriter}">
			<button onclick="location.href='boardupdate?bnumber=${boardView.bnumber}'">수정</button>
			<button onclick="location.href='boarddelete?bnumber=${boardView.bnumber}'">삭제</button>
		</c:when>
		
		<c:when test="${sessionScope.loginID eq 'admin'}">
			<button onclick="location.href='boarddelete?bnumber=${boardView.bnumber}'">삭제</button>
		</c:when>
	</c:choose>	
	<!-- 한정기능 끝 -->
	<br><br>
	<!-- 댓글 기능 -->
	<!-- 작성 -->
	<div id="commentWrite">
		작성자 : <input type="text" id="cwriter" value="${sessionScope.loginID}" readonly><br>
		내용 : <input type="text" id="ccontents"><br>
		<button id="commentWriteBtn">댓글입력</button>
	</div>
	<!-- 작성 끝 -->
	<!-- 작성 목록 -->
	<div id="commentArea">
		<table border="1">
			<tr><th>작성자</th>
				<th>내용</th></tr>
			<c:forEach var="comment" items="${commentList}">
				<tr>
					<td>${comment.cwriter}</td>
					<td>${comment.ccontents}</td></tr>
			</c:forEach>
		</table>
	<!-- 목록 끝 -->
	</div>
	<!-- 댓글~ -->
	<button onclick=goMain()>메인 페이지</button>
</body>
</html>