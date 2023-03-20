<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
ClsDto list = (ClsDto)request.getAttribute("list");
System.out.println(list);
%>


<!-- jQuery, bootstrap: defaultlayout.jsp 파일에 -->
<!-- summernote css/js -->
<link href="resources/css/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>


<div style="width: 1200px; display: inline-block; min-height: 770px">
	<form action="updateCls" id="frm" method="post" enctype="multipart/form-data">
		<%-- <input type="hidden" id="id" name="id" value="<%=login.getId()%>">
		<input type="hidden" id="seq" name="seq" value="<%=list.getSeq()%>"> --%>
		
		<table style="margin-top: 80px">
			<col width="600px">
			<col width="600px">
		
			<tr>
				<td rowspan="2">
					<img src="upload/<%=list.getNewfilename()%>" id="image" name="image"/>
				</td>
				<td>
					<%-- <input type="text" id="title" name="title" placeholder="강의 제목" readonly="readonly" value="<%=list.getTitle()%>"> --%>
					클래스명: <%=list.getTitle()%>
				</td>
			</tr>
			<tr>
				<td>
					카테고리: <%=list.getCategory()%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<textarea cols="200" rows="30" id="summernote" name="content" placeholder="강의 내용"><%=list.getContent()%></textarea>
				</td>
			</tr>
		</table>
	</form>
</div>


<script type="text/javascript">
// 메인화면 페이지 로드 함수
$(document).ready(function () {
    $('#summernote').summernote( {
    	 toolbar: []
    });
    
    $('#summernote').summernote("disable");
});
</script>
