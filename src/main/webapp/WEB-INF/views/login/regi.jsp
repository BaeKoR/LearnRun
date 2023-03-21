<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>



<style type="text/css">
/* 
.center{
	margin: auto;
	width: 60%;	
	padding: 10px;
}
 */
.box{

/* position: absolute;  */
width: 650px;
height: 600px;
left: calc(50% - 487px/2 - 0.5px);
top: calc(50% - 579px/2 - 0.5px);


margin: auto;
margin-bottom: 30px;
padding: 50px;

font-size: 13px;
align-content: center;
justify-content: center;
font-family: 'Work Sans'; 

}

.regi_form{	
	
	width: 550px;
	height: 750px;
	margin-top: 100px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) ;   
	background-color: white;
	padding: 20px !important;
	
 
}


 p{    
    font-family: 'Spoqa Han Sans Neo','Apple SD Gothic Neo',Segoe UI,sans-serif,Apple Color Emoji,Segoe UI Emoji;
    line-height: 1.5;
    letter-spacing: -0.03rem;
    word-wrap: break-word;
    word-break: keep-all;
    margin: 0;
    flex-basis: 100%;
    font-size: .8rem;
    margin-top: .8rem;
    color: #ed2040;
    animation: fade-in .3s ease-in-out forwards;
    display: block;
    
}

/* 
button{box-sizing:border-box;
padding:0;
border:0 none;
background:transparent;
cursor:pointer;
font-family:'Spoqa Han Sans Neo','Apple SD Gothic Neo',Segoe UI,sans-serif,Apple Color Emoji,Segoe UI Emoji;
line-height:1.5;
letter-spacing:-0.03rem;
vertical-align:baseline;margin:0;border-radius:0;font-size:100%;line-height:inherit;
} */

.input-group {
  display: flex;
  justify-content: flex-start;
}

.input__trigger {
  margin-right: 10px;
  text-align: left;
}

input[type="submit"]{

 	width: 100%;
 	margin-bottom: 30px;
}
 .regi_form{	
	
	width: 600px;
	height: 720px;
	margin-top: 100px;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) !important;   
	background-color: white;
	padding: 20px !important;
	border-radius: 10px;
 
} 
span{
	color: graytext;
	font-size: 15px;
}
</style>

</head>
<body>

<section class="vh-100" style="background-color: #F8EEE1 ;">
<form action="regiAf" method="post" id="regiFrm" class="regi_form">		<!-- form -->
<div style="margin: 40px">




<h3><b>회원가입</b></h3>
<br><br>
<!-- <form id="regiFrm"> -->

<div  class="input-group">
	<div class="input__trigger label invalid">
		<input id="id" name="id" class="form-control email-input" type="text" minlength="2" 
		autocomplete="autocomplete"  placeholder="아이디">
		<p class="auth-block__invalid" id="idcheck"></p>
</div>

<div style="width: 200px; text-align: right;">
<button type="button" id="idChkBtn" class="btn btn-dark"  >아이디중복 확인</button>
</div>
</div>

<!-- 비밀번호 -->
<div class="input-group">
	<div class="input__trigger label invalid">
		<input type="text" name="pwd" id="pwd" class="form-control email-input"   placeholder="패스워드">
		<!-- <p id="pwdValid"></p> -->
	</div>
	<div style="text-align: right;">
		<input type="text" id="pwdCheck" name="pwdCheck"  class="form-control email-input" placeholder="패스워드 확인">
		<!-- <p id="pwdCheckWrite" ></p>	 -->		<!-- 비밀번호를 확인해주십시오 입력칸 -->
	</div>
	<div style="text-align: left;">
		<p id="pwdValid"></p>
	</div>
	<div>
		<p id="pwdCheckWrite" >		
	</div>	
</div>
<br>		

<!-- 이메일인증 -->
<div  class="input-group">
	<div class="input__trigger label invalid">
		<input type="text" name="email" id="email" size="20" class="form-control email-input" placeholder="이메일">
	</div>
	
	<div style="width: 200px; text-align: right;">
		<button type="button" id="mailCheckBtn" class="btn btn-dark">인증</button><br>
	</div>
</div>	
<br>
<!-- 인증번호 확인 뜨는곳 -->
<div  class="input-group">
<div class="input__trigger label invalid">
	<input type="text" id="mailCertiNum" name="mail_key"  class="form-control email-input"  placeholder="인증번호를 입력하세요">
	</div>
	<div style="width: 200px; text-align: right;">
		<button type="button" id="mailKeyCheckBtn" class="btn btn-dark">확인</button><br>
	</div>
	
	<p id="emailCheckWrite" class="auth-block__invalid" ></p>		<!-- 인증번호를 확인해주세요 -->
	
</div>	
<input type="text" name="name" id="name" size="20" class="form-control email-input" placeholder="이름">
<br>		
<input type="text" name="phone" id="phone" size="20" class="form-control email-input" placeholder="전화번호">
<br>
<div align="left" style="font: #c5c5c5">
<input type="checkbox" id="TermAgree" class="form-check-input"> <span>[필수]이용약관 및 개인정보 수집동의</span><br>
<input type="checkbox" id="MarketingAgree" class="form-check-input"><span> [선택]마케팅정보 수집 활용동의</span>
</div>
<br><br>

	<input type="submit" class="btn btn-dark btn-lg btn-block" value="회원가입">				
</div>


</form>


