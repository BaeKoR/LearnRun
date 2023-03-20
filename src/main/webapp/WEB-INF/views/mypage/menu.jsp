<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />

<%
/* 로그인 세션 가져오기 */
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<div class="container">
  <div class="row">
    <div class="col">
      <h2>mypage</h2>
      
      <ul class="nav flex-column nav-pills">
        <li class="nav-item">
          <a style="color: ${current == 'myCls' ? 'red':''} !important;" class="nav-link" href="/LearnRun/myCls?id=<%=login.getId()%>">수강 중인 강의</a>
        </li>
        <li class="nav-item">
          <a style="color: ${current == 'likeCls' ? 'red':''} !important;" class="nav-link" href="/LearnRun/likeCls?id=<%=login.getId()%>">좋아요를 누른 강의</a>
        </li>
        <li class="nav-item">
          <a style="color: ${current == 'manageCls' ? 'red':''} !important;" class="nav-link" href="/LearnRun/manageCls?id=<%=login.getId()%>">개설한 강의</a>
        </li>
        <li class="nav-item">
          <a style="color: ${current == 'myReview' ? 'red':''} !important;" class="nav-link" href="/LearnRun/myReview?id=<%=login.getId()%>">작성한 후기</a>
        </li>
        <li class="nav-item">
          <a style="color: ${current == 'updateMember' ? 'red':''} !important;" class="nav-link" href="/LearnRun/pwdCheck?id=<%=login.getId()%>">내 정보 수정</a>
        </li>
        <li class="nav-item">
          <a style="color: ${current == 'quit' ? 'red':''} !important;" class="nav-link" href="/LearnRun/quit?id=<%=login.getId()%>">회원 탈퇴</a>
        </li>
      </ul>
      
    </div>
  </div>
</div>