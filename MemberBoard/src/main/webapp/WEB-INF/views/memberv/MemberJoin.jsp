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
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	function idCheck(){
		var inputID = $("#mid").val();		
		
		$.ajax({
			type : "post",
			url : "idCheck",
			data : {"mid" : inputID},
			dataType : "text",
			success : function(result){
				if(result=="OK"){
					IDspan.style.color = "blue";
					IDspan.innerHTML = "사용 가능"	;	
				} else {
					IDspan.style.color = "red";
					IDspan.innerHTML = "이미 사용중";
				}
					
			},
			error : function(){
				arlert("ajax 실패!");
			}
		})
		
	}
	
	function psdbCheck(){
		var inputPS = document.getElementById("mps").value;
		var dbPS = document.getElementById("mpsch").value;
		
		if(inputPS==dbPS){
			PSDBspan.style.color = "blue";
			PSDBspan.innerHTML = "일치"
		} else {
			PSDBspan.style.color = "red";
			PSDBspan.innerHTML = "불일치"
		}
		
		
	}
	
	
	function psCheck(){
		var inputPS = $("#mps").val();
		var exp = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
		 if (inputPS.match(exp)) {
			 PSspan.style.color = "blue";
			 document.getElementById("PSspan").innerHTML = "비밀번호 형식 맞음";
         }
         else {
        	 PSspan.style.color = "red";
        	 document.getElementById("PSspan").innerHTML = "비밀번호 형식 틀림";
		}
	}
	
	function phCheck(){
		var inputPH = $("#mphone").val();
		var exp = /^\d{3}-\d{3,4}-\d{4}$/;
		if(inputPH.match(exp)){
			PHspan.style.color = "blue";
			PHspan.innerHTML = "형식 맞음";
		}
		else {
			PHspan.style.color = "red";
			PHspan.innerHTML = "형식 틀림";
		}
		
	}
	//다음 주소 api
	function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다. 
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();

        function Sign() {
            console.log("버튼누름")
            var id = parseInt(document.getElementById("mid").value);
            var ps = parseInt(document.getElementById("mps").value);
            var postcode = parseInt(document.getElementById("sample6_postcode").value);
            var name = parseInt(document.getElementById("mname").value);
            var email = parseInt(document.getElementById("memail").value);
            var phone = parseInt(document.getElementById("mphone").value);
            
            if(id.length==0) {
                alert('아이디는 필수 입력 항목입니다.')
            } else if(ps.length==0) {
                alert('비밀번호는 필수 입력 항목입니다.')
            } else if(postcode.length==0){
            alert('주소는 필수 입력 항목입니다.')
            } else if(name.length==0){
                alert('이름은 필수 입력 항목입니다.')
            } else if(email.length==0){
                alert('E메일은 필수 입력 항목입니다.')
            } else if(phone.length==0){
                alert('전화번호는 필수 입력 항목입니다.')
            }

        }
    }

</script>

</head>
<body>
	<h2>MemberJoinPage</h2>
	
	<form action="memberjoin" method="post" enctype="multipart/form-data">
	
	<c:choose>	
		<c:when test="${kakaoID ne null}">
			카카오 아이디 : ${kakaoID}<br><br>
			ID<br>  <input type="text" name="mid" id="mid" onkeyup="idCheck()">
				<input type="hidden" name="kakaoID" value="${kakaoID}"><br>
				<span id="IDspan"></span><br>
		</c:when>
		<c:when test="${naverID ne null}">
			네이버 아이디 : ${naverID}<br><br>
			ID<br>  <input type="text" name="mid" id="mid" onkeyup="idCheck()">
			<input type="hidden" name="naverID" value="${naverID}"><br>
				<span id="IDspan"></span><br>
		</c:when>
		<c:otherwise>
			ID<br>  <input type="text" name="mid" id="mid" onkeyup="idCheck()"><br>
				<span id="IDspan"></span><br>
		</c:otherwise>
	</c:choose>
	
	PS<br> <input type="password" name="mps" id="mps" onkeyup="psCheck()"><br>
	<span id="PSspan"></span><br>
	PS확인<br> <input type="password" name="mpsch" id="mpsch"> <input type="button" onclick="psdbCheck()" value="비밀번호 확인"></button><br>
	<span id="PSDBspan"></span><br>
	이름<br> <input type="text" name="mname" id="mname"><br><br>
	생년월일<br> <input type="date" name="mbirth" id="mbirth"><br><br>
	이메일<br> <input type="text" name="memail" id="memail"><br><br>
	
	주소<br>
    <input type="text" id="sample6_postcode" placeholder="우편번호">
    <input type="button" id="adButton" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    <br>
    <input type="text" name="maddress" id="sample6_address" placeholder="주소"><br><br>
    <input type="text" name="maddress1" id="sample6_extraAddress" placeholder="참고항목"><br><br>
    <input type="text" name="maddress2" id="sample6_detailAddress" placeholder="상세주소">
    <br><br>
	
	휴대폰<br> <input type="text" name="mphone" id="mphone" onkeyup="phCheck()"><br>
	<span id="PHspan"></span><br>
	프사<br> <input type="file" name="mfile" id="mfile"><br><br><br>
	
	 <input type="submit" value="회원가입">
	</form>
</body>
</html>