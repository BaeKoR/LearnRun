<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%
String quit = (String)request.getAttribute("quit");
if(quit != null && !quit.equals("")) {
	if(quit.equals("OK")) {
		%>
		<script type="text/javascript">
			location.href = "/LearnRun/mainpage";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("패스워드를 다시 확인하세요.");
			location.href = "/LearnRun/quit";
		</script>
		<%
	}
}
%>

<!-- 회원가입 메세지 -->
<%
String regimsg = (String)request.getAttribute("regimsg");
// null이 아니고 빈문자가 아닐 때
if(regimsg != null && !regimsg.equals("")){
	if(regimsg.equals("MEMBER_ADD_YES")){
	%>	
	<script type="text/javascript">
	alert("성공적으로 가입되었습니다");
	location.href = "login";
	</script>
	<%
	}else{
	%>
	<script type="text/javascript">
	alert("가입되지 않았습니다 다시 가입해 주십시오");
	location.href = "login/regi";
	</script>
	<%
	}	
}
%>


<!-- 로그인 메세지 -->
<%
String loginmsg = (String)request.getAttribute("loginmsg");
// null이 아니고 빈문자가 아닐 때
if(loginmsg != null && !loginmsg.equals("")){
	if(loginmsg.equals("LOGIN_OK")){
	%>	
	<script type="text/javascript">
	alert("로그인 되었습니다");
	location.href = "mainpage";
	</script>
	<%
	}else{
	%>
	<script type="text/javascript">
	alert("아이디나 비밀번호를 확인해 주십시오");
	location.href = "login";
	</script>
	<%
	}
	
}
%>
