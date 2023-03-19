<%@page import="com.semi.learn.dto.MemberDto"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles-extras" prefix="tilesx" %>
<tilesx:useAttribute name="current" />

<%
/* 로그인 세션 가져오기 (테스트하려면 아래 href의 아이디 수정) */
MemberDto login = (MemberDto)session.getAttribute("login");
%>

<div class="container">
  <div class="row">
    <div class="col">
      <div>마이페이지</div>
      
      <ul class="nav flex-column nav-pills">
        <li class="nav-item">
          <a class="nav-link ${current == 'myCls' ? 'active' : ''}" href="/LearnRun/myCls">수강중인 강의</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${current == 'manageCls' ? 'active' : ''}" href="/LearnRun/manageCls?id=<%=login.getId()%>">개설한 강의</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${current == 'myReview' ? 'active' : ''}" href="/LearnRun/myReview?id=admin">작성한 후기</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${current == 'updateMember' ? 'active' : ''}" href="/LearnRun/pwdCheck">내 정보 수정</a>
        </li>
        <li class="nav-item">
          <a class="nav-link ${current == 'quit' ? 'active' : ''}" href="/LearnRun/quit">회원 탈퇴</a>
        </li>
      </ul>
      
    </div>
  </div>
</div>