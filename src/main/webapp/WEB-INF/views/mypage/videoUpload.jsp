<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
int seq = (Integer)request.getAttribute("seq");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div>
<form action="writeLesson" id="frm" method="post" enctype="multipart/form-data">
<input type="hidden" id="id" name="id" value="<%=login.getId()%>">
<input type="hidden" id="cls_seq" name="cls_seq" value="<%=seq%>">

<table style="margin: auto;">
<col width="1000">

<tr>
	<td>
		<input type="text" id="title" name="title" class="form-control form-control-lg" placeholder="영상 제목">
	</td>
</tr>

<tr>
	<td>
		<input type="file" id="fileload" name="fileload">
	</td>
</tr>
<tr>
	<td>
		900MB이하의 mp4, mkv 확장자 파일만 적용 가능합니다
	</td>
</tr>
<tr>
	<td>
		<textarea id="content" name="content" class="form-control form-control-lg" placeholder="강의 내용"></textarea>
	</td>
</tr>
<tr>
	<td>
		<button type="button" class="btn btn-secondary" style="margin-top: 20px;">강의 등록</button>
	</td>
</tr>
</table>
</form>
</div>

<script type="text/javascript">
$(document).ready(function () {
	$("button").click(function () {
		if($("#title").val().trim() == ""){
			alert("제목을 입력해주세요");
			return;
		}
		else if($("#fileload").val().trim() == ""){
			alert("이미지 파일을 선택해주세요");
			return;
		}
		/*else if($("#content").val().trim() == ""){
			alert($("#content").val());
			alert("내용을 입력해주세요");
			return;
		}*/
		else{
			//alert("성공");
			$("#frm").submit();
		}
	});
});
</script>

</body>
</html>