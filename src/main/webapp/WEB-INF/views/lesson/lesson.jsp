<%@page import="com.semi.learn.dto.LessonDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
	<link href="//vjs.zencdn.net/7.10.2/video-js.min.css" rel="stylesheet">
	<script src="//vjs.zencdn.net/7.10.2/video.min.js"></script>
	<style type="text/css">
		.vjs-default-skin .vjs-big-play-button {	border: 0;	}
  	</style>
</head>

<body>
	<%
	LessonDto dto = (LessonDto)request.getAttribute("dto");
	%>
	
	<!-- 강의 영상 video.js 사용 (head에 cdn 삽입함) -->
	<video
	  id="myVideo"
	  class="video-js vjs-big-play-centered vjs-default-skin vjs-big-play-button"
	  width="900"
	  height="600"
	  data-setup='{"controls": true, "autoplay": false, "preload": "auto", 
	  				"playbackRates": [0.5, 1, 1.2, 1.5, 1.8, 2]}'>
	  
	  <source id="mp4_src" src="" type="video/mp4" />
	  
	</video>
	
	<!-- 강의 제목, 내용 -->
	<div>
		<p style="margin-left: 30px;"><%= dto.getTitle() %></p><hr/>
		<p style="margin-left: 30px;"><%= dto.getContent() %></p><br/>
	</div>
	
	
	<script type="text/javascript">
		/* 경로 변경하고, 새파일이름으로 변경해야함 */
		document.getElementById("mp4_src").src = "/LearnRun/resources/video/<%= dto.getFilename() %>";
		document.getElementById("myVideo").load();
		
		/* jQuery로는 비디오 조작 어려움 (cdn 넣어도 동작 안함)
		$(document).ready(function() {
		let url = "/LearnRun/resources/video/BigBuckBunny.mp4";
		let $video = $('video'),
		videoSrc = $('source', $video).attr('src', url);
		$video[0].load(); */
		
	    /* 재생, 정지 로그 출력
	    const video = document.getElementById('myVideo');
	
	    video.addEventListener('play', (event) => {
	        console.log('play');
	    });
	    video.addEventListener('pause', (event) => {
	        console.log('pause');
	    }); 
		});*/
	</script>
</body>
