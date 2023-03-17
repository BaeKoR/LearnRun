<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<ClsDto> list = (List<ClsDto>)request.getAttribute("bestClslist");
%>

<h2>인기 클래스</h2>

<div class="clslist-grid">
	<ul class="clslist-ul">
	<%
		if(list == null || list.size() == 0){
		%>
			<p>클래스가 없습니다.</p>
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