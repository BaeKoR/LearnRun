<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/leslayout.css">

<%
String title = (String)request.getAttribute("title");
%>
<div>
	<a href="/LearnRun/myCls">
		<img src="/LearnRun/resources/image/backicon.png" alt="back" style="width: 20px;"/>
	</a>
	<span><%= title %></span>
</div>