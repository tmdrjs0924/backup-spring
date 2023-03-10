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
     <div id="left"> ????????? ?????? ?????????  ?????? ????????? 1,000?????? ??????????????? </div>
     <div id="right"> X </div>
   </div> <!-- ????????? ????????? -->
   <header>
     <div id="left"> <a href="../main/main"> ?????? </a> </div>
     
     <div id="right">
    <c:if test="${userid == null}">
     <a href="../login/login"> ????????? </a> | 
     <a href="../member/member_input"> ???????????? </a> 
    </c:if>
    
    <c:if test="${userid != null }"> 
     ${name}???  |
     <a href="../login/logout"> ???????????? </a> |
     <span id="mymenu"> MyPage 
       <ul id="mysub">
         <li> <a href="../member/member_view"> ???????????? </a> </li>
         <li> ???????????? </li>
         <li> ????????? </li>
         <li> ?????? ???  ??? </li>
         <li> <a href="../mypage/wishview"> Wish </a> </li>
         <li> <a href="../mypage/cartview"> ???????????? </a> </li>
       </ul>
     </span>
    </c:if> 
    
     | 
    <span id="mymenu2">????????????
    	<ul id="mysub2">
    		<li>??????????????????</li>
    		<li>???????????????</li>
    		<li><a href="../custom/mtm">1:1??????</a></li>
    		<li>???????????????</li>
    	</ul>
     </span>
    </div>
   </header>  <!-- ?????????,????????????, ?????? -->
   <nav> 
     <ul id="main">
       <li id="category"> ????????????
       	 <ul class="dae">
       	   <li><span><a href="../product/plist?pcode=p01">????????????</a></span>
       	     <ul class="jung">
       	     	 <li><span><a href="../product/plist?pcode=p0101">TV</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010101">??????TV</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010102">??????TV</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010103">??????TV</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010104">?????????TV</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     	 <li><span><a href="../product/plist?pcode=p0102">?????????</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010201">???????????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010202">??????????????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010203">???????????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010204">???????????????</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     	 <li><span><a href="../product/plist?pcode=p0103">?????????</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010301">???????????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010302">???????????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010303">???????????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010304">???????????????</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     	 <li><span><a href="../product/plist?pcode=p0104">?????????</a></span>
       	     	   <ul class="so">
       	     	   	 <li><span><a href="../product/plist?pcode=p010401">????????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010402">?????????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010403">??????</a></span></li>
       	     	   	 <li><span><a href="../product/plist?pcode=p010404">?????????</a></span></li>
       	     	   </ul>
       	     	 </li>
       	     </ul>
       	   </li>
       	   <li><span>????????????</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 </ul>
       	   </li>
       	   <li><span>????????????</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>??????</span></li>
       	   	 	 <li><span>??????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 </ul>
       	   </li>
       	   <li><span>????????????</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 </ul>
       	   </li>
       	   <li><span>????????????</span>
       	   	 <ul class="jung">
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>????????????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 	 <li><span>?????????</span></li>
       	   	 </ul>
       	   </li>
       	 </ul>
       </li>
       <li> ????????? </li>
       <li> ????????? </li>
       <li> ???????????? </li>
       <li> ??????/?????? </li>
       <li> ????????? </li>
     </ul>
   </nav>

   <decorator:body/>
   
   <footer> <img src="../resources/img/footer.png" width="1000"> </footer> <!-- ??????????????? ?????? -->
</body>
</html>