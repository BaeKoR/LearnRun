<%@page import="com.semi.learn.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
	transform: translate(-50%, -50%) ; 
	background-color: white;  
	padding: 30px;
	font-family: 'Yaldevi Colombo SemiBold'!important;
	border-radius: 10px;
	
 
}

button{
	width: 100%;
}

</style>


</head>
<body>

<section class="vh-100" style="background-color: #F8EEE1;">
<div class="container py-5 h-100" style="background-color: #F8EEE1;">


<div align="center" class="find_form" >
<div style="margin-bottom: 10px">
<h4><b>아이디찾기</b></h4>
<br>


<input type="text" id="name" name="name" size="30" class="form-control email-input" placeholder="이름을 입력하세요"><br>
<input type="text" id="email" name="email" size="30" class="form-control email-input"  placeholder="가입한 이메일을 입력하세요">
<br><br>
<button type="button" id="findIdBtn" class="btn btn-dark btn-lg btn-block" >아이디 찾기</button>
</div>
<br><br>

<div style=" margin-bottom: 0">
<h4><b>가입정보</b></h4>
<br>
<input type="text" id="regiId" class="form-control email-input"  readonly="readonly" value="가입한 아이디">
<br><br>

<button type="button" onclick="location.href='findPassword'" 
class="btn btn-dark btn-lg btn-block" >비밀번호 찾기</button>
<br><br>
<a href="login" style="text-decoration: underline;">로그인하기</a>
<!-- <button type="button" onclick="location.href='login'">로그인</button> -->
</div>
</div>


</div>
</section>

<script type="text/javascript">



$(document).ready(function(){
	
	
	
	$("#findIdBtn").click(function () {
		
		// 이름, 이메일 빈칸조사		
		if($("#name").val().trim() == ""){
			alert("이름을 입력해주세요");			
		}else if($("#email").val().trim() == ""){
			alert("이메일을 입력해주세요");
		}else{
		
		// 이름과 이메일값 넣어주고 아이디값 불러오기
		$.ajax({
			type:"get",
			url:"findIdAf",
			data:{ "email":$("#email").val(), "name":$("#name").val()},
			success:function(mem){
				// alert("success");
				// console.log(mem);
				//alert(mem);			
				
				// mem 객체가 유효하지 않은 경우
			    if (!mem || !mem.id) {
			      alert("사용자를 찾을 수 없습니다. 이름이나 메일을 확인해주세요.");
			      return;
			    }

			    // mem 객체가 유효한 경우
			    // 가입된 아이디에 값 넣어주기
			    $("#regiId").val(mem.id);
			  },
			  error: function() {
			    alert("error");
			  }
			
		});
		}
	}); 	
});


</script>

</body>
</html>