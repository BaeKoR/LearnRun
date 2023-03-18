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

<div>
<form action="updateCls" id="frm" method="post" enctype="multipart/form-data">
<input type="hidden" id="id" name="id" value="<%=login.getId()%>">

<table>
<col width="10"><col width="10">

<tr>
	<td>
		<input type="text" id="title" name="title" placeholder="강의 제목" value="">
	</td>
	<td rowspan="3">
		<img src="" id="image" name="image"/>
	</td>
</tr>
<tr>
	<td>
		<select id="category" name="category">
			<option>카테고리</option>
			<option>요리</option>
			<option>디자인</option>
		</select>
	</td>
</tr>
<tr>
	<td>
		<input type="file" id="fileload" name="fileload"><!-- class="files" -->
	</td>
</tr>
<tr>
	<td colspan="2">
		<textarea cols="200" rows="30" id="content" name="content" placeholder="강의 내용"></textarea>
	</td>
</tr>
<tr>
	<td colspan="2">
		<button type="button">강의 수정</button>
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
		else if($("#category option:selected").val().trim() == "카테고리"){
			alert("카테고리를 선택해주세요");
			return;
		}
		else if($("#fileload").val().trim() == ""){
			alert("이미지 파일을 선택해주세요");
			return;
		}
		else if($("#content").val().trim() == ""){
			alert("내용을 입력해주세요");
			return;
		}
		else{
			//alert("성공");
			$("#frm").submit();
		}
	});
});

$('input[name="fileload"]').change(function(){
    setImageFromFile(this, '#image');
});

function setImageFromFile(input, expression) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
    	
		reader.onload = function (e) {
			$(expression).attr('src', e.target.result);
		}
		
		reader.readAsDataURL(input.files[0]);
	}
}

</script>

</body>
</html>