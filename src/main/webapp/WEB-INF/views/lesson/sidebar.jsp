<%@page import="com.semi.learn.dto.QnaDto"%>
<%@page import="com.semi.learn.dto.LessonDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
List<LessonDto> list = (List<LessonDto>)request.getAttribute("list");
int cls_seq = (Integer)request.getAttribute("cls_seq");
int les_seq = (Integer)request.getAttribute("les_seq");

List<QnaDto> qnalist = (List<QnaDto>)request.getAttribute("qnalist");
int pageNumber = (Integer)request.getAttribute("pageNumber");
int totalPages = (Integer)request.getAttribute("totalPages");
%>


<!-- 탭 -->
<ul class="nav nav-tabs" id="myTab" role="tablist">

  <li class="nav-item" style="width: 50%; text-align: center;">
    <a class="nav-link active" id="list-tab" data-toggle="tab" href="#list" role="tab" aria-controls="list" aria-selected="true">
    	강의목차
    </a>
  </li>
  <li class="nav-item" style="width: 50%; text-align: center;">
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
  	  	<input type="hidden" name="id" value="sua" /><!-- 현재 로그인 아이디 -->
  	  	<input type="hidden" name="les_seq" value="<%= les_seq %>" />
  	  	
  	  	<textarea name="content" style=""></textarea>
  	  	<button type="submit" class="btn btn-light p-3" style="">작성</button>
  	  </form>
  	</div>
  	
  	<!-- 작성된 목록 -->
  	<table>
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
			  				<%= dto.getId() %>
			  				<pre><%= dto.getContent() %></pre>
			  				
			  				<button class="btn btn-sm" data-toggle="collapse" data-target="#ansForm<%=i%>">답글</button>
			  				<div class="collapse" id="ansForm<%=i%>">
						  	  <form action="/LearnRun/writeAns" method="post">
						  	  	<input type="hidden" name="cls_seq" value="<%= cls_seq %>" /><!-- 작성 후 다시 돌아오기 위해 -->
						  	  	<input type="hidden" name="id" value="sua" /><!-- 현재 로그인 아이디 -->
						  	  	<input type="hidden" name="les_seq" value="<%= les_seq %>" />
						  	  	<input type="hidden" name="seq" value="<%= dto.getSeq() %>" />
						  	  	<textarea name="content" style="vertical-align: middle;"></textarea>
						  	  	<button type="submit" class="btn btn-light p-3" style="vertical-align: middle;">작성</button>
						  	  </form>
						  	</div>
			  			</td>
			  		</tr>
			  		<%
		  		} else {
		  			%>
			  		<tr>
			  			<td>
			  				<div style='display: inline-block; vertical-align: top;'>↳ </div>
			  				<div style='display: inline-block;'>
				  				<%= dto.getId() %>
				  				<pre><%= dto.getContent() %></pre>
			  				</div>
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
			<strong><%= i + 1 %></strong>
			<%
		} else {
			%>
			<a href="#" onclick="goPage(<%= i %>)"><%= i + 1 %></a>
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
						str += "<tr><td><div style='display: inline-block; vertical-align: top;'>↳ </div>"
							+ "<div style='display: inline-block;'>" + dto.id
							+ "<pre>" + dto.content + "</pre>"
							+ "</div></td></tr>";
					} else {				/* 질문일 때 */
						str = "<tr><td>" + dto.id
							+ "<pre>" + dto.content + "</pre>"
							+ '<button class="btn btn-sm" data-toggle="collapse" data-target="#ansForm' + i + '">답글</button>'
			  				+ '<div class="collapse" id="ansForm' + i + '">'
						  	+ '<form action="/LearnRun/writeAns" method="post">'
						  	+ '<input type="hidden" name="cls_seq" value="<%= cls_seq %>" />'
						  	+ '<input type="hidden" name="id" value="sua" />'
						  	+ '<input type="hidden" name="les_seq" value="<%= les_seq %>" />'
						  	+ '<input type="hidden" name="seq" value="' + dto.seq + '" />'
						  	+ '<textarea name="content" style="vertical-align: middle;"></textarea>'
						  	+ '<button type="submit" class="btn btn-light p-3" style="vertical-align: middle;">작성</button>'
						  	+ '</form></div></td></tr>';
					}
					$('#tbody').append(str);
				});
				
				/* 페이지네이션 현재 페이지 바꾸기 */
				$('#pagination').html("");
				let str = "";
				for(let i = 0; i < <%=totalPages%>; i++) {
					if(i == pn) {
						str = "<strong>" + (i+1) + "</strong>";
					} else {
						str = "<a href='#' onclick='goPage(" + i 
								+ ")' style='font-weight: bold; text-decoration: none;'>"
								+ (i+1) + "</a>";
					}
					$('#pagination').append(str);
				}
			},
			error:function() {
				alert('error');
			}
		});
	}
</script>