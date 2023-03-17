<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String search = (String)request.getAttribute("search");
if(search == null){
	search = "";
}
%>

<div class="header-top">
	<a href="mainpage" style="margin: 16px;">
		<img src="resources/images/logo.png" alt="logo" style="width: 75px;">
	</a>
	
	<div class="search-bar">
		<input type="text" class="form-control" id="search" name="search" placeholder="검색" autocomplete="off" style="width: 300px" value="<%=search %>">
	</div>
	
	<div class="header-right">
		<a href="/LearnRun/myCls">마이페이지</a>
		<a href="/LearnRun/login" style="margin-left: 15px">로그인</a>
	</div>
</div>

<div class="header-bottom">
	<nav class="nav">
	  <a class="nav-link" href="/LearnRun/cls">카테고리</a>
	  <a class="nav-link" href="/LearnRun/recCls">추천 클래스</a>
	  <a class="nav-link" href="/LearnRun/bestCls">인기 클래스</a>
	</nav>
</div>

<script type="text/javascript">
$(document).ready(function(){
    $("#search").on("keyup", function(event) {
        if (event.which == 13) {
        	var search = $("#search").val();
        	if(search.trim() == ""){
        		alert("검색어를 입력해 주십시오.");
        		return;
        	}
        	location.href = "/LearnRun/cls?search=" + search;
        }
    });
});
</script>