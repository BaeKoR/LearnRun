<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
MemberDto dto = (MemberDto)request.getAttribute("dto");
%>
<style>
h3 {
	text-align: left;
	margin-left: 205px;
	margin-bottom: 30px;
	font-weight: 600;
    font-size: 28px;
}
#update-container section {
	margin: 40px 0;
}

.profile-box {
    width: 100px;
    height: 100px; 
    border-radius: 70%;
    overflow: hidden;
    display: inline-block;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
.file-box {
	display: inline-block; vertical-align: super; padding-left: 20px;
}
.file-box div {
	text-align: left; margin-bottom: 15px; font-size: 20px; font-weight: 600;
}
.file-box input {
	width: 325px;
}
#update-container table {
	width: 450px;
}
#update-container td {
	padding-bottom: 30px;
}
</style>

<div id="update-container" align="center">
	<h3>내 정보 수정</h3>
	<form action="updateMemberAf" method="post" id="regiFrm" enctype="multipart/form-data">
		<input type="hidden" id="id" name="id" value="<%=login.getId()%>">
		
		<section>
			<div class="profile-box">
				<img class="profile" alt="프로필 사진" src="upload/<%=dto.getNewfilename()%>" name="image" />
			</div>
			<div class="file-box">
				<div><%=login.getId()%></div>
				<input type="hidden" id="filename" name="filename" value="<%=dto.getFilename()%>">
				<input type="hidden" id="newfilename" name="newfilename" value="<%=dto.getNewfilename()%>">
				<input type="file" id="fileload" name="fileload" class="form-control form-control-sm">
			</div>
		</section>
		
		<table>
			<tr>
				<td>
					<label for="name">이름</label>
					<input type="text" name="name" id="name" class="form-control" value="<%=dto.getName()%>">
				</td>
			</tr>
			<tr>
				<td>
					<label for="phone">전화번호</label>
					<input type="text" name="phone" id="phone" class="form-control" value="<%=dto.getPhone()%>" placeholder="숫자만 입력">
				</td>
			</tr>
			<tr>
				<td>
					<label for="pwd">비밀번호</label>
					<input type="password" name="pwd" id="pwd" class="form-control" value="<%=dto.getPwd()%>">
				</td>
			</tr>
			<tr>
				<td>
					<label for="pwdCheck">비밀번호 확인</label>
					<input type="password" id="pwdCheck" name="pwdCheck" class="form-control" value="<%=dto.getPwd()%>"><br>
					<p id="pwdCheckWrite" style="font-size: 8px"></p>	<!-- 비밀번호를 확인해주십시오 입력칸 -->
				</td>
			</tr>
			<tr>
				<td align="center">
					<input type="submit" value="수정" class="btn btn-dark" style="width:450px; background-color: #3f3e3d;">		
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
    setImageFromFile(this, '.profile');
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
