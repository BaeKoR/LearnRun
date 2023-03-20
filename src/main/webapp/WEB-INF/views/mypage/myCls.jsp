<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#myCls-container h3 {
	text-align: left; 
	margin-bottom: 30px;
	font-weight: 600;
}
#myCls-container button {
	width: 230px;
}
</style>

<%
List<ClsDto> list = (List<ClsDto>)request.getAttribute("takecls");
%>

<div id="myCls-container">
	<h3>수강 중인 강의</h3> 
	<div class="clslist-grid">
	<ul class="clslist-ul">
	<%
		if(list == null || list.size() == 0){
		%>
			<p>수강중인 클래스가 없습니다.</p>
		<%
		}
		else {
			for(int i=0; i<list.size(); i++)
			{
				ClsDto cls = list.get(i);
				%>
				<li class="clslist-li">
					<a href="/LearnRun/clsDetail?seq=<%= cls.getSeq() %>">
						<figure class="clslist-fig">
							<img src="..." alt="클래스이미지">
						</figure>
						<div><%= cls.getTitle() %></div>
					</a>
					<div style="text-align: center; margin: 10px 0;">
					<button class="btn btn-secondary" onclick="goLesson(<%= cls.getSeq() %>)">강의 듣기</button>
					</div>
				</li>
				<%
			}
		}
	%>
	</ul>
	</div>
</div>

<script>
function goLesson(seq) {
	location.href = "/LearnRun/lesson?cls_seq=" + seq;
}
</script>