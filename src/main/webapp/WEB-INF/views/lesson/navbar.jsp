<%@page import="com.semi.learn.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/leslayout.css">

<%
MemberDto login = (MemberDto)session.getAttribute("login");
String title = (String)request.getAttribute("title");
%>
<div>
	<a href="/LearnRun/myCls?id=<%=login.getId()%>">
		<img src="/LearnRun/resources/images/backarrow.png" alt="back" style="width: 20px;"/>
	</a>
	<span><%= title %></span>
</div>