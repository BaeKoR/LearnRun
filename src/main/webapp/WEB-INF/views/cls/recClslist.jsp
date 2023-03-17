<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
List<ClsDto> cooklist = (List<ClsDto>)request.getAttribute("cookReclist");
List<ClsDto> designlist = (List<ClsDto>)request.getAttribute("designReclist");
%>

<h2>추천 클래스</h2>

<div style="position: relative; padding: 0 30px">
	<h3 style="text-align: left;">요리</h3>
	<a href="/LearnRun/cls?category=cook" class="btn btn-dark" style="font-size: 10pt;position: absolute;top: 0;right: 0;margin-right: 30px; color: white!important;">요리 클래스 더보기</a>
	<hr>
	<div class="clslist-grid">
		<ul class="clslist-ul">
		<%
			if(cooklist == null || cooklist.size() == 0){
			%>
				<p>클래스가 없습니다.</p>
			<%
			}
			else {
				for(int i=0; i<cooklist.size(); i++)
				{
					ClsDto cookcls = cooklist.get(i);
					%>
					<li class="clslist-li">
						<a href="/LearnRun/clsDetail?seq=<%=cookcls.getSeq() %>">
							<figure class="clslist-fig">
								<img src="..." alt="클래스이미지">
							</figure>
							<div><%=cookcls.getCategory() %></div>
							<div><%=cookcls.getTitle() %></div>
							<div><%=cookcls.getId() %></div>
						</a>
					</li>
					<%
				}
			}
		%>
		</ul>
	</div>
</div>

<div style="position: relative; padding: 0 30px">
	<h3 style="text-align: left;">디자인</h3>
	<a href="/LearnRun/cls?category=design" class="btn btn-dark" style="font-size: 10pt;position: absolute;top: 0;right: 0;margin-right: 30px; color: white!important;">디자인 클래스 더보기</a>
	<hr>
	<div class="clslist-grid">
		<ul class="clslist-ul">
		<%
			if(designlist == null || designlist.size() == 0){
			%>
				<p>클래스가 없습니다.</p>
			<%
			}
			else {
				for(int i=0; i<designlist.size(); i++)
				{
					ClsDto designcls = designlist.get(i);
					%>
					<li class="clslist-li">
						<a href="/LearnRun/clsDetail?seq=<%=designcls.getSeq() %>">
							<figure class="clslist-fig">
								<img src="..." alt="클래스이미지">
							</figure>
							<div><%=designcls.getCategory() %></div>
							<div><%=designcls.getTitle() %></div>
							<div><%=designcls.getId() %></div>
						</a>
					</li>
					<%
				}
			}
		%>
		</ul>
	</div>
</div>