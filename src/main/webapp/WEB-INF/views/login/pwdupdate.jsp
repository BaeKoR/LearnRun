<%@page import="com.semi.learn.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
  // String mailkey = request.getParameter("mail_key"); // mailkey 값을 가져옴  
 // MemberDto dto = (MemberDto)request.getAttribute("dto");
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
.find_form{	
	
	width: 450px;
	height: 600px;
	margin-top: 100px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) !important;   
	background-color: white;
	padding: 30px;
	border-radius: 10px;
 
}
button{
	width: 100%;
}

</style>

</head>
<body>
<section class="vh-100" style="background-color: #F8EEE1 ;">
<div align="center" class="find_form" >
<h3>비밀번호 재설정</h3>
<br>
<p>새로운 비밀번호를 입력해주세요.</p>
<br><br>
<input type="text" id="pwd" size="30" class="form-control email-input" placeholder="비밀번호">
<br><br>
<input type="text" id="pwdCheck" size="30" class="form-control email-input" placeholder="비밀번호 확인">
<br><br>
<p id="pwdCheckWrite"></p>
<button type="button" id="pwdUpdateBtn" class="btn btn-dark btn-lg btn-block">변경하기</button>
<br><br>
<a href="login" style="text-decoration: underline !important;">로그인하기</a>		<!-- 로그인페이지 이동 -->

</div>
</section>
<script type="text/javascript">


$(document).ready(function () {
	
	// 주소 파라미터로 넘어온 값
	let params = new URLSearchParams(window.location.search);
	let email = params.get('email');
	let mail_key = params.get('mail_key');
	
	// console.log(mail_key);
	
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
	    
	 		    
	    // mail인증번호가 일치하는지 확인     
	   
		$.ajax({
			type:"get",
			url:"getMember",
			data:{"email":email},
			success:function(mem){
				// alert(mem.mail_key);
				// console.log(mem);
				if(mem.mail_key != mail_key){
					alert("잘못된 접근입니다");
				}else if(mem.pwd == pwd){
					alert("이전에 사용한 비밀번호로 설정할 수 없습니다");
					$("#pwd").val("");			// 값 비워주기
					$("#pwdCheck").val("");
				}
				else{		// 일치하면 비밀번호 update
					$.ajax({
						type:"post",
						url:"pwdUpdateAf",
						data:{ "pwd":$("#pwd").val(), "email":email, "mail_key":mail_key},
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
					});
				}
		},
		error:function(){
			alert("error");
		}
	});
	    
	
	});

	
});




</script>

</body>
</html>