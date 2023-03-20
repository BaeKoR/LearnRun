<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");
List<ClsDto> list = (List<ClsDto>)request.getAttribute("clslist");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 강의 등록 -->
<a href="/LearnRun/createLesson"><h1>클래스 등록</h1></a>

<!-- 내 강의 출력 -->
<div class="clslist">
	<h2>등록한 클래스 목록</h2>
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
						<div><a href="/LearnRun/updateLesson?seq=<%=cls.getSeq()%>">수정</a></div>
					</a>
				</li>
				<%
			}
		}
	%>
	</ul>
</div>

</body>
</html>