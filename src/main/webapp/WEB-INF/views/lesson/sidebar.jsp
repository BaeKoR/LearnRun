<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page import="com.semi.learn.dto.QnaDto"%>
<%@page import="com.semi.learn.dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
MemberDto login = (MemberDto)session.getAttribute("login");

List<LessonDto> list = (List<LessonDto>)request.getAttribute("list");
int cls_seq = (Integer)request.getAttribute("cls_seq");
int les_seq = (Integer)request.getAttribute("les_seq");

List<QnaDto> qnalist = (List<QnaDto>)request.getAttribute("qnalist");
int pageNumber = (Integer)request.getAttribute("pageNumber");
int totalPages = (Integer)request.getAttribute("totalPages");
%>


<!-- 탭 -->
<ul class="nav nav-tabs" id="myTab" role="tablist">

  <li class="nav-item">
    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="true">
    	강의목차
    </a>
  </li>
  <li class="nav-item">
    <a class="nav-link" id="qna-tab" data-toggle="tab" href="#qna" role="tab" aria-controls="qna" aria-selected="false">
    	Q&A
    </a>
  </li>
  
</ul>


<div class="tab-content" id="myTabContent">
  <!-- 강의 목차 -->
  <div class="tab-pane fade show active" id="list" role="tabpanel" aria-labelledby="list-tab">
  	<ul class="list-group">
  	<%
  	for(int i = 0; i < list.size(); i++) {
  		LessonDto dto = list.get(i);
  		if(dto.getSeq() == les_seq) {
  			%>
  			<li class="list-group-item active">
  	  			<a href="/LearnRun/lesson?cls_seq=<%=cls_seq%>&les_seq=<%=dto.getSeq()%>">
  	  				<%= i+1 %>. <%= dto.getTitle() %>
  	  			</a>
  			</li>
  	  		<%
  		} else {
	  		%>
			<li class="list-group-item">
	  			<a href="/LearnRun/lesson?cls_seq=<%=cls_seq%>&les_seq=<%=dto.getSeq()%>">
	  				<%= i+1 %>. <%= dto.getTitle() %>
	  			</a>
			</li>
	  		<%
  		}
  	}
  	%>
  	</ul>
  </div>
  
  <!-------------------------------------------------------------------------->
  <!-- Q&A -->
  <div class="tab-pane fade" id="qna" role="tabpanel" aria-labelledby="qna-tab">
  	<!-- 입력창 -->
  	<div style="width: 100%;">
  	  <form action="/LearnRun/writeQue" method="post">
  	  	<input type="hidden" name="cls_seq" value="<%= cls_seq %>" /><!-- 작성 후 다시 돌아오기 위해 -->
  	  	<input type="hidden" name="id" value="<%= login.getId() %>" />
  	  	<input type="hidden" name="les_seq" value="<%= les_seq %>" />
  	  	
  	  	<textarea name="content"></textarea>
  	  	<button type="button" class="btn btn-light">작성</button>
  	  </form>
  	</div>
  	
  	<!-- 작성된 목록 -->
  	<table class="qnatable">
  	  <tbody id="tbody">
		<%
	  	if(qnalist == null || qnalist.size() == 0) {
	  		%>
	  		<tr>
	  			<td>질문을 작성해보세요!</td>
	  		</tr>
	  		<%
	  	} else {
		  	for(int i = 0; i < qnalist.size(); i++) {
		  		QnaDto dto = qnalist.get(i);
		  		if(dto.getStep() == 0) {
			  		%>
			  		<tr>
			  			<td>
			  				<p><%= dto.getId() %></p>
			  				<p><%= dto.getContent() %></p>
			  				
			  				<button class="btn btn-sm btn-dark toggle">답글</button>
			  				<div class="collapse">
						  	  <form action="/LearnRun/writeAns" method="post">
						  	  	<input type="hidden" name="cls_seq" value="<%= cls_seq %>" /><!-- 작성 후 다시 돌아오기 위해 -->
						  	  	<input type="hidden" name="id" value="<%= login.getId() %>" /><!-- 현재 로그인 아이디 -->
						  	  	<input type="hidden" name="les_seq" value="<%= les_seq %>" />
						  	  	<input type="hidden" name="seq" value="<%= dto.getSeq() %>" />
						  	  	<textarea name="content"></textarea>
						  	  	<button type="button" class="btn btn-light">작성</button>
						  	  </form>
						  	</div>
						  	<hr/>
			  			</td>
			  		</tr>
			  		<%
		  		} else {
		  			%>
			  		<tr>
			  			<td>
			  				<p>↳ <%= dto.getId() %></p>
			  				<p style="margin-left: 15px;"><%= dto.getContent() %></p>
			  				<hr/>
			  			</td>
			  		</tr>
			  		<%
		  		}
		  	}
	  	}
	  	%>  	  
  	  </tbody>
  	</table>
  	
  	<!-- 페이지네이션 -->
  	<div id="pagination">
  	<%
	for(int i = 0; i < totalPages; i++) {
		if(i == pageNumber) {	// 현재 페이지는 클릭 안되게끔
			%>
			<strong> <%= i + 1 %> </strong>
			<%
		} else {
			%>
			<a href="#" onclick="goPage(<%= i %>)"> <%= i + 1 %> </a>
			<%
		}
	}
	%>
  	</div>
  	
  </div>
  
