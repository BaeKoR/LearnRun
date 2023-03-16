<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String category = request.getParameter("category");
String search = (String)request.getAttribute("search");

if(category == null){
	category = "";
}
if(search == null){
	search = "";
}
%>

<div class="container">
	<div class="row">
		<div class="col">
		    <h2>category</h2>
			    
			<ul class="nav flex-column nav-pills nav-custom">
			    <li class="nav-item">
			    	<a class="nav-link <%=category.equals("") ? "active" : "" %>" href="/LearnRun/cls?search=<%=search %>">전체보기</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=category.equals("cook") ? "active" : "" %>" href="/LearnRun/cls?category=cook&search=<%=search %>">요리</a>
				</li>
				<li class="nav-item">
					<a class="nav-link <%=category.equals("design") ? "active" : "" %>" href="/LearnRun/cls?category=design&search=<%=search %>">디자인</a>
				</li>
			</ul>
		</div>
	</div>
</div>