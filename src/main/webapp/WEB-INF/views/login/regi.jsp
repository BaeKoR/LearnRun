<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>



<style type="text/css">
.center{
	margin: auto;
	width: 60%;	
	padding: 10px;
}
</style>

</head>
<body>

<h2>회원가입</h2>
<p>환영합니다</p>

<div align="center" style="background-color: white;">

<form action="regiAf" method="post" id="regiFrm">
<!-- <form id="regiFrm"> -->

<table border="1">
<tr>
	<td>아이디</td>
	<td>
		<input type="text" name="id" id="id" size="20"><br>
		<p id="idcheck" style="font-size: 8px"></p>
		<input type="button" id="idChkBtn" value="아이디중복확인">
	</td>
</tr>
<tr>
	<td>패스워드</td>
	<td>
		<input type="text" name="pwd" id="pwd" size="20">
	</td>
</tr>
<tr>
	<td>패스워드확인</td>
	<td>
		<input type="text" id="pwdCheck" name="pwdCheck" size="20"><br>
		<p id="pwdCheckWrite" style="font-size: 8px"></p>	<!-- 비밀번호를 확인해주십시오 입력칸 -->
	</td>
</tr>

<tr>
	<td>이름</td>
	<td>
		<input type="text" name="name" id="name" size="20">
	</td>
</tr>
<tr>
	<td>이메일</td>
	<td>
		<input type="text" name="email" id="email" size="20">
		<button type="button" id="mailCheckBtn">인증</button><br>
		<input type="text" id="mailCertiNum" name="mailCertiNum" placeholder="인증번호를 입력하세요">
		<button type="button" id="mailKeyCheckBtn">인증번호확인</button><br>
		<p id="emailCheckWrite" style="font-size: 8px"></p>		<!-- 인증번호를 확인해주세요 -->
	</td>
</tr>

<tr>
	<td>전화번호</td>
	<td>
		<input type="text" name="phone" id="phone" size="20">
	</td>
</tr>
<tr>
	<td colspan="2">
		<input type="checkbox" id="TermAgree"> [필수]이용약관 및 개인정보 수집동의<br>
		<input type="checkbox" id="MarketingAgree"> [선택]마케팅정보 수집 활용동의
	</td>
</tr>

<tr>
	<td colspan="2" align="center">
		<input type="submit" value="회원가입">		
	</td>
</tr>
</table>

</form>

</div>

<script type="text/javascript">

