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