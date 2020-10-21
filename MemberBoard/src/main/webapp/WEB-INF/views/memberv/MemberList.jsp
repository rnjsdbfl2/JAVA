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
	function memberview(mid){
		
		$.ajax({
			type : "post",
			url : "memberview",
			data : {"mid" : mid},
			dataType : "json",
			success : function(result){
				
				var output = "<table border='1'";
				output += "<tr><th>ID</th> <th>PASSWORD</th> <th>NAME</th>";
				output += "<th>PHONE</th> <th>EMAIL</th> <th>BIRTH</th></tr>";
				output += "<tr>";
				output += "<td>"+result.mid+"</td>";
				output += "<td>"+result.mps+"</td>";
				output += "<td>"+result.mname+"</td>";
				output += "<td>"+result.mphone+"</td>";
				output += "<td>"+result.memail+"</td>";
				output += "<td>"+result.mbirth+"</td>";
				output += "</tr>";
				output += "</table>";
			
				$("#memberviewdiv").html(output);
			},
			error : function(){
				alert("통신 실패");
			}			
		});
	}	
</script>
</head>
<body>
	<h2>MemberListPage</h2>
	<!-- thead, tbody는 테이블의 헤더/바디 div의 테이블판이라 생각 -->
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>상세 조회</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="member" items="${memberList}">
				<tr>
					<td>${member.mid}</td>
					<td>${member.mname}</td>
					<td><button onclick="memberview('${member.mid}')">조회(ajax)</button></td>
					<td><a href="memberdelete?mid=${member.mid}">삭제</a></td>
				</tr>
				<br>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<div id="memberviewdiv">
	
	</div>	
		
</body>
</html>