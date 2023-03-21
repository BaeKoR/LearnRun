<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
List<ClsDto> list = (List<ClsDto>)request.getAttribute("clslist");
String category = (String)request.getAttribute("category");
%>

<%
String pageTitle = "";
if(category == "" || category == null){
	pageTitle = "클래스 전체보기";
} else if(category.equals("cook")){
	pageTitle = "요리 클래스";
} else if(category.equals("design")){
	pageTitle = "디자인 클래스";
}
%>

<div style="height: 10%;">
<h1 class="cls-h1"><%=pageTitle %></h1>
</div>

<div style="height: 90%;">
<div class="clslist">
	<ul>
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
							<div class="cls-profile"><img src="..." alt="클래스작성자"></div>
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