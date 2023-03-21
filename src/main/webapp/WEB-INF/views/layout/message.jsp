<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 강의 듣기 메세지 -->
<%
String lesson = (String)request.getAttribute("lesson");
if(lesson != null && !lesson.equals("")) {
	if(lesson.equals("EMPTY")) {
		%>
		<script type="text/javascript">
			alert('아직 등록된 강의가 없습니다.');
			history.back();
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("error");
			location.href = "/LearnRun/mainpage";
		</script>
		<%
	}
}
%>

<!-- 후기 작성 메세지 -->
<%
String review = (String)request.getAttribute("review");
if(review != null && !review.equals("")) {
	int seq = (Integer)request.getAttribute("seq");
	if(review.equals("OK")) {
		%>
		<script type="text/javascript">
			location.href = "/LearnRun/clsDetail?seq=" + <%=seq%>;
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("다시 시도해주세요.");
			location.href = "/LearnRun/clsDetail?seq=" + <%=seq%>;
		</script>
		<%
	}
}
%>

<!-- 회원탈퇴 메세지 -->    
<%
String quit = (String)request.getAttribute("quit");
if(quit != null && !quit.equals("")) {
	if(quit.equals("OK")) {
		%>
		<script type="text/javascript">
			alert('회원 탈퇴를 신청하였습니다. \n2-3일 내 탈퇴가 승인됩니다.');
			location.href = "/LearnRun/mainpage";
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("다시 시도해주세요.");
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

<%
String notimage = (String)request.getAttribute("notimage");
if(notimage != null && !notimage.equals(""))
{
	%>
	<script type="text/javascript">
	alert("jpg, png 확장자 파일만 적용 가능합니다");
	location.href="createLesson";
	</script>
	<%
}

String toobig = (String)request.getAttribute("toobig");
if(toobig != null && !toobig.equals("")) {
	%>
	<script type="text/javascript">
	alert("1MB이하 파일만 적용 가능합니다");
	location.href="createLesson";
	</script>
	<%
}

String clsnotimage = (String)request.getAttribute("clsnotimage");
if(clsnotimage != null && !clsnotimage.equals(""))
{
	int seq = (Integer)request.getAttribute("seq");
	
	%>
	<script type="text/javascript">
	alert("jpg, png 확장자 파일만 적용 가능합니다");
	location.href="updateLesson?seq=" + <%=seq%>;
	</script>
	<%
}

String clstoobig = (String)request.getAttribute("clstoobig");
if(clstoobig != null && !clstoobig.equals("")) {
	int seq = (Integer)request.getAttribute("seq");
	
	%>
	<script type="text/javascript">
	alert("1MB이하 파일만 적용 가능합니다");
	location.href="updateLesson?seq=" + <%=seq%>;
	</script>
	<%
}

String profilenotimage = (String)request.getAttribute("profilenotimage");
if(profilenotimage != null && !profilenotimage.equals("")){
	String id = (String)request.getAttribute("id");
	
	%>
	<script type="text/javascript">
	alert("jpg, png 확장자 파일만 적용 가능합니다");
	location.href="pwdCheck";
	</script>
	<%
}

String profiletoobig = (String)request.getAttribute("profiletoobig");
if(profiletoobig != null && !profiletoobig.equals("")) {
	String id = (String)request.getAttribute("id");
	
	%>
	<script type="text/javascript">
	alert("1MB이하 파일만 적용 가능합니다");
	location.href="pwdCheck";
	</script>
	<%
}

String notvideo = (String)request.getAttribute("notvideo");
if(notvideo != null && !notvideo.equals("")){
	int seq = (Integer)request.getAttribute("seq");
	
	%>
	<script type="text/javascript">
	alert("mp4, mkv 확장자 파일만 적용 가능합니다");
	location.href="videoUpload?seq=" + <%=seq%>;
	</script>
	<%
}

String toobigvideo = (String)request.getAttribute("toobigvideo");
if(toobigvideo != null && !toobigvideo.equals("")) {
	int seq = (Integer)request.getAttribute("seq");
	
	%>
	<script type="text/javascript">
	alert("900MB이하 파일만 적용 가능합니다");
	location.href="videoUpload?seq=" + <%=seq%>";
	</script>
	<%
}
%>









