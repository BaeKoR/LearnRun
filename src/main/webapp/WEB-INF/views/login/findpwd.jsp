<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  .email-input {
    width: 400px;		/* email-input 사이즈 조정 */
  }
</style>


</head>
<body>

<section class="vh-100" style="background-color: #F8EEE1;">
<div class="container py-5 h-100">
		<div class="row d-flex justify-content-center align-items-center h-100">
			<div class="col col-xl-10">
				<div class="card" style="border-radius: 1rem;">
					<div class="row g-0">



<div align="center" style="background-color: white;" class="container">
<h3>비밀번호 찾기</h3>

<div>
<pre>
가입하신 이메일 주소를 입력해 주세요.<br>
이메일 주소로 비밀번호를 재설정할 수 있는 이메일을 보내드립니다.
</pre>
</div>

<div class="form-outline col-xs-10" >
	<input type="text"  id="email" class="form-control email-input" placeholder="이메일">
</div>

<br><br>
<button type="button" id="mailSendbtn">전송하기</button>
<br><br>
<a href="login">로그인하기</a>

</div>

						</div>
						</div>
					</div>
				</div>
			</div>
		

</section>

<script type="text/javascript">

$(document).ready(function () {
/* 	$("#emailauthNum").hide();
	$("#authNumBtn").hide(); */
	
	$("#mailSendbtn").click(function () {
		// 가입된 이메일인지 확인
		$.ajax({
			type:"get",
			url:"emailCheck",
			data:{ "email":$("#email").val()},
			success:function(msg){					
				// alert(msg);
				if(msg == "NO"){	// 가입되지 않은 이메일
					alert('가입되지 않은 이메일입니다. 이메일주소를 확인해주십시오');
				}
				else{		// 가입된 이메일일때만 인증번호 발송					
					// $("#emailauthNum").show();
					// $("#authNumBtn").show();
					
					// 인증번호 메일전송
					$.ajax({
						type:"get",
						url:"pwdResetEmail",		// 패스워드 재설정 이메일 보내는곳으로 바꿈
						data:{ "email":$("#email").val()},
						success:function(mailkey){					
							// alert(mailkey);
							alert('비밀번호 재설정 메일이 발송되었습니다');			
							
							/* $("#authNumBtn").on('click', function () {
								if($("#emailauthNum").val() == mailkey){									
									location.href="pwdUpdate?email="+ $("#email").val();		// 인증완료
								}else{
									alert('인증번호를 확인해주십시오');
									$("#emailauthNum").val("");									
								}
							}); */
							
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
	
	// 비밀번호 업데이트 페이지 이동
	
	
	
	
	
	
});

</script>

</body>
</html>