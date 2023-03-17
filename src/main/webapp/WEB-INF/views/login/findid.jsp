<%@page import="com.semi.learn.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>

<section class="vh-100" style="background-color: #F8EEE1;">
<div class="container py-5 h-100">


<div align="center">
<h3>아이디찾기</h3>


이름: <input type="text" id="name"  size="30" placeholder="이름을 입력하세요"><br>
이메일: <input type="text" id="email" size="30"  placeholder="가입한 이메일을 입력하세요">
<br><br>
<button type="button" id="findIdBtn"  >아이디 찾기</button>

<h3>가입된 아이디</h3>
<input type="text" id="regiId" readonly="readonly" >
<br><br>
<button type="button" onclick="location.href='login'">로그인</button>
<button type="button" onclick="location.href='findPassword'">비밀번호 찾기</button>

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
				console.log(mem);
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