<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<style>
#pwdCheck-container h3 {
	text-align: left;
	margin-left: 205px;
	margin-bottom: 30px;
	font-weight: 600;
    font-size: 28px;
}
#pwdCheck-container h4 {
	margin-bottom: 30px;
	font-weight: 600;
	font-size: 22px;
}
#pwdCheck-container input {
	width: 300px;
	display: inline-block;
}
#pwdCheck-container button {
	width: 100px;
}
</style>

<div id="pwdCheck-container">
<h3>내 정보 수정</h3>
<h4>비밀번호 입력</h4>
<form action="/LearnRun/updateMember" method="post">
	<input hidden="hidden" /><!-- 엔터키 제출 막기 -->
	<input type="hidden" id="id" name="id" value="<%=login.getId()%>">
	
	<input type="password" id="pwd" name="pwd" class="form-control" autocomplete="new-password"
		 placeholder="Password" readonly onfocus="this.removeAttribute('readonly');">
	
	<button type="button" class="btn btn-light">확인</button>
</form>
</div>

<script type="text/javascript">
$(document).ready(function () {
	$("button").click(function () {
		if($("#pwd").val().trim() == ""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		else if($("#pwd").val().trim() !== "<%=login.getPwd()%>"){
			alert("비밀번호가 일치하지 않습니다");
			return;
		}
		else{
			$("form").submit();
		}
	});
});
</script>
