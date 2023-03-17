<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  String mailkey = request.getParameter("mail_key"); // mailkey 값을 가져옴
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>

<div align="center" style="background-color: white;">
<h3>비밀번호 재설정</h3>
<p>새로운 비밀번호를 입력해주세요.</p>
<br><br>
<input type="text" id="pwd" size="30" placeholder="비밀번호">
<br><br>
<input type="text" id="pwdCheck" size="30" placeholder="비밀번호 확인">
<br><br>
<p id="pwdCheckWrite"></p>
<button type="button" id="pwdUpdateBtn">변경하기</button>
<br><br>
<a href="login">로그인하기</a>		<!-- 로그인페이지 이동 -->

</div>

<script type="text/javascript">

$(document).ready(function () {
	
	let params = new URLSearchParams(window.location.search);
	let email = params.get('email');

	//console.log(mailkey);
	
	$("#pwdUpdateBtn").click(function () {
		
		// 비밀번호 확인		
		
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
	
		
		$.ajax({
			type:"post",
			url:"pwdUpdateAf",
			data:{ "pwd":$("#pwd").val(), "email":email},
			success:function(msg){
				
				if(msg == "UPDATE_OK"){
					alert("비밀번호가 재설정되었습니다. 로그인해 주십시오")
					location.href = "login";
				}else{
					alert("비밀번호가 수정되지않았습니다");
				}
				
			},
			error:function(){
				alert("error");
			}
		})
	});

	
});




</script>

</body>
</html>