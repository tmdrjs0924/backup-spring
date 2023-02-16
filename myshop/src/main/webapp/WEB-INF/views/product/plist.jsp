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
		section #table td {
			width:220px;
			vertical-align:top;
			height:320px;
			border:1px solid white;
			padding:3px;
		}
		section #table td div {
			width:220px;
		}
		section #table td:hover {
			border:1px solid grey;
		}
	</style>
</head>
<body><!-- pimg, title, halin, price, 할인적용가격, 배송예정, 별점, 적립금 -->
	
	<section>
	
		<table align="center" width="990" id="table">
			<tr>
			<c:forEach items="${plist}" var="pvo" varStatus="sts">
				<td onclick="location='pcontent?pcode=${pvo.pcode}'">
					<div align="center" style="height:140px"><img src="../resources/pro/${pvo.pimg}" width="200" height="140px"></div>
					<div>${pvo.title}</div>
					<div><s><fmt:formatNumber value="${pvo.price}" type="number" pattern="#"/>원</s> <span style="color:orange">${pvo.halin}%</span></div>
					<div><fmt:formatNumber value="${pvo.price-(pvo.price*(pvo.halin/100))}" type="number" pattern="#"/>원</div>
					<div>${pvo.bday} 도착</div>
					<div>${pvo.star}</div>
					<div><fmt:formatNumber value="${pvo.price*(pvo.juk/100)}" type="number" pattern="#"/>원</div>
				</td>
			<c:if test="${sts.count%4==0}">
			</tr>
			<tr>
			</c:if>
			</c:forEach>
			</tr>
		</table>
		<div align="center">
			<c:forEach begin="${pstart}" end="${pend}" var="i">
				<c:if test="${page==i}">
					<a href="plist?pcode=${pcode}&page=${i}" style="color:red">${i}</a>
				</c:if>
				<c:if test="${page!=i}">
					<a href="plist?pcode=${pcode}&page=${i}">${i}</a>
				</c:if>
			</c:forEach>
		</div>
		
	</section>
</body>
</html>