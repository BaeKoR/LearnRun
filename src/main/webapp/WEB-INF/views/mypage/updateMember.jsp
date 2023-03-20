<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
MemberDto dto = (MemberDto)request.getAttribute("dto");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>내 정보 수정</h1>
<div align="center" style="background-color: white;">
<form action="updateMemberAf" method="post" id="regiFrm" enctype="multipart/form-data">
<input type="hidden" id="id" name="id" value="<%=login.getId()%>">

<table border="1">
<tr>
	<td>프로필 이미지</td>
	<td>
		<img alt="" src="upload/<%=dto.getNewfilename()%>" id="image" name="image">
	</td>
</tr>
<tr>
	<td>파일 변경</td>
	<td>
		<input type="hidden" id="filename" name="filename" value="<%=dto.getFilename()%>">
		<input type="hidden" id="newfilename" name="newfilename" value="<%=dto.getNewfilename()%>">
		<input type="file" id="fileload" name="fileload">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" id="pwd" size="20" value="<%=dto.getPwd()%>">
	</td>
</tr>
<tr>
	<td>패스워드확인</td>
	<td>
		<input type="text" id="pwdCheck" name="pwdCheck" size="20" value="<%=dto.getPwd()%>"><br>
		<p id="pwdCheckWrite" style="font-size: 8px"></p>	<!-- 비밀번호를 확인해주십시오 입력칸 -->
	</td>
</tr>
<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" id="name" size="20" value="<%=dto.getName()%>">
	</td>
</tr>
<tr>
	<td>전화번호</td>
	<td>
		<input type="text" name="phone" id="phone" size="20" value="<%=dto.getPhone()%>">
	</td>
</tr>
<tr>
	<td colspan="2" align="center">
		<input type="submit" value="수정">		
	</td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">
$(document).ready(function() {

// 비밀번호 확인
$("#pwdCheck").on('keyup', function() {
let pwd = $("#pwd").val();
let pwdCheck = $("#pwdCheck").val();

// 비밀번호 유효성 체크 - 정규식
let regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{3,10}$/;
if (!regex.test(pwd)) {
    $("#pwdCheckWrite").css("color", "#ff0000");
    $("#pwdCheckWrite").text("비밀번호는 영문자, 숫자, 특수문자를 혼합하여 3~10글자로 입력해주세요.");
    return;
}

// 비밀번호 확인 체크
if (pwd !== pwdCheck) {
    $("#pwdCheckWrite").css("color", "#ff0000");
    $("#pwdCheckWrite").text("비밀번호가 일치하지 않습니다.");
    return;
}

// 모든 조건을 만족하면
$("#pwdCheckWrite").text("");
});
	
// form submit취소 검사
$("#regiFrm").submit(function(event) {
	if ($("#pwd").val().trim() == "" || $("#name").val().trim() == "" || $("#phone").val().trim() == "") {
		alert("입력 필드를 모두 채워주세요.");
		event.preventDefault(); // submit 이벤트 취소
		
	} else if ($("#pwd").val() != $("#pwdCheck").val()) {
		alert("비밀번호가 다릅니다. 확인해주십시오");
		event.preventDefault(); // submit 이벤트 취소
	}
});
});

$('input[name="fileload"]').change(function(){
    setImageFromFile(this, '#image');
});

function setImageFromFile(input, expression) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
    	
		reader.onload = function (e) {
			$(expression).attr('src', e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
	}
}
</script>

</body>
</html>