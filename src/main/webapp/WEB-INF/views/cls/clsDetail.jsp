<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page import="com.semi.learn.dto.ClsDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script type="text/javascript" src="resources/jquery/jquery.twbsPagination.min.js"></script>

<style>
#tbody tr {
	border-bottom: 1px solid #ced4da;
}
#tbody tr>td:first-child {
	vertical-align: top;
}
.reviewId {
	width: 600px; float: left;
}
.reviewId a {
	float: right;
}
.reviewContent {
	float: left;
}
#reviewForm textarea {
	width: 600px;
	height: 65px;
	display: inline-block;
}
form button {
	vertical-align: top;
	width: 80px;
	height: 65px;
	margin: 0 10px;
}
.profile-box {
    width: 50px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
    float: left;
}
.profile {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
/* 좋아요 기능 */
.like-btn {
  display: flex;
  justify-content: center;
  align-items: center;
}
.like-btn:active{
  transform: scale(0.9, 0.9);
}
.like-btn.active{
  animation: pop 0.6s 1;
}
.like-btn path {
  fill: #767676;
}
.like-btn.active path{
  fill: #ec3e3e;
}
.clone{
  position: absolute;
  animation: moveOutwards 0.9s 1;
  opacity: 0;
}
@keyframes moveOutwards{
  from {
    opacity: 1;
    transform: translate(0, 0);
  }
}
</style>
<%
MemberDto login = (MemberDto)session.getAttribute("login");
String id = "";
if(login != null) id = login.getId();


ClsDto list = (ClsDto)request.getAttribute("list");

List<Map<String, Object>> reviewlist = (List<Map<String, Object>>)request.getAttribute("reviewlist");
int totalPages = (Integer)request.getAttribute("totalPages");
%>

<div style="padding: 0 30px;">

	<table style="margin: auto;">
		<tr>
			<td rowspan="5">
				<img style="width: 500px; height: 300px; border-radius: 5%;" src="upload/<%=list.getNewfilename()%>" />
			</td>
			<td>
				<%=list.getCategory()%>
			</td>
		</tr>
		<tr>
			<td>
				<strong><%=list.getTitle()%></strong>
			</td>
		</tr>
		<tr>
			<td>
				<%=list.getId()%>
			</td>
		</tr>
		<tr>
			<td id="taking">
				<button type="button" id="takingBtn" class="btn btn-light">수강신청 하기</button>
			</td>
		</tr>
		<tr>
			<td>
				<a href="#" class="like-btn" style="float: left;">
				    <svg class="like_icon" width="28" height="26" 
				    	viewBox="0 0 44 39" fill="none" xmlns="http://www.w3.org/2000/svg">
					<path d="M13 2C6.925 2 2 6.925 2 13C2 24 15 34 22 36.326C29 34 42 24 42 13C42 6.925 37.075 2 31 2C27.28 2 23.99 3.847 22 6.674C20.9857 
					5.22921 19.6382 4.05009 18.0715 3.23649C16.5049 2.42289 14.7653 1.99875 13 2Z" />
					</svg>
				</a>
				<div style="float: left;">좋아요</div>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<%=list.getContent()%>
			</td>
		</tr>
	</table>
	<hr/>
  
  <!------------------------------------------------------------------------------------>
  <div style="text-align: left; width: 700px; margin: auto;">
	<h4>후기</h4>
	<div id="reviewForm"></div>
	
	<table>
		<tbody id="tbody">
		<%
		if(reviewlist.size() == 0) {
			%>
			<tr>
				<td>아직 작성된 후기가 없습니다.</td>
			</tr>
			<%
		} else {
		for(int i = 0; i < reviewlist.size(); i++) {
			Map<String, Object> map = reviewlist.get(i);
			%>
			<tr>
				<td>
					<div class="profile-box">
						<img class="profile" alt="프로필 사진" src="upload/<%= map.get("newfilename") %>" />
					</div>
				</td>
				<td>
					<div class="reviewId"><%= map.get("id") %></div>
					<% 
					if(id.equals(map.get("id"))) {
						%>
						<a href="#" id="show-update">수정</a>
						<% 
					}
					%>
					<div class="reviewContent"><%= map.get("content") %></div>
				</td>
			</tr>
			<%
		}
		}
		%>
		</tbody>
	</table>
	
	<div class="container">
		<nav aria-label="Page navigation">
			<ul class="pagination" id="pagination" style="justify-content:center"></ul>
		</nav>
	</div>

  </div>
</div>

	<!----------------------------------------------------------------------------------->
	<script type="text/javascript">
		$(document).ready(function () {
			if("<%=id%>" !== "") {
				$.ajax({
					url: "/LearnRun/clsDetailAf",
					type:"get",
					data:{"id": "<%=id%>", "seq": <%=list.getSeq()%>},
					success:function(arr) {
						if(arr[0]) {
							$('#takingBtn').text('수강 취소');
							/* 강의 듣기 버튼 */
							$('#taking').append('<a href="/LearnRun/lesson?cls_seq=' + <%=list.getSeq()%> 
												+ '" class="btn btn-secondary">강의 들으러 가기</a>');
							/* 후기 작성칸 */
							let str = '<form action="/LearnRun/writeReview" method="post">'
									+ '<input type="hidden" name="cls_seq" value="<%= list.getSeq() %>" />'
					  	  			+ '<input type="hidden" name="id" value="<%= id %>" />'
					  	  	  		+ '<textarea name="content" class="form-control"></textarea>'
					  				+ '<button id="writeBtn" type="button" class="btn btn-light">작성</button></form>';
							$('#reviewForm').append(str);
						}
						if(arr[1]) {
							/* 좋아요 활성화 */
							$('.like-btn').addClass('active');
						}
					},
					error:function() {
						alert('error');
					}
				});
			}
			
			$('#writeBtn').click(function () {
				/* 빈칸 검사 */
				if($(this).prev().val().trim() == ""){
					alert("내용을 입력해주세요");
					return;
				} else {
					$(this).parent().submit();
				}
			});
			
			$("#show-update").click(function () {
				let str = '<form action="/LearnRun/updateReview" method="post">'
					+ '<input type="hidden" name="cls_seq" value="<%= list.getSeq() %>" />'
	  	  			+ '<input type="hidden" name="id" value="<%= id %>" />'
	  	  	  		+ '<textarea name="content" class="form-control"><%= list.getContent() %></textarea>'
	  				+ '<button id="updateBtn" type="button" class="btn btn-light">작성</button></form>';
				$(this).next().html(str);
			});
			$("#updateBtn").click(function () {
				/* 빈칸 검사 */
				if($(this).prev().val().trim() == ""){
					alert("내용을 입력해주세요");
					return;
				} else {
					$(this).parent().submit();
				}
			});
			
			/* 수강신청 기능 */
			$("#takingBtn").click(function () {
				if("<%=id%>" === "") {
					alert('로그인 후 사용 가능합니다.');
					return;
				}
				$.ajax({
					url: "/LearnRun/takeCls",
					type:"post",
					data:{"id": "<%=id%>", "seq": <%=list.getSeq()%>},
					success:function(b) {
						if(b) {
							$('#takingBtn').text('수강 취소');
							/* 강의 듣기 버튼 */
							$('#taking').append('<a href="/LearnRun/lesson?cls_seq=' + <%=list.getSeq()%> 
												+ '" class="btn btn-secondary">강의 들으러 가기</a>');
						} else {
							$('#takingBtn').text('수강신청 하기');
							/* 강의 듣기 버튼 없애기 */
							$('#taking a').detach();
						}
					},
					error:function() {
						alert('error');
					}
				});
			});
			
			/* 좋아요 기능 */
			let button = document.querySelector(".like-btn");
			let icon = document.querySelector(".like_icon");
			
			button.addEventListener("click", ()=>{
				if("<%=id%>" === "") {
					alert('로그인 후 사용 가능합니다.');
					return;
				}
				$.ajax({
					url: "/LearnRun/likeCls",
					type:"post",
					data:{"id": "<%=id%>", "seq": <%=list.getSeq()%>},
					success:function(b) {
						button.classList.toggle("active");
					  	if(button.classList.contains("active")) {
					    	createClones(button);
					  	}
					},
					error:function() {
						alert('error');
					}
				});
				
			});
			function randomNum(min, max) {
			  return Math.floor(Math.random()*(max- min + 1 )+ min);
			}

			function negativePositve() {
			  return Math.random() < 0.5 ? -1 : 1;
			}

			function createClones(button) {
			  let numberOfClones = randomNum(2, 4);

			  for(let i=1; i<= numberOfClones; i++) {
			    let clone = icon.cloneNode(true);
			    let size = randomNum(8, 20);
			    button.appendChild(clone);
			    clone.setAttribute("width", size);
			    clone.setAttribute("height", size);
			    clone.classList.add("clone");
			    clone.style.transform = "translate("
				    + negativePositve() * randomNum(15, 30) + "px,"
				    + negativePositve() * randomNum(15, 30) + "px)";

			    let removeNode = setTimeout(() =>{
			      button.removeChild(clone);
			      clearTimeout(removeNode);
			    }, 800);
			  }
			}
		});
		
		/* 리뷰 페이지네이션 */
		$("#pagination").twbsPagination({
			totalPages: <%= totalPages %>,
			visiblePages: 10,
			first: '<span srid-hidden="true">«</span>',
			prev: '‹',
			next: '›',
			last: '<span srid-hidden="true">»</span>',
			initiateStartPageClick: false,
			onPageClick: function(event, page) {
				$.ajax({
					url: "/LearnRun/reviewPage",
					type:"get",
					data:{"cls_seq": <%=list.getSeq()%>, "pageNumber":page-1},
					success:function(list) {
						$('#tbody').html("");
						
						$.each(list, function(i, map) {
							let str = '<tr><td><div class="profile-box">'
									+ '<img class="profile" alt="프로필 사진" src="upload/' + map.newfilename + '" />'
									+ '</div></td><td>'
									+ '<div class="reviewId">' + map.id + '</div>';
							if("<%=id%>" === map.id) {
								str += '<a href="#" id="show-update">수정</a>';
							}
							str += '<div class="reviewContent">' + map.content + '</div>'
								+ '</td></tr>';
							$('#tbody').append(str);
						});
					},
					error:function() {
						alert('error');
					}
				});
			}
		});
		
	</script>
