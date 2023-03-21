<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String search = (String)request.getAttribute("search");
if(search == null){
	search = "";
}

//로그인 정보
MemberDto login = (MemberDto)session.getAttribute("login");

%>

<div class="header">
	<div class="header-top">
		<div class="d-flex flex-wrap justify-content-between align-items-center">
			<div class="col-md-4 d-flex align-items-center">
				<a href="mainpage" class="me-2 lh-1" style="margin: 16px;"> <img
					src="resources/images/logo-red.png" alt="logo" style="width: 75px;">
				</a>
				<div class="search-bar">
					<input type="text" class="form-control" id="search" name="search"
						placeholder="어떤 클래스를 찾으시나요?" autocomplete="off"
						style="width: 300px" value="<%=search%>">
				</div>
			</div>

			<div class="justify-content-end d-flex" style="margin: 0 18px;">
				<!-- 로그인/로그아웃 처리 -->
				<%
				if (login == null) {
				%>
				<a href="/LearnRun/login">로그인</a>
				<%
				} else {
				%>
				<a href="/LearnRun/myCls?id=<%=login.getId()%>"><%=login.getName() %>님의 강의장</a> <a
					href="/LearnRun/logout" style="margin-left: 15px">로그아웃</a>
				<%
				}
				%>
			</div>
		</div>
	</div>
	
	<div class="header-bottom">
		<nav class="navbar navbar-expand-lg">
		  <div class="container-fluid">
		    <div class="collapse navbar-collapse" id="navbarNavDarkDropdown">
		      <ul class="navbar-nav">
		        <li class="nav-item dropdown">
		          <a class="nav-link dropdown-toggle" href="/LearnRun/cls" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
		            카테고리
		          </a>
		          <ul class="dropdown-menu" aria-labelledby="navbarDarkDropdownMenuLink">
		            <li><a class="dropdown-item" href="/LearnRun/cls?category=요리">요리</a></li>
		            <li><a class="dropdown-item" href="/LearnRun/cls?category=디자인">디자인</a></li>
		          </ul>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/LearnRun/recCls">추천 클래스</a>
		        </li>
		        <li class="nav-item">
		          <a class="nav-link" href="/LearnRun/bestCls">인기 클래스</a>
		        </li>
		      </ul>
		    </div>
		  </div>
		</nav>
	</div>
</div>
<div class="header-area"></div>

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