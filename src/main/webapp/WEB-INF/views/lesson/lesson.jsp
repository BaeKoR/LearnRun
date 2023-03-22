<%@page import="java.util.List"%>
<%@page import="com.semi.learn.dto.LessonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link href="//vjs.zencdn.net/7.10.2/video-js.min.css" rel="stylesheet">
<script src="//vjs.zencdn.net/7.10.2/video.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/videojs-seek-buttons/dist/videojs-seek-buttons.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/videojs-seek-buttons/dist/videojs-seek-buttons.min.js"></script>
<style type="text/css">
	.vjs-default-skin .vjs-big-play-button {	border: 0;	}
</style>


<%
LessonDto dto = (LessonDto)request.getAttribute("dto");
List<LessonDto> list = (List<LessonDto>)request.getAttribute("list");
%>
	
<div style="height: 100%;">
	<!-- 강의 영상 video.js 사용 (cdn 삽입함) -->
	<div style="position:relative; padding-top:56.25%; width:100%;">
	<video
	  style="position:absolute; top:0; left:0; width:100%; height:100%;"
	  src=""
	  id="myVideo"
	  class="video-js vjs-big-play-centered vjs-default-skin vjs-big-play-button"
	  data-setup='{"controls": true, "autoplay": false, "preload": "auto", 
	  				"playbackRates": [0.5, 1, 1.2, 1.5, 1.8, 2]}'>
	  
	  <source id="mp4_src"  type="video/mp4" />
	  
	</video>
	</div>
	<!-- 강의 제목, 내용 -->
	<div>
		<p style="margin: 16px 30px;"><%= dto.getTitle() %></p><hr/>
		<p style="margin-left: 30px; white-space: pre-wrap;"><%= dto.getContent() %></p><br/>
	</div>
</div>

<script type="text/javascript">
	
	document.getElementById("mp4_src").src = "upload/<%= dto.getNewfilename() %>";
	
	var player = videojs("myVideo", {}, function(){
        // Player (this) is initialized and ready.
        this.on('ended', function(){
        	if(<%= list.get(list.size() - 1).getSeq() %> !== <%=dto.getSeq()%>) {
	            if (confirm("다음 차시로 넘거가겠습니까?")) {
	                location.href = "/LearnRun/lesson?cls_seq=<%= dto.getCls_seq() %>&les_seq=<%= dto.getSeq()+1 %>";
	            }
        	}
        });
        this.on('firstplay', function(){
            console.log('firstplay');
        });
	});
	
	/* 뒤로, 앞으로 버튼 */
	player.seekButtons({
	    forward: 10,
	    back: 10
    });
	
</script>

