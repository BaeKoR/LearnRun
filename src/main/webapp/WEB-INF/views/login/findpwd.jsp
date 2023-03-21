<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- <link href="/css/sy.css" rel="stylesheet"> -->

<style type="text/css">


.find_form{	
	
	width: 450px;
	height: 600px;
	margin-top: 100px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) ;   
	background-color: white;
	padding: 30px;
	border-radius: 10px !important;
 
}

pre{
	font-size: 15px;
}

button{
	width: 100%;
}

a{
	text-decoration: underline;
}
</style>


</head>
<body>


<section class="vh-100" style="background-color: #F8EEE1 ;">

<div>
<form class="find_form">


<h3><b>비밀번호 찾기</b></h3>
<br>
<div>
<p>
가입하신 이메일 주소를 입력해 주세요. <br>
이메일 주소로 비밀번호를 재설정할 수 있는 <br>
이메일을 보내드립니다.
</p>

<br>
</div>

<div class="form-outline col-xs-10" >
	<input type="text"  id="email" class="form-control email-input" placeholder="이메일">
</div>

<br><br>
<button type="button" class="btn btn-dark btn-lg btn-block" id="mailSendbtn">전송하기</button>
<br><br>
<a href="login" style="text-decoration: underline !important;">로그인하기</a>



</form>
</div>
</section>
<script type="text/javascript">

$(document).ready(function () {
/* 	$("#emailauthNum").hide();
	$("#authNumBtn").hide(); */
	
	$("#mailSendbtn").click(function () {
		// email 빈칸조사
		if ($("#email").val().trim() == "") {
		        alert("이메일을 입력해주세요.");
		        return;
		    }
		
		// 가입된 이메일인지 확인
		$.ajax({
			type:"get",
			url:"emailCheck",
			data:{ "email":$("#email").val()},
			success:function(dto){					
				
				if(dto.email == null){
					alert('가입되지 않은 이메일입니다. 이메일주소를 확인해주십시오');
				}
				
				else{		// 가입된 이메일일때만 인증번호 발송					
					// $("#emailauthNum").show();
					// $("#authNumBtn").show();
					
					let name = dto.name;
					let id = dto.id;
					// alert(id);
					
					// 인증번호 메일전송
					$.ajax({
						type:"get",
						url:"pwdResetEmail",		// 패스워드 재설정 이메일 보내는곳으로 바꿈
						data:{ "email":$("#email").val(), "name":name, "id":id},	// id같이 보내줘서 메일키 업데이트
						success:function(mailkey){							
							// alert(mailkey);
							alert('비밀번호 재설정 메일이 발송되었습니다');
							
						},
						error:function(){
							alert('이메일을 입력해주십시오');
						}
					});
					
					
				}							
			},
			error:function(){
				alert('error');
			}
		});
		
	});
	
	
});

</script>

</body>
</html>