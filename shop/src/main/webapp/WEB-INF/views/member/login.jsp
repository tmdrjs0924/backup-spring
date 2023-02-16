<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <link rel="stylesheet" href="../resources/css/member/login.css" />
    <title>Document</title>
  </head>
  <body>
    <section id="login">
      <div class="login__form">
        <h3>로그인</h3>
        <form method="post" id="loginForm" action="login_ok">
          <div class="login__id">
            <input
              type="text"
              class="memberId"
              name="memberId"
              placeholder="아이디"
            />
          </div>
          <div class="login__chk login__id__chk"></div>
          <div class="login__pw">
            <input
              type="password"
              class="memberPw"
              name="memberPw"
              placeholder="비밀번호"
            />
          </div>
          <c:if test="${chk == 1 }">
            <div class="login__chk login__pw__chk">
              아이디 또는 비밀번호를 잘못입력했습니다
            </div>
          </c:if>
          <div class="login__sub">
            <input type="submit" class="login__submit" value="로그인" />
          </div>
        </form>
      </div>
    </section>
  </body>
</html>
