<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#myCls-container h3 {
	text-align: left;
	margin-left: 205px;
	margin-bottom: 30px;
	font-weight: 600;
    font-size: 28px;
}
</style>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
List<ClsDto> list = (List<ClsDto>)request.getAttribute("likecls");
%>

<div id="myCls-container">
	<h3>좋아요를 누른 강의</h3> 
	<div class="clslist">
	<ul>
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
				<li>
					<a href="/LearnRun/clsDetail?seq=<%=cls.getSeq() %>">
						<figure class="cls-fig">
							<img src="upload/<%=cls.getNewfilename() %>" alt="클래스이미지">
						</figure>
						<div class="cls-tag">
							<p class="tag-category"><%=cls.getCategory() %></p>
							<% if(cls.getRecommend()==1) { %>
							<p class="tag-category">추천</p>
							<% } %>
						</div>
						<div class="cls-title"><%=cls.getTitle() %></div>
						<div class="cls-id">
							<!-- <div class="cls-profile"><img src="..." alt="."></div> -->
							<p><%=cls.getId() %></p>
						</div>
					</a>
				</li>
				<%
			}
		}
	%>
	</ul>
	</div>
</div>