<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="com.semi.learn.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<% 
List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("myReview"); 
int pageNumber = (Integer)request.getAttribute("pageNumber");
int totlaPages = (Integer)request.getAttribute("totalPages");
%>
<h3>작성한 후기</h3>
<div>
	<% 
	if(list == null || list.size() == 0) {
		%>
		<div>아직 작성한 후기가 없습니다.</div>
		<%
	} else {
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
			
		%>
		<div class="card" style="width: 800px;float: left;">
			<a href="LearnRun/cls?seq=<%=map.get("seq")%>"><!-- 클래스 상세페이지로 -->
				<div class="card-body">
					<div><%= map.get("title") %></div>
					<pre>↳ <%= map.get("content") %></pre>
					<div class="text-muted"><%= map.get("wdate") %></div>
				</div>
			</a>
		</div>
		<%
		}
	}
	%>
	<div>
		
	</div>
</div>