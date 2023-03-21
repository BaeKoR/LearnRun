<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<ClsDto> clslist = (List<ClsDto>)request.getAttribute("clslist");
List<ClsDto> bestlist = (List<ClsDto>)request.getAttribute("bestlist");
%>

<div class="clslist">
	<h2>TOP 클래스</h2>
	<ul>
	<%
		if(bestlist == null || bestlist.size() == 0){
		%>
			<p>클래스가 없습니다.</p>
		<%
		}
		else {
			for(int i=0; i<bestlist.size()&&i<4; i++)
			{
				ClsDto bestcls = bestlist.get(i);
				%>
				<li>
					<a href="/LearnRun/clsDetail?seq=<%=bestcls.getSeq() %>">
						<figure class="cls-fig">
							<img src="upload/<%=bestcls.getNewfilename() %>" alt="클래스이미지">
						</figure>
						<div class="cls-tag">
							<p class="tag-category"><%=bestcls.getCategory() %></p>
							<% if(bestcls.getRecommend()==1) { %>
							<p class="tag-category">추천</p>
							<% } %>
						</div>
						<div class="cls-title"><%=bestcls.getTitle() %></div>
						<div class="cls-id">
							<div class="cls-profile"><img src="..." alt="클래스작성자"></div>
							<p><%=bestcls.getId() %></p>
						</div>
					</a>
				</li>
				<%
			}
		}
	%>
	</ul>
	<span class="cls-more">
		<a href="/LearnRun/bestCls">
			인기 클래스 더보기
			<svg width="15" height="15" viewBox="0 1 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" class="catalog-more__icon"><path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path></svg>
		</a>
	</span>
</div>

<div class="clslist">
	<h2>런런의 모든 클래스</h2>
	<ul>
	<%
		if(clslist == null || clslist.size() == 0){
		%>
			<p>클래스가 없습니다.</p>
		<%
		}
		else {
			for(int i=0; i<clslist.size()&&i<20; i++)
			{
				ClsDto cls = clslist.get(i);
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
							<div class="cls-profile"><img src="..." alt="."></div>
							<p><%=cls.getId() %></p>
						</div>
					</a>
				</li>
				<%
			}
		}
	%>
	</ul>
	<span class="cls-more">
		<a href="/LearnRun/cls">
			클래스 전체보기
			<svg width="15" height="15" viewBox="0 1 15 12" fill="none" xmlns="http://www.w3.org/2000/svg" role="img" class="catalog-more__icon"><path d="M14.1016 5.66406C14.1016 5.46094 14.0234 5.27344 13.8672 5.125L8.98438 0.25C8.8125 0.0859375 8.64062 0.015625 8.45312 0.015625C8.05469 0.015625 7.75 0.304688 7.75 0.703125C7.75 0.898438 7.82031 1.07812 7.95312 1.20312L9.60938 2.89062L11.9766 5.05469L10.2188 4.94531H1C0.585938 4.94531 0.289062 5.24219 0.289062 5.66406C0.289062 6.07812 0.585938 6.375 1 6.375H10.2188L11.9844 6.26562L9.60938 8.42969L7.95312 10.1172C7.82812 10.2422 7.75 10.4219 7.75 10.6172C7.75 11.0156 8.05469 11.3047 8.45312 11.3047C8.64062 11.3047 8.80469 11.2344 8.96875 11.0859L13.8672 6.19531C14.0234 6.04688 14.1016 5.85938 14.1016 5.66406Z" fill="#F9858D"></path></svg>
		</a>
	</span>
</div>