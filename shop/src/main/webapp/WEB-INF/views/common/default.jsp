<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nike</title>

    <script
      src="https://kit.fontawesome.com/ade3871eb5.js"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="../resources/css/style.css" />
    <link rel="stylesheet" href="../resources/css/main.css" />
    <script src="../resources/js/main.js" defer></script>
  </head>
</head>
  <decorator:head/>
<body>

   <!--Header 시작-->
	<header>
	<!-- Navbar -->
    <nav id="navbar">
      <div class="navbar__logo">
        <i class="fa-sharp fa-solid fa-star-and-crescent"></i>
        <a href="../main/main">Logo</a>
      </div>
      <div></div>
      <ul class="navbar__menu">
        <li class="navbar__menu__item">New Releases</li>
        <li class="navbar__menu__item">Men</li>
        <li class="navbar__menu__item">Women</li>
        <li class="navbar__menu__item">Kids</li>
        <li class="navbar__menu__item">SNKRS</li>
        <li class="navbar__menu__item">플래시세일</li>
      </ul>
      <div class="navbar__serach">
        <input type="search" placeholder="검색" />
      </div>

      <ul class="navbar__member">
        <li>회원정보</li>
        <li><a href="../member/login">로그인</a></li>
        <li><a href="../member/join">회원가입</a></li>
      </ul>

      <!-- Toggle button -->
      <button class="navbar__toggle-btn">
        <i class="fas fa-bars"></i>
      </button>
    </nav>
	</header>
   <decorator:body/>
   <footer>
   	<section id="bottom">
      2023 Nike - All rights reserved
    </section>
   </footer>
</body>
</html>