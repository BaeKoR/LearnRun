<%@page import="com.semi.learn.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#quit-container h3 {
	text-align: left; 
	margin-bottom: 30px;
	font-weight: 600;
}
#quit-container h5 {
	font-weight: 600;
}
#quit-container>p {
	white-space: pre; margin: 50px;
}
#quit-container div {
	width: 550px; margin: auto; word-break: keep-all;
}
#quit-container>div>p {
	text-align: left; margin-left:  20px; text-indent: -20px;
}
#quit-container .form-control {
	margin: 30px auto; width: 550px;
}
#quit-container .btn {
	width: 550px;
}
</style>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<div id="quit-container">
	<h3>회원 탈퇴</h3>
	<h5>탈퇴 시 안내사항</h5>
	<p>서비스에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?
	그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!
	🙇🏻‍♂️ 감사합니다 🙇🏻‍♀️
	</p>
	
	<div>
		<p>
		1. 탈퇴 시 계정과 관련된 모든 권한이 사라지며 복구할 수 없습니다.
		</p>
		<p>
		2. 직접 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동으로 삭제되지 않으며, 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.
		</p>
		<p>
		3. 탈퇴 후 동일한 메일로 재가입이 가능하나, 탈퇴한 계정과 연동되지 않습니다.
		</p>
		<p>
		4. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.
		</p>
	</div>

	<form action="quitAf" method="post">
		<input type="hidden" name="id" value="<%= login.getId() %>" />
		<input type="password" name="pwd" class="form-control" autocomplete="off" placeholder="비밀번호 입력"/>
		<button type="button" class="btn btn-secondary">탈퇴하기</button>
	</form>
</div>

<script>
$(document).ready(function () {
	$("form button").click(function () {
		if($(this).prev().val().trim() == ""){
			alert("비밀번호를 입력해주세요");
			return;
		} else {
			$(this).parent().submit();
		}
	});
});
</script>