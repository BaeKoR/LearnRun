<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String search = (String)request.getAttribute("search");
if(search == null){
	search = "";
}
%>

<h1>LearnRun</h1>
<br>

<input type="text" class="form-control" id="search" name="search" placeholder="검색어" style="width: 300px" value="<%=search %>">
<br>

<a href="/LearnRun/mainpage">메인</a>
&nbsp;
<a href="/LearnRun/cls">클래스</a>
&nbsp;
<a href="/LearnRun/recCls">추천</a>
&nbsp;
<a href="/LearnRun/bestCls">BEST</a>
&nbsp;
<a href="/LearnRun/login">로그인</a>
&nbsp;
<a href="/LearnRun/mypage/myCls">마이페이지</a>


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