</div>
<!----------------------------------------------------------------------------->
<script>
	function goPage(pn) {/* 페이지 이동 */
		$.ajax({
			url: "/LearnRun/qnalist",
			type:"get",
			data:{"les_seq":<%= les_seq %>, "pageNumber": pn},
			success:function(list) {
				
				/* Q&Q 리스트 페이지에 맞게 바꾸기 */
				$('#tbody').html("");
				$.each(list, function(i, dto) {
					
					let str = "";
					if(dto.step !== 0) {	/* 답글일 때 */
						str = "<tr><td>"
							+ "<p>↳ " + dto.id + "</p>"
							+ "<p style='margin-left: 15px;'>" + dto.content + "</p>"
							+ "<hr/></td></tr>";
							
					} else {				/* 질문일 때 */
						str = "<tr><td><p>" + dto.id + "</p>"
							+ "<p>" + dto.content + "</p>"
							+ '<button class="btn btn-sm btn-dark toggle">답글</button>'
			  				
							+ '<div class="collapse">'
						  	+ '<form action="/LearnRun/writeAns" method="post">'
						  	+ '<input type="hidden" name="cls_seq" value="<%= cls_seq %>" />'
						  	+ '<input type="hidden" name="id" value="<%= login.getId() %>" />'
						  	+ '<input type="hidden" name="les_seq" value="<%= les_seq %>" />'
						  	+ '<input type="hidden" name="seq" value="' + dto.seq + '" />'
						  	+ '<textarea name="content"></textarea>'
						  	+ '<button type="button" class="btn btn-light">작성</button>'
						  	+ '</form></div>' + '<hr/></td></tr>';
					}
					$('#tbody').append(str);
				});
				
				/* 페이지네이션 현재 페이지 바꾸기 */
				$('#pagination').html("");
				let str = "";
				for(let i = 0; i < <%=totalPages%>; i++) {
					if(i == pn) {
						str = "<strong> " + (i+1) + " </strong>";
					} else {
						str = "<a href='#' onclick='goPage(" + i 
								+ ")' style='font-weight: bold;'> "
								+ (i+1) + " </a>";
					}
					$('#pagination').append(str);
				}
				
				/* 답글 작성 토글 */
				$('.toggle').click(function(){
					$(this).next().fadeToggle('fast', 'linear');
				});
			},
			error:function() {
				alert('error');
			}
		});
	}
	
	$(document).ready(function () {
		/* 댓글, 답글 빈칸 검사 */
		$("form button").click(function () {
			if($(this).prev().val().trim() == ""){
				alert("내용을 입력해주세요");
				return;
			} else {
				$(this).parent().submit();
			}
		});
		
		/* 답글 작성 토글 */
		$('.toggle').click(function(){
			$(this).next().fadeToggle('fast', 'linear');
		});
	});
</script>