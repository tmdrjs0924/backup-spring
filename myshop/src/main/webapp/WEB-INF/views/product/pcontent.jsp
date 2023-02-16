<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		section {
			width:1000px;
			margin:auto;
			margin-top:50px;
		}
		section #title {
			width:1000px;
			height:400px;
			margin:auto;
		}
		section #title > #left {
			width:500px;
			height:400px;
			float:left;
		}
		section #title > #right {
			position:relative;
			width:500px;
			height:400px;
			float:right;
		}
		/* 
		section #suform {
			width:72px;
		}
		section #suform #su {
			width:43px;
			height:30px;
			font-size:20px;
			text-align:center;
		}
		section #suform #left {
			float:left;
		}
		section #suform #right {
			float:right;
		}
		 */
		section #content {
			width:1000px;
			height:600px;
			margin:auto;
			text-align:center;
		}
		section #hugi {
			width:1000px;
			height:200px;
			margin:auto;
			background:red;
		}
		section #mun {
			width:1000px;
			height:200px;
			margin:auto;
			background:pink;
		}
		section #etc {
			width:1000px;
			height:300px;
			margin:auto;
			background:blue;
		}
		section #su {
			width:40px;
			height:20px;
			outline:none;
		}
		section #ptitle {
			 font-size:25px;
			 color:brown;
			 font-weight:600;
		}
		section #price {
			font-size:14px;
			color:dimgrey;
		}
		section #phalin {
			color:orange;
			font-size:14px;
		}
		section #pprice {
			font-size:28px;
		}
		section #pjuk {
			font-size:13px;
			color:red;
			font-weight:600;
			border:1px solid red;
			border-radius:4px;
			text-align:center;
			width:80px;
			height:18px;
		}
		section #pbday {
			margin-top:10px;
			font-size:15px;
			color:blue;
		}
		section #pbaesong {
			margin-top:10px;
			font-size:15px;
		}
		section #suform {
			margin-top:20px;
			margin-bottom:20px;
		}
		section #btn img {
			border:1px solid grey;
			padding-left:53px;
			padding-right:53px;
			height:38px;
			border-radius:5px;
		}
		section #btn span {
			width:150px;
			height:30px;
			display:inline-block;
			font-size:20px;
			border:1px solid grey;
			padding-top:4px;
			padding-bottom:4px;
			text-align:center;
			border-radius:5px;
		}
		section #pmenu {
			width:1000px;
			height:40px;
			margin:auto;
		}
		section #pmenu #pul {
			padding-left:0px;
		}
		section #pmenu #pul #pli {
			list-style:none;
			float:left;
			background:#f6f6f6;
			width:248px;
			height:40px;
			border:1px solid black;
			text-align:center;
			line-height:40px;
		}
	</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
		$(function(){
			$("#su").spinner({
				min:1,
				max:10,
				spin:function(e,ui){	// spinner의 값을 바꿀 때 실행되는 함수
					//alert(ui.value)
					var price=ui.value*${pvo.price-(pvo.price*pvo.halin/100)};
					price=new Intl.NumberFormat().format(price);
					document.getElementById("pprice").innerText=price+"원";
				} 
			})
		})
		function wish(my){
			<c:if test="${userid!=null}">
				<c:set var="chk" value="true"/>
			</c:if>
			<c:if test="${userid==null}">
				<c:set var="chk" value="false"/>
			</c:if>
			if(${chk}){
					var chk=new XMLHttpRequest();
				if(my.src.indexOf("w1.png")==-1){
					chk.onload=function(){
						if(chk.responseText=="0")
							my.src="../resources/pro/w1.png";
					}
					chk.open("get","wish_del?pcode=${pvo.pcode}");
					chk.send();
				}
				else{
					chk.onload=function(){
						if(chk.responseText=="0")
							my.src="../resources/pro/w2.png";
					}
					chk.open("get","wish_add?pcode=${pvo.pcode}");
					chk.send();
					}
			}
			else{
				location="../login/login";
			}
		}
		function cart_add() {
			// 수량은 form태그에서 읽어온다
			var chk=new XMLHttpRequest();
			var su=document.getElementById("su").value;
			chk.onload=function() {
				//alert(chk.responseText);
				if(chk.responseText=="0") {
					// id=cart_move요소를 보이게 하기
					document.getElementById("cart_move").style.visibility="visible";
					setTimeout(function() {
						document.getElementById("cart_move").style.visibility="hidden";
					}, 3000);
					/* 
					if(confirm("장바구니로 이동하시겠습니까")) {
						location="cartview";
					}
					*/
				}	
				else {
					location="../login/login";
				}	   
			}
			chk.open("get","cart_add?pcode=${pvo.pcode}&su="+su);
			chk.send();
		}
		function gumae(){
			document.pform.submit();
		}
	</script>
	<style>
		section #cart_move {
			position:absolute;
			left:80px;
			top:270px;
			width:300px;
			height:100px;
			border:1px solid cornflowerblue;
			text-align:center;
			background:white;
			visibility:hidden;
		}
		section #cart_move #up {
			line-height:50px;
			font-size:15px;
		}
		section #cart_move #down {
			display:inline-block;
			background:white;
			font-size:14px;
			color:cornflowerblue;
			width:150px;
			height:30px;
			border:1px solid cornflowerblue;
			line-height:30px;
		}
	</style>
</head>
<body>
	
	<section>
		
		<div id="title">
			<div id="left" align="center"><img src="../resources/pro/${pvo.pimg}" width="400"></div>
			<div id="right">
				<div id="cart_move">
					<span id="up">상품이 장바구니에 담겼습니다</span>
					<span id="down" onclick="location='../mypage/cartview'" style="cursor:pointer">장바구니로 이동</span>
				</div>
				<form	name="pform" method="post" action="gumae">
				<input type="hidden" name="pcode" value="${pvo.pcode}">
				<div id="ptitle">${pvo.title}(${pvo.made})</div>
				<div>
					<c:forEach begin="1" end="${pvo.star}">
						<img src="../resources/img/star1.png" width="16">
					</c:forEach>
					<c:forEach begin="1" end="${5-pvo.star}">
						<img src="../resources/img/star2.png" width="16">
					</c:forEach>
				</div>
				<hr>
				<div id="price"><s><fmt:formatNumber value="${pvo.price}" type="number" pattern="#"/>원</s> <span id="phalin">${pvo.halin}%</span></div>
				<div id="pprice"><fmt:formatNumber value="${pvo.price-(pvo.price*pvo.halin/100)}" pattern="#"/>원</div>
				<div id="pjuk"><fmt:formatNumber value="${pvo.price*pvo.juk/100}" pattern="#"/>p 적립</div>
				<c:choose>
					<c:when test="${pvo.yoil==1}">
						<c:set var="yoil" value="일"/>
					</c:when>
					<c:when test="${pvo.yoil==2}">
						<c:set var="yoil" value="월"/>
					</c:when>
					<c:when test="${pvo.yoil==3}">
						<c:set var="yoil" value="화"/>
					</c:when>
					<c:when test="${pvo.yoil==4}">
						<c:set var="yoil" value="수"/>
					</c:when>
					<c:when test="${pvo.yoil==5}">
						<c:set var="yoil" value="목"/>
					</c:when>
					<c:when test="${pvo.yoil==6}">
						<c:set var="yoil" value="금"/>
					</c:when>
					<c:when test="${pvo.yoil==7}">
						<c:set var="yoil" value="토"/>
					</c:when>
				</c:choose>
				<div id="pbday">${pvo.bday}(${yoil}) 도착</div>
				<div id="pbaesong">
					<c:if test="${pvo.baesong==0}">
						무료배송
					</c:if>
					<c:if test="${pvo.baesong!=0}">
						배송비 <fmt:formatNumber value="${pvo.baesong}" type="number"/>원
					</c:if>
				</div>
				<div id="suform">
					<input type="text" name="su" id="su" value="1" readonly>
				<!-- 
					<div id="left"><input type="text" name="su" size="2" id="su" value="1"></div>
					<div id="right">
						<div><img src="../resources/img/top.png"></div>
						<div><img src="../resources/img/bottom.png"></div>
					</div>
				 -->
				</div>
				<div id="btn" style="clear:both;">
					<c:if test="${wcnt==true}">
						<img style="cursor:pointer" src="../resources/pro/w2.png" width="43" valign="bottom" onclick="wish(this)">
					</c:if>
					<c:if test="${wcnt!=true}">
						<img style="cursor:pointer" src="../resources/pro/w1.png" width="43" valign="bottom" onclick="wish(this)">
					</c:if>
					<span onclick="cart_add()" style="cursor:pointer">장바구니</span>
					<span onclick="gumae()">구매하기</span>
				</div>
				</form>
			</div>
		</div>
		
		<div id="pmenu">
			<ul id="pul">
				<li id="pli">상품상세</li>
				<li id="pli">상품후기</li>
				<li id="pli">상품문의</li>
				<li id="pli">배송/교환/반품 안내</li>
			</ul>
		</div>
		
		<div id="content">
			<img src="../resources/pro/${pvo.pimg}"	width="990" height="590">
		</div>
		<div id="hugi"></div>
		<div id="mun"></div>
		<div id="etc"></div>
	
	</section>
</body>
</html>