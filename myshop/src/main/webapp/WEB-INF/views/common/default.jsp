<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   body {
     margin:0px;
   }
   a {
   	 color:black;
   	 text-decoration:none;
   }
   #topmsg {
     width:1000px;
     height:28px;
     background:purple;
     margin:auto;
     color:white;
   }
   #topmsg #left {
     float:left;
     width:980px;
     height:28px;
     text-align:center;
     padding-top:3px;
     font-size:14px;
   }
   #topmsg #right {
     float:right;
     width:20px;
     height:28px;
     padding-top:3px;
   }
   header {
     width:1000px;
     height:40px;
     margin:auto;
     font-size:14px;
   }
   header #left {
     float:left;
   }
   header #right {
     float:right;
   }
   header #mymenu {
     position:relative;
     display:inline-block;
     height:25px;
   }
   header #mymenu #mysub { 
     padding-left:0px;
     position:absolute;
     left:-15px;
     top:8px;
     border:1px solid purple;
     padding:4px;
     z-index:10;
     background:white;
     visibility:hidden;
   }
   header #mymenu #mysub li {
     list-style-type:none;
     width:70px;
     text-align:center;
    
   }
   header #mymenu2 {
     position:relative;
     display:inline-block;
     height:25px;
   }
   header #mymenu2 #mysub2 { 
     padding-left:0px;
     position:absolute;
     left:-15px;
     top:8px;
     border:1px solid purple;
     padding:4px;
     z-index:10;
     background:white;
     visibility:hidden;
   }
   header #mymenu2 #mysub2 li {
     list-style-type:none;
     width:90px;
     text-align:center;
   }
   header a {
     text-decoration:none;
     color:black;
   }
   nav {
     width:1000px;
     height:40px;
     margin:auto;
   }
   nav #main {
     padding-left:0px;
   }
   nav #main > li {
      list-style-type:none;
      display:inline-block;
      width:130px;
      height:40px;
      text-align:center;
      font-size:15px;
   }
   nav #main > li:first-child {
      width:200px;
   }
   nav #main > li:last-child {
      width:230px;
   }
   nav #category {
   		position:relative;
   }
   nav #category .dae {
   		box-sizing:border-box;
   		position:absolute;
   		padding-left:0px;
   		background:white;
   		left:40px;
   		top:20px;
   		display:none;
   }
   nav #category .dae li {
   		border:1px solid grey;
   		list-style:none;
   		height:30px;
   		width:120px;
   		line-height:30px;
   }
   nav .dae > li {
   		position:relative;
   }
   nav .dae .jung {
   		position:absolute;
   		padding-left:0px;
   		background:white;
   		left:120px;
   		top:-1px;
   		display:none;
   }
   nav .dae .jung li {
   		border:1px solid grey;
   		list-style:none;
   		height:30px;
   		width:120px;
   }
   nav .jung > li {
   		position:relative;
   }
   nav .jung .so {
   		position:absolute;
   		padding-left:0px;
   		background:white;
   		left:120px;
   		top:-1px;
   		display:none;
   }
   nav .jung .so li {
   		border:1px solid grey;
   		list-style:none;
   		height:30px;
   		width:120px;
   }
   #image {
      width:1400px;
      height:300px;		
      margin:auto;
   }
   footer {
      width:1000px;
      height:100px;
      margin:auto;
   }
   
 </style>
 <script src="http://code.jquery.com/jquery-latest.js"></script>
 <script>
   $(function()
   {
	   $("#mymenu").mouseover(function()
	   {
		   $("#mysub").css("visibility","visible");
	   });
	   $("#mymenu").mouseout(function()
	   {
		   $("#mysub").css("visibility","hidden");	   
	   });
   });
   $(function()
		   {
			   $("#mymenu2").mouseover(function()
			   {
				   $("#mysub2").css("visibility","visible");
			   });
			   $("#mymenu2").mouseout(function()
			   {
				   $("#mysub2").css("visibility","hidden");
			   });
		   });
   $(function(){
	   $("#category").mouseover(function(){
		   $("nav #category .dae").show()
	   })
	   $("#category").mouseout(function(){
		   $("nav #category .dae").hide()
	   })
   })
   $(function(){
	   $("nav .dae > li").mouseover(function(){
		   var n=$(this).index();
		   $("nav .dae .jung").eq(n).show()
	   })
	   $("nav .dae > li").mouseout(function(){
		   var n=$(this).index();
		   $("nav .dae .jung").eq(n).hide()
	   })
   })
   $(function(){
	   $("nav .jung > li").mouseover(function(){
		   var n=$(this).index();
		   $("nav .jung .so").eq(n).show()
	   })
	   $("nav .jung > li").mouseout(function(){
		   var n=$(this).index();
		   $("nav .jung .so").eq(n).hide()
	   })
   })
   $(function(){
	   $("nav li").mouseover(function(){
		   $(this).children("span").children("a").css("color","red")
	   })
	   $("nav li").mouseout(function(){
		   $(this).children("span").children("a").css("color","black")
	   })
   })
 </script>