$(document).ready(function() {
	
	
	$("#mailCertiNum").hide();
	$("#mailKeyCheckBtn").hide();
	
	let idCheck = false;		// id 중복검사 완료했는지 여부
	let emailVerified = false;	// 이메일 인증완료했는지 여부
	
	
	$("#idChkBtn").click(function() {
		
		  let id = $("#id").val().trim();
			
		    // id의 빈칸을 조사!
		    if (id == "") {
		        alert("아이디를 입력해주세요.");
		        return;
		    }

		    // id 영문자 숫자 섞어서 3~10자리 제한
		    if (id.length < 3 || id.length > 10) {
		        alert("아이디는 3~10글자로 입력해주세요.");
		        return;
		    }

		    let regex = /^[a-zA-Z0-9]+$/;
		    if (!regex.test(id)) {
		        alert("아이디는 영문자와 숫자만 사용할 수 있습니다.");
		        return;
		    }
		
		
		$.ajax({
			type:"post",
			url:"checkId",
			data:{ "id":$("#id").val() },
			success:function(msg){
				// alert('success');
				// alert(msg.trim());
				// alert(msg);
				
				if(msg == "NO"){
					$("#idcheck").css("color", "#0000ff");
					$("#idcheck").text("사용할 수 있는 아이디입니다");
					idCheck = true;		// 중복검사 완료
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("사용중인 아이디입니다");
					$("#id").val("");
					idCheck = false;
				}
			},
			error:function(){
				alert('error');
			}
		});
		
	});
	
	// 이메일 인증메일 발송
	$("#mailCheckBtn").click(function() {
		
		
		// 이메일 중복검사
		$.ajax({
			type:"get",
			url:"emailCheck",
			data:{ "email":$("#email").val()},
			success:function(msg){
				if(msg == "YES"){
					alert('이미 가입된 이메일입니다');
				}else{			// 가입되어있는 메일이 아닐때만
					// 인증번호 입력칸 보이기
					$("#mailCertiNum").show();
					$("#mailKeyCheckBtn").show();
					
					// 이메일 인증 발송
					$.ajax({
						type:"get",
						url:"emailSend",
						data:{ "email":$("#email").val(), "mail_key":$("mailCertiNum").val()},
						success:function(mailkey){					
							// alert(mailkey);
							alert('인증메일이 발송되었습니다');							
							
							$("#mailKeyCheckBtn").on('click', function () {
								if($("#mailCertiNum").val() == mailkey){
									$("#emailCheckWrite").text("인증되었습니다");
									emailVerified = true;		// 인증완료
								}else{
									$("#emailCheckWrite").text("인증번호를 확인해주십시오");
									$("#mailCertiNum").val("");
									emailVerified = false;
								}
							});
						},
						error:function(){
							alert('이메일을 입력해주십시오');
						}
					});
				}	// 가입안된 이메일일때 끝					
			}, //success 끝
				error:function(){
					alert("error");
				}			
		
		}); // 이메일중복 ajax 끝
		
});		
	
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
	
/* 
	$("#pwdCheck").on('keyup', function() {
		let pwd = $("#pwd").val();
//		let pwdCheck = $("#pwdCheck").val();
		
		// 다시 체크하기
		if (pwd.length < 6 || pwd.length > 10) { // 비밀번호 길이가 6~10글자가 아니면
		    $("#pwdCheckWrite").css("color", "#ff0000");
		    $("#pwdCheckWrite").text("비밀번호는 6~10글자로 입력해주세요.");
		    
		} else if (!/^[a-zA-Z0-9!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]+$/.test(pwd)) { // 특수문자를 포함하지 않으면
		    $("#pwdCheckWrite").css("color", "#ff0000");
		    $("#pwdCheckWrite").text("비밀번호는 영문자, 숫자, 특수문자를 혼합하여 입력해주세요.");
		} else if (pwd != pwdCheck) { // 비밀번호 확인과 일치하지 않으면
		    $("#pwdCheckWrite").css("color", "#ff0000");
		    $("#pwdCheckWrite").text("비밀번호가 일치하지 않습니다.");
		} else { // 모든 조건을 만족하면
		    $("#pwdCheckWrite").text("");
		}
				
	});
	 */
		
	// form submit취소 검사
	$("#regiFrm").submit(function(event) {
		if (!idCheck) { 				// id 중복검사가 완료되지 않은 경우
			alert("아이디 중복검사를 완료해주십시오.");
			event.preventDefault(); 	// submit 이벤트 취소
			
		} else if (!emailVerified){		// 이메일 인증이 완료되지 않은 경우	
			alert("이메일 인증을 완료해주십시오.");
			event.preventDefault();	// submit 이벤트 취소
			
			// 빈필드 검사
		}else if ($("#id").val().trim() == "" || $("#pwd").val().trim() == "" || 
				$("#name").val().trim() == "" || $("#email").val().trim() == "" || 
				$("#phone").val().trim() == "" || $("#mailCertiNum").val().trim() == "") {
			alert("입력 필드를 모두 채워주세요.");
			event.preventDefault(); // submit 이벤트 취소
			
		} else if ($("#pwd").val() != $("#pwdCheck").val()) {
			alert("비밀번호가 다릅니다. 확인해주십시오");
			event.preventDefault(); // submit 이벤트 취소
		}else if(!TermAgree.checked) {
	        alert("이용약관 및 개인정보 수집동의에 동의해야 합니다.");
	        event.preventDefault(); // submit 이벤트 취소
		}
		
	});
	
});
	
</script>


</body>
</html>





