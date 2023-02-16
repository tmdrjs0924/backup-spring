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
		#aa tr td:first-child {
			background:#f6f6f6;
			border-top:0px;
		}
		#aa tr td:last-child {
			padding-left:5px;
		}
		#aa #caption {
			float:left;
			line-height:37px;
		}
		#bb tr:first-child td {
			border-top:0px;
		}
		table {
			border-collapse:collapse;
			margin-bottom:30px;
		}
		table td {
			height:28px;
			border:1px solid grey;
			border-left:0px;
			border-right:0px;
		}
		table tr:first-child {
			border-bottom:2px solid black;
		}
		table tr:last-child {
			border-bottom:2px solid black;
		}
	</style>
</head>
<body>
		
		<table width="1000" align="center" id="aa">
			<tr>
				<td colspan="2" style="background:none">
					<span id="caption">주문정보</span>
				</td>
			</tr>
			<tr>
				<td width="150">받는 분</td>
				<td align="left">${map.name}</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${map.phone}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td align="left">${map.juso}, ${map.juso_etc}</td>
			</tr>
			<tr>
				<td>배송 시 요청사항</td>
				<td>
					<!-- 배송방법(cla) => 0:문 앞, 1:경비실, 2:택배함, 3:편의점택배 -->
					<c:if test="${map.cla==0}">
						<span>문 앞</span>
					</c:if>
					<c:if test="${map.cla==1}">
						<span>경비실</span>
					</c:if>
					<c:if test="${map.cla==2}">
						<span>택배함</span>
					</c:if>
					<c:if test="${map.cla==3}">
						<span>편의점택배</span>
					</c:if>
				</td>
			</tr>
			<tr>
				<c:if test="${map.yoil==1}">
					<c:set var="yoil" value="일"/>
				</c:if>
				<c:if test="${map.yoil==2}">
					<c:set var="yoil" value="월"/>
				</c:if>
				<c:if test="${map.yoil==3}">
					<c:set var="yoil" value="화"/>
				</c:if>
				<c:if test="${map.yoil==4}">
					<c:set var="yoil" value="수"/>
				</c:if>
				<c:if test="${map.yoil==5}">
					<c:set var="yoil" value="목"/>
				</c:if>
				<c:if test="${map.yoil==6}">
					<c:set var="yoil" value="금"/>
				</c:if>
				<c:if test="${map.yoil==7}">
					<c:set var="yoil" value="토"/>
				</c:if>
				<td>배송예정일</td>
				<td>${map.bday}(${yoil})</td>
			</tr>
			<tr>
				<c:if test="${map.pay==0}">
					<c:set var="pay" value="신용/체크카드"/>
				</c:if>
				<c:if test="${map.pay==1}">
					<c:set var="pay" value="법인카드"/>
				</c:if>
				<c:if test="${map.pay==2}">
					<c:set var="pay" value="계좌이체"/>
				</c:if>
				<c:if test="${map.pay==3}">
					<c:set var="pay" value="휴대폰"/>
				</c:if>
				<c:if test="${map.pay==4}">
					<c:set var="pay" value="무통장입금"/>
				</c:if>
				<c:if test="${map.pay==5}">
					<c:set var="pay" value="쿠팡페이"/>
				</c:if>
				<td>결제수단</td>
				<td>${pay}</td>
			</tr>
		</table>
		
		<table width="1000" align="center" id="bb">
			<tr align="center">
				<td width="150"></td>
				<td>상품정보</td>
				<td width="100">상품가격</td>
				<td width="80">상품수량</td>
				<td width="120">총 결제금액</td>
			</tr>
			<tr align="center">
				<td><img src="../resources/pro/${map.pimg}" width="100"></td>
				<td align="left">${map.title}</td>
				<td>${map.price}</td>
				<td>${map.su}</td>
				<td>${map.cprice}</td>
			</tr>
		</table>
			
</body>
</html>