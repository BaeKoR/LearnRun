<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.3.min.js"></script>

</head>
<body>

<h1>비밀번호 입력</h1>
<form action="/LearnRun/updateMember" method="post">
	<input type="hidden" id="id" name="id" value="<%=login.getId()%>">
	
	<input type="password" id="pwd" name="pwd" placeholder="Passward">
	
	<button type="button">입력</button>
</form>

<script type="text/javascript">
$(document).ready(function () {
	$("button").click(function () {
		if($("#pwd").val().trim() == ""){
			alert("비밀번호를 입력해주세요");
			return;
		}
		else if($("#pwd").val().trim() != <%=login.getPwd()%>){
			alert("비밀번호가 일치하지 않습니다");
			return;
		}
		else{
			//alert("성공");
			$("#frm").submit();
		}
	});
});
</script>

</body>
</html>