</head>
  <decorator:head/>
<body>
   <div id="topmsg">
     <div id="left"> 쇼핑몰 오픈 이벤트  삼성 노트북 1,000원에 가져가세요 </div>
     <div id="right"> X </div>
   </div> <!-- 광고성 메시지 -->
   <header>
     <div id="left"> <a href="../main/main"> 로고 </a> </div>
     
     <div id="right">
    <c:if test="${userid == null}">
     <a href="../login/login"> 로그인 </a> | 
     <a href="../member/member_input"> 회원가입 </a> 
    </c:if>
    
    <c:if test="${userid != null }"> 
     ${name}님  |
     <a href="../login/logout"> 로그아웃 </a> |
     <span id="mymenu"> MyPage 
       <ul id="mysub">
         <li> <a href="../member/member_view"> 회원정보 </a> </li>
         <li> 주문목록 </li>
         <li> 적립금 </li>
         <li> 내가 쓴  글 </li>
         <li> <a href="../mypage/wishview"> Wish </a> </li>
         <li> <a href="../mypage/cartview"> 장바구니 </a> </li>
       </ul>
     </span>
    </c:if> 
    
     | 
    <span id="mymenu2">고객센터
    	<ul id="mysub2">
    		<li>자주묻는질문</li>
    		<li>고객의소리</li>
    		<li><a href="../custom/mtm">1:1질문</a></li>
    		<li>사이트안내</li>
    	</ul>
     </span>
    </div>
   </header>  <!-- 로그인,회원가입, 로고 -->
   <nav> 
     <ul id="main">
       <li id="category"> 카테고리
       	 <ul class="dae">
       	   <li><span><a href="../product/plist?pcode=p01">가전제품</a></span>
       	     <ul class="jung">
       	     	 <li><span><a href="../product/plist?pcode=p0101">TV</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010101">소형TV</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010102">중형TV</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010103">대형TV</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010104">초대형TV</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     	 <li><span><a href="../product/plist?pcode=p0102">냉장고</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010201">일반냉장고</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010202">양문형냉장고</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010203">와인냉장고</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010204">김치냉장고</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     	 <li><span><a href="../product/plist?pcode=p0103">세탁기</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010301">일반세탁기</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010302">드럼세탁기</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010303">미니세탁기</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010304">그외세탁기</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     	 <li><span><a href="../product/plist?pcode=p0104">컴퓨터</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010401">데스크탑</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010402">노트북</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010403">맥북</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010404">서버용</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     </ul>
       	   </li>
       	   <li><span>신선식품</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>농산물</span></li>
       	   	 	 <li><span>수산물</span></li>
       	   	 	 <li><span>축산물</span></li>
       	   	 </ul>
       	   </li>
       	   <li><span>가공식품</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>통조림</span></li>
       	   	 	 <li><span>라면</span></li>
       	   	 	 <li><span>과자</span></li>
       	   	 	 <li><span>음료수</span></li>
       	   	 </ul>
       	   </li>
       	   <li><span>수입식품</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>미국산</span></li>
       	   	 	 <li><span>유럽산</span></li>
       	   	 	 <li><span>중국산</span></li>
       	   	 	 <li><span>일본산</span></li>
       	   	 </ul>
       	   </li>
       	   <li><span>아동완구</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>로보트</span></li>
       	   	 	 <li><span>블레이드</span></li>
       	   	 	 <li><span>공놀이</span></li>
       	   	 	 <li><span>총기류</span></li>
       	   	 </ul>
       	   </li>
       	 </ul>
       </li>
       <li> 신상품 </li>
       <li> 베스트 </li>
       <li> 알뜰쇼핑 </li>
       <li> 특가/혜택 </li>
       <li> 검색폼 </li>
     </ul>
   </nav>

   <decorator:body/>
   
   <footer> <img src="../resources/img/footer.png" width="1000"> </footer> <!-- 사이트관련 내용 -->
</body>
</html>