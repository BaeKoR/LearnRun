<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<ClsDto> list = (List<ClsDto>)request.getAttribute("bestClslist");
%>

<div class="bestCls-back">
<div style="width: 1200px; display: inline-block;">
	<h1 class="cls-h1">BEST TOP 5</h1>
	<p class="cls-p-dark">#최고의 #런런 #클래스</p>
	<div class="bestCls defaultClslist">
		<div class="clslist">
			<%
				if(list == null || list.size() == 0){
				%>
					<p>클래스가 없습니다.</p>
				<%
				}
				else {
					%><ul><%
					for(int i=0; i<list.size()&&i<5; i++)
					{
						ClsDto cls = list.get(i);
						%>
						<li>
							<a href="/LearnRun/clsDetail?seq=<%=cls.getSeq() %>">
								<div class="card <% if(i==0){%>card-first<%} %>" data-label="<%=i+1 %>위">
									<figure class="cls-fig">
										<img src="upload/<%=cls.getNewfilename() %>" alt="클래스이미지">
									</figure>
								</div>
								<div class="cls-tag">
									<p class="tag-category"><%=cls.getCategory() %></p>
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
					%></ul><%
				}
			%>
		</div>
	</div>
</div>
</div>
<div style="width: 1200px; display: inline-block;">
	<div class="defaultClslist">
		<h2>모든 인기 클래스</h2>
		<div class="clslist">
			<%
				if(list == null || list.size() < 5){
				%>
					<p>클래스가 없습니다.</p>
				<%
				}
				else {
					%><ul><%
					for(int i=5; i<list.size(); i++)
					{
						ClsDto cls = list.get(i);
						%>
						<li>
							<a href="/LearnRun/clsDetail?seq=<%=cls.getSeq() %>">
								<div class="card" data-label="<%=i+1 %>위">
									<figure class="cls-fig">
										<img src="upload/<%=cls.getNewfilename() %>" alt="클래스이미지">
									</figure>
								</div>
								<div class="cls-tag">
									<p class="tag-category"><%=cls.getCategory() %></p>
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
					%></ul><%
				}
			%>
		</div>
	</div>
	<a href="/LearnRun/cls" class="btn btn-dark" style="margin-bottom: 50px; padding: 7px 16px; color: white !important;">클래스 더보기</a>
	
</div>