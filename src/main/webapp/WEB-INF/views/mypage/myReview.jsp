<%@page import="java.sql.Timestamp"%>
<%@page import="com.semi.learn.util.Utility"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page import="com.semi.learn.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#myReview-container h3 {
	text-align: left; 
	margin-bottom: 30px;
	font-weight: 600;
}
#myReview-container .card-body {
	padding: 10px 20px;
}
#card-list>div {
	text-align: left;
}
#card-list>.card {
	display: none; 
	width: 800px;
	float: left;
}
.card p {
	text-indent: -15px;
	margin: 10px 0 10px 15px;
	word-break: keep-all;
}
.card-body>span:first-child {
	font-weight: 600;
}
.card-body>span:first-child {
	color: #ababab; font-size: 0.9rem;
}
#load {
	width: 800px; float: left;
}
</style>

<% 
List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("myReview");
%>
<div id="myReview-container">
<h3>작성한 후기</h3>
<div id="card-list">
	<% 
	if(list == null || list.size() == 0) {
		%>
		<div>아직 작성한 후기가 없습니다.</div>
		<%
	} else {
		for(int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);
		%>
		<div class="card">
			<a href="LearnRun/cls?seq=<%=map.get("seq")%>"><!-- 클래스 상세페이지로 -->
				<div class="card-body">
					<span><%= map.get("title") %></span>&nbsp;&nbsp;
					<span><%= Utility.dateFormat((Timestamp)map.get("wdate")) %> 작성</span>
					<p>↳ <%= map.get("content") %></p>
				</div>
			</a>
		</div>
		<%
		}
	}
	%>
	<button id="load">+ 더 보기</button>
</div>
</div>

<script>
$(function(){
	if("<%= list %>" === "[]") {
		$("#load").hide();
	}
	
    $(".card").slice(0, 3).show();			// 초기갯수
    
    $("#load").click(function(e){			// 클릭 시 more
        e.preventDefault();
        $(".card:hidden").slice(0, 3).show(); // 클릭 시 more 갯수 지정
        
        if($(".card:hidden").length == 0){ 	// 컨텐츠 남아있는지 확인
            alert("게시물의 끝입니다."); 		// 컨텐츠 없을 시 alert 창 띄우기 
            $("#load").hide();
        }
    });
});

</script>