</section>
<script type="text/javascript">

$(document).ready(function() {
	
	
	$("#mailCertiNum").hide();
	$("#mailKeyCheckBtn").hide();
	
	var idCheck = false;		// id 중복검사 완료했는지 여부
	var emailVerified = false;	// 이메일 인증완료했는지 여부
	
	
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
					return;
				}else{
					$("#idcheck").css("color", "#ff0000");
					$("#idcheck").text("사용중인 아이디입니다");
					$("#id").val("");
					idCheck = false;
					return;
				}
				
			},
			error:function(){
				alert('error');
			}
		});
		
	});
	
	
	
	// 이메일 인증메일 발송
	$("#mailCheckBtn").click(function() {		
		
		// 이메일 빈칸조사
		let email = $("#email").val().trim();
		
		if(email == ""){
			alert('이메일을 입력하세요');
			return;
		}
		
		// 이메일 유효성 검사
		let re = /\S+@\S+\.\S+/;
	    if(!re.test(email)){
	    	alert('올바른 이메일 주소를 입력하세요');
	    	return;
	    }
		
		// 이메일 중복검사
		$.ajax({
			type:"get",
			url:"emailCheck",
			data:{ "email":$("#email").val()},
			success:function(dto){
				if(dto.email != null){
					alert('이미 가입된 이메일입니다');		// emailcheck 방식 변경
				}else{			// 가입되어있는 메일이 아닐때만
					// 인증번호 입력칸 보이기
					$("#mailCertiNum").show();
					$("#mailKeyCheckBtn").show();
					
					// 이메일 인증 발송
					$.ajax({
						type:"get",
						url:"emailAuth",
						data:{ "email":$("#email").val(), "mail_key":$("mailCertiNum").val()},
						success:function(mailkey){					
							// alert(mailkey);
							alert('인증메일이 발송되었습니다');							
							
							$("#mailKeyCheckBtn").on('click', function () {
								if($("#mailCertiNum").val() == mailkey){
									$("#emailCheckWrite").css("color", "#0000ff");
									$("#emailCheckWrite").text("인증되었습니다");
									emailVerified = true;		// 인증완료
								}else{
									$("#emailCheckWrite").css("color", "#ff0000");
									$("#emailCheckWrite").text("인증번호를 확인해주십시오");
									$("#mailCertiNum").val("");
									emailVerified = false;
								}
								
							});
						},
						error:function(){
							alert(error);
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
	var pwd = "";
	var pwdCheck = "";
	var pwdValid = false;	// 비밀번호 유효성
	
	$("#pwd").on('keyup', function() {
	    pwd = $(this).val();
	    var regex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{3,10}$/;
	
	    
	    // 비밀번호 유효성 체크
	    if (regex.test(pwd)) {
	        $("#pwdValid").text("");
	        pwdValid = true;		// 비밀번호 유효성 일치
	    } else {
	        $("#pwdValid").css("color", "#ff0000");
	        $("#pwdValid").text("비밀번호는 영문자, 숫자, 특수문자를 혼합하여 3~10글자로 입력해주세요.");
	        pwdValid = false;		// 비밀번호 유효성 불일치
	       // return;
	        
	    }
	    
		$("#pwdCheck").on('keyup', function() {
		    pwdCheck = $(this).val();
		
		    // 비밀번호 확인 체크
		    if (pwd === pwdCheck) {
		        $("#pwdCheckWrite").text("");
		     //   pwdCheck = true;
		    } else {
		        $("#pwdCheckWrite").css("color", "#ff0000");
		        $("#pwdCheckWrite").text("비밀번호가 일치하지 않습니다.");
		     //   pwdCheck = false;
		    }
		});
	});
	
		
	// form submit취소 검사
	$("#regiFrm").submit(function(event) {
		if (!idCheck) { 				// id 중복검사가 완료되지 않은 경우
			alert("아이디 중복검사를 완료해주십시오.");
			event.preventDefault(); 	// submit 이벤트 취소					
		}else if (!emailVerified){		// 이메일 인증이 완료되지 않은 경우	
			alert("이메일 인증을 완료해주십시오.");
			event.preventDefault();	// submit 이벤트 취소
			
			// 빈필드 검사
		}else if ($("#id").val().trim() == "" || $("#pwd").val().trim() == "" || 
				$("#name").val().trim() == "" || $("#email").val().trim() == "" || 
				$("#phone").val().trim() == "" || $("#mailCertiNum").val().trim() == "") {
			alert("입력 필드를 모두 채워주세요.");
			event.preventDefault(); // submit 이벤트 취소
			
		}else if (!pwdValid){			// 비밀번호 유효성에 안맞을 때
			alert("유효한 비밀번호가 아닙니다.");
			$("#pwd").val("");				// 비밀번호 입력필드 지우기
			$("#pwdCheck").val("");
			event.preventDefault();	// submit 이벤트 취소
			
		}else if ($("#pwd").val() != $("#pwdCheck").val()) {
			alert("비밀번호가 다릅니다. 확인해주십시오");
			event.preventDefault(); // submit 이벤트 취소
		}	
		else if(!TermAgree.checked) {
	        alert("이용약관 및 개인정보 수집동의에 동의해야 합니다.");
	        event.preventDefault(); // submit 이벤트 취소
		}
		idCheck = false;		// 다시 아이디체크 초기화	
	});
	
});
	
</script>


</body>
</html>





