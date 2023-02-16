<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<style>
		section {
			width:1000px;
			margin:auto;
		}
		input[type=radio], input[type=checkbox] {
			accent-color:black;
		}
		#buy tr td:first-child,
		#add tr td:first-child,
		#pay tr td:first-child,
		#bae tr td:first-child {
			background:#f6f6f6;
		}
		#buy tr td:last-child,
		#add tr td:last-child,
		#pay tr td:last-child,
		#bae tr td:last-child {
			padding-left:5px;
		}
		table {
			border-collapse:collapse;
			margin-top:20px; 
			margin-bottom:20px; 
		}
		table caption {
			height:50px;
		}
		table td {
			height:28px;
			border:1px solid grey;
			border-left:0px;
			border-right:0px;
		}
		table tr:first-child {
			border-top:2px solid black;
		}
		table tr:last-child {
			border-bottom:2px solid black;
		}
		#my {
			font-size:15px;
		}
	</style>
	<script>
		function member_phone(){
			if(confirm("연락처를 변경하시겠습니까?")){
				var chk=new XMLHttpRequest();
				var phone=document.gform.phone.value;
				chk.onload=function(){
					if(chk.responseText=="0")
						alert("오류발생");
				}
				chk.open("get","member_phone?phone="+phone);
				chk.send();
			}
		}
		function bae_search()	{
			open("baeview","","width=1050,height=350");
		}
		function chgcla(){
			var id=document.gform.id.value;
			var cla=document.gform.cla.value;
			open("chgcla?id="+id+"&cla="+cla,"","width=400,height=300");
		}
	</script>
