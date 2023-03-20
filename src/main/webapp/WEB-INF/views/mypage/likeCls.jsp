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
</style>

<%
List<ClsDto> list = (List<ClsDto>)request.getAttribute("likecls");
%>

<div id="myCls-container">
	<h3>좋아요를 누른 강의</h3> 
	<div class="clslist-grid">
	<ul class="clslist-ul">
	<%
		if(list == null || list.size() == 0){
		%>
			<p>맘에 드는 클래스에 좋아요를 눌러보세요!</p>
		<%
		}
		else {
			for(int i=0; i<list.size(); i++)
			{
				ClsDto cls = list.get(i);
				%>
				<li class="clslist-li">
					<a href="/LearnRun/clsDetail?seq=<%=cls.getSeq() %>">
						<figure class="clslist-fig">
							<img src="..." alt="클래스이미지">
						</figure>
						<div><%=cls.getCategory() %></div>
						<div><%=cls.getTitle() %></div>
						<div><%=cls.getId() %></div>
					</a>
				</li>
				<%
			}
		}
	%>
	</ul>
	</div>
</div>