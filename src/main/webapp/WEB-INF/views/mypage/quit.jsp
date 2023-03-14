<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<h3>회원 탈퇴</h3>
<div>탈퇴 시 안내사항</div>
<pre>서비스에 만족하지 못하셨나요? 탈퇴하기 전에 먼저 개선 요청을 해보시는 건 어떨까요?
그래도 탈퇴하시겠다면 탈퇴 전에 아래 유의사항을 꼭 읽어주세요!
🙇🏻‍♂️ 감사합니다 🙇🏻‍♀️
</pre>
<pre>
1. 탈퇴 시 계정과 관련된 모든 권한이 사라지며 복구할 수 없습니다.
2. 직접 작성한 콘텐츠(동영상, 게시물, 댓글 등)는 자동으로 삭제되지 않으며, 만일 삭제를 원하시면 탈퇴 이전에 삭제가 필요합니다.
3. 탈퇴 후 동일한 메일로 재가입이 가능하나, 탈퇴한 계정과 연동되지 않습니다.
4. 현재 비밀번호를 입력하고 탈퇴하기를 누르시면 위 내용에 동의하는 것으로 간주됩니다.
</pre>

<form action="quitAf" method="post">
	<input type="hidden" name="id" value="" /><!-- 세션저장된 아이디 -->
	<input type="password" name="pwd" class="form-control"/>
	<input type="submit" value="탈퇴하기" class="btn-primary"/>
</form>