</head>
<body>
	<section>
	
		<h2 align="left">주문/결제</h2>

		<form name="gform" method="post" action="gumae_ok">
		<input type="hidden" name="id" value="${bvo.id}">
		<input type="hidden" name="cla" value="${bvo.cla}">
		<input type="hidden" name="pcode" value="${pvo.pcode}">
		<input type="hidden" name="su" value="${pvo.su}">
		<input type="hidden" name="juk" value="0">
		<!-- 구매자 정보 -->
		<table width="1000" align="center" id="buy">
			<caption><h3 align="left">구매자 정보</h3></caption>
			<tr>
				<td width="150">구매자명</td>
				<td align="left">${mvo.name}</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td align="left">${mvo.email}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td align="left">
					<input type="text" name="phone" value="${mvo.phone}" size="15">
					<input type="button" value="전송" onclick="member_phone()">
				</td>
			</tr>
		</table>
	
		<!-- 배송지 정보 -->	
		<table width="1000" align="center" id="add">
			<caption>
				<h3 align="left">
					배송지 정보
					<c:if test="${bvo.gibon==1}">
						<span class="my" id="my">(기본 배송지)</span>
					</c:if>
					<c:if test="${bvo.gibon!=1}">
						<span class="my" id="my"></span>
					</c:if>
					<button type="button" onclick="bae_search()">배송지 변경</button>
				</h3>
			</caption>
			<tr>
				<td width="150">받는 분</td>
				<td align="left"><span class="my">${bvo.name}</span></td>
			</tr>
			<tr>
				<td>주소</td>
				<td align="left"><span class="my">${bvo.juso}, ${bvo.juso_etc}</span></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td align="left"><span class="my">${bvo.phone}</span></td>
			</tr>
			<tr>
				<td>배송 시 요청사항</td>
				<td align="left">
					<c:if test="${bvo.cla==0}">
						<c:set var="cla" value="문 앞"/>
					</c:if>
					<c:if test="${bvo.cla==1}">
						<c:set var="cla" value="경비실"/>
					</c:if>
					<c:if test="${bvo.cla==2}">
						<c:set var="cla" value="택배함"/>
					</c:if>
					<c:if test="${bvo.cla==3}">
						<c:set var="cla" value="편의점택배"/>
					</c:if>
					<span class="my" id="my2">${cla}</span>
					<input type="button" value="변경" onclick="chgcla()">
				</td>
			</tr>
		</table>
		
		<!-- 배송일 및 상품정보 -->
		<table width="1000" align="center" id="bae">
			<caption><h3 align="left">배송 1건</h3></caption>
			<tr>
				<td>상품명</td>
				<td>${pvo.title}</td>
			</tr>
			<tr>
				<td>수량</td>
				<td>${pvo.su}</td>
			</tr>
			<tr>
				<td width="150">도착예정일</td>
				<td>
					<c:choose>
						<c:when test="${pvo.yoil==1}">
							<c:set var="yoil" value="일요일"/>
						</c:when>
						<c:when test="${pvo.yoil==2}">
							<c:set var="yoil" value="월요일"/>
						</c:when>
						<c:when test="${pvo.yoil==3}">
							<c:set var="yoil" value="화요일"/>
						</c:when>
						<c:when test="${pvo.yoil==4}">
							<c:set var="yoil" value="수요일"/>
						</c:when>
						<c:when test="${pvo.yoil==5}">
							<c:set var="yoil" value="목요일"/>
						</c:when>
						<c:when test="${pvo.yoil==6}">
							<c:set var="yoil" value="금요일"/>
						</c:when>
						<c:when test="${pvo.yoil==7}">
							<c:set var="yoil" value="토요일"/>
						</c:when>
					</c:choose>
					${pvo.bday}(${yoil})
				</td>
			</tr>
			<tr>
				<td>비고</td>
				<td>오전 10시 이전 주문건은 당일출고</td>
			</tr>
		</table>
		
		<!-- 결제정보 -->
		<table width="1000" align="center" id="pay">
			<caption><h3 align="left">결제 정보</h3></caption>
			<tr>
				<td width="150">총결제금액</td>
				<td align="left">
					<input type="hidden" name="cprice" value="<fmt:formatNumber value='${(pvo.price-(pvo.price*(pvo.halin/100)))*pvo.su+pvo.baesong}' type='number' pattern='#'/>">
					<fmt:formatNumber value="${pvo.price-(pvo.price*pvo.halin/100)+pvo.baesong}" type="number" pattern="#"/>원
				</td>
			</tr>
			<tr>
				<td>배송비</td>
				<td align="left">
					<c:if test="${pvo.baesong==0}">
						무료배송
					</c:if>
					<c:if test="${pvo.baesong!=0}">
						<fmt:formatNumber value="${pvo.baesong}" type="number" pattern="#"/>원
					</c:if>
				</td>
			</tr>
			<tr>
				<td>적립금</td>
				<td align="left"><fmt:formatNumber value="${pvo.price*pvo.juk/100}" type="number" pattern="#"/></td>
			</tr>
			<tr>
				<td>결제방법</td>
				<td align="left" valign="top" style="padding-top:5px;">
					<input type="radio" name="pay" value="0" onclick="pay_change(0)" checked>신용/체크카드
					<input type="radio" name="pay" value="1" onclick="pay_change(1)">법인카드
					<input type="radio" name="pay" value="2" onclick="pay_change(2)">계좌이체
					<input type="radio" name="pay" value="3" onclick="pay_change(3)">휴대폰
					<input type="radio" name="pay" value="4" onclick="pay_change(4)">무통장입금
					<input type="radio" name="pay" value="4" onclick="pay_change(5)">쿠팡페이
					
					<hr>
					<div class="pay" style="display:block">
						*카드선택(개인)
						<select name="card">
							<option value="0">선택</option>
							<option value="1">국민</option>
							<option value="2">우리</option>
							<option value="3">신한</option>
							<option value="4">농협</option>
							<option value="5">하나</option>
							<option value="6">롯데</option>
							<option value="7">삼성</option>
						</select>
						<p>
						*할부기간
						<select name="gigan">
							<option value="0">일시불</option>
							<option value="1">3개월</option>
							<option value="2">6개월</option>
							<option value="3">12개월</option>
							<option value="4">24개월</option>
							<option value="5">36개월</option>
						</select>
						(5만 원 이상 결제 시, 할부가능)
						<p>
						<input type="checkbox" name="gibonpay" value="0" checked>
						기본 결제 수단으로 사용
					</div>
					
					<div class="pay">
						*카드선택(법인)
						<select name="card2">
							<option value="0">선택</option>
							<option value="1">국민</option>
							<option value="2">우리</option>
							<option value="3">신한</option>
							<option value="4">농협</option>
							<option value="5">하나</option>
							<option value="6">롯데</option>
							<option value="7">삼성</option>
						</select>
						<p>
						*할부기간
						<select name="gigan2">
							<option value="0">일시불</option>
							<option value="1">3개월</option>
							<option value="2">6개월</option>
							<option value="3">12개월</option>
							<option value="4">24개월</option>
							<option value="5">36개월</option>
						</select>
						(법인 카드는 일시불 결제만 가능)
						<p>
						<input type="checkbox" name="gibonpay" value="1">
						기본 결제 수단으로 사용
					</div>
					
					<div class="pay">
						*은행선택
						<select name="bank">
							<option value="0">선택</option>
							<option value="1">국민</option>
							<option value="2">우리</option>
							<option value="3">신한</option>
							<option value="4">농협</option>
							<option value="5">하나</option>
							<option value="6">카카오뱅크</option>
							<option value="7">기업</option>
						</select>
						<p>
						<input type="checkbox" name="gibonpay" value="2">
						기본 결제 수단으로 사용
					</div>
					
					<div class="pay">
						*통신사
						<select name="tong">
							<option value="0">선택</option>
							<option value="1">SKT</option>
							<option value="2">KT</option>
							<option value="3">LG</option>
							<option value="4">헬로모바일</option>
						</select>
						<p>
						<input type="checkbox" name="gibonpay" value="3">
						기본 결제 수단으로 사용
					</div>
					
					<div class="pay">
						*입금은행
						<select name="bank2">
							<option value="0">선택</option>
							<option value="1">국민</option>
							<option value="2">우리</option>
							<option value="3">신한</option>
							<option value="4">농협</option>
							<option value="5">하나</option>
							<option value="6">카카오뱅크</option>
							<option value="7">기업</option>
						</select><p>
						*입금기한, ${gihan}까지
						<p>
						<input type="checkbox" name="gibonpay" value="4">
						기본 결제 수단으로 사용
					</div>
					
					<div class="pay">
					<input type="hidden" name="coopay" value="0">
						*잔액 0원
						<p>
						* 잔액이 부족할 경우, 결제 진행시에 충전됩니다.
						<p>
						<input type="checkbox" name="gibonpay" value="5">
						기본 결제 수단으로 사용
					</div>
				</td>
			</tr>
		</table>
		<div align="center"><input type="submit" value="구매하기"></div>
		</form>

	<style>
		section .pay {
			width:800px;
			display:none;
			box-sizing:border-box;
			padding:10px 5px 10px 5px;
		}
		section hr {
			border-color:grey;
			border-top:0px;
		}
		section input[type=submit]{
			width:400px;
			height:50px;
			border:1px solid black;
			background:white;
			font-size:17px;
		}
	</style>
	<script>
		function pay_change(n){
			var pay=document.getElementsByClassName("pay");
			for(i=0;i<pay.length;i++)
				pay[i].style.display="none";
			
				pay[n].style.display="block";
		}
	</script>

	</section>
</body>
</html>