<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<ClsDto> cooklist = (List<ClsDto>)request.getAttribute("cookReclist");
List<ClsDto> designlist = (List<ClsDto>)request.getAttribute("designReclist");
%>

<div style="width: 1200px; display: inline-block;">
	<h1 class="cls-h1">추천 클래스</h1>
	
	<div class="defaultClslist">
		<h2>요리 클래스</h2>
		<a href="/LearnRun/cls?category=cook" class="btn btn-dark">요리 클래스 더보기</a>
		<div class="clslist">
			<%
				if(cooklist == null || cooklist.size() == 0){
				%>
					<p>클래스가 없습니다.</p>
				<%
				}
				else {
					%><ul><%
					for(int i=0; i<cooklist.size()&&i<8; i++)
					{
						ClsDto cookcls = cooklist.get(i);
						%>
						<li>
							<a href="/LearnRun/clsDetail?seq=<%=cookcls.getSeq() %>">
								<figure class="cls-fig">
									<img src="upload/<%=cookcls.getNewfilename() %>" alt="클래스이미지">
								</figure>
								<div class="cls-tag">
									<p class="tag-category"><%=cookcls.getCategory() %></p>
								</div>
								<div class="cls-title"><%=cookcls.getTitle() %></div>
								<div class="cls-id">
									<div class="cls-profile"><img src="..." alt="클래스작성자"></div>
									<p><%=cookcls.getId() %></p>
								</div>
							</a>
						</li>
						<%
					}
					%></ul><%
				}
			%>
		</div>
	</div>
	<hr>
	<div class="defaultClslist">
		<h2>디자인 클래스</h2>
		<a href="/LearnRun/cls?category=design" class="btn btn-dark">디자인 클래스 더보기</a>
		<div class="clslist">
			<%
				if(designlist == null || designlist.size() == 0){
				%>
					<p>클래스가 없습니다.</p>
				<%
				}
				else {
					%><ul><%
					for(int i=0; i<designlist.size()&&i<8; i++)
					{
						ClsDto designcls = designlist.get(i);
						%>
						<li>
							<a href="/LearnRun/clsDetail?seq=<%=designcls.getSeq() %>">
								<figure class="cls-fig">
									<img src="upload/<%=designcls.getNewfilename() %>" alt="클래스이미지">
								</figure>
								<div class="cls-tag">
									<p class="tag-category"><%=designcls.getCategory() %></p>
								</div>
								<div class="cls-title"><%=designcls.getTitle() %></div>
								<div class="cls-id">
									<div class="cls-profile"><img src="..." alt="클래스작성자"></div>
									<p><%=designcls.getId() %></p>
								</div>
							</a>
						</li>
						<%
					}
					%></ul><%
				}
			%>
		</div>
	</div>
	<hr>
	<div class="defaultClslist">
		<h2>건강/운동 클래스</h2>
		<a href="/LearnRun/cls?category=design" class="btn btn-dark">건강/운동 클래스 더보기</a>
		<div class="clslist">
			<%
				if(cooklist == null || cooklist.size() == 0){
				%>
					<p>클래스가 없습니다.</p>
				<%
				}
				else {
					%><ul><%
					for(int i=0; i<cooklist.size()&&i<8; i++)
					{
						ClsDto cookcls = cooklist.get(i);
						%>
						<li>
							<a href="/LearnRun/clsDetail?seq=<%=cookcls.getSeq() %>">
								<figure class="cls-fig">
									<img src="upload/<%=cookcls.getNewfilename() %>" alt="클래스이미지">
								</figure>
								<div class="cls-tag">
									<p class="tag-category"><%=cookcls.getCategory() %></p>
								</div>
								<div class="cls-title"><%=cookcls.getTitle() %></div>
								<div class="cls-id">
									<div class="cls-profile"><img src="..." alt="클래스작성자"></div>
									<p><%=cookcls.getId() %></p>
								</div>
							</a>
						</li>
						<%
					}
					%></ul><%
				}
			%>
		</div>
	</div>
</div>