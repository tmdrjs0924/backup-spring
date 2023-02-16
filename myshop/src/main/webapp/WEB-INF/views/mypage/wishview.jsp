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
		section table {
			border-collapse:collapse;
		}
		section table tr{
			border-top:1px solid black;
		}
		section table tr:first-child{
			border-top:2px solid black;
		}
		section table tr:last-child{
			border-bottom:2px solid black;
		}
		section table span {
			display:inline-block;
			font-size:12px;
			line-height:20px;
			width:100px;
			height:20px;
			border:1px solid black;
			cursor:pointer;
			text-align:center;
			border-radius:2px;
		}
	</style>
	<script>
		function maincheck(my) {
			//alert(my.checked);
			var sub=document.getElementsByClassName("subcheck");
			//alert(sub.length);
			var len=sub.length;
			if(my.checked){
				for(i=0;i<len;i++)
					sub[i].checked=true;
				document.getElementById("up").checked=true;
				document.getElementById("down").checked=true;
			}
			else{
				for(i=0;i<len;i++)
					sub[i].checked=false;
				document.getElementById("up").checked=false;
				document.getElementById("down").checked=false;
			}
		}
		function subcheck(){
			var sub=document.getElementsByClassName("subcheck");
			var len=sub.length;
			var n=0;
			for(i=0;i<len;i++){
				if(sub[i].checked)
					n++;
			}
			//alert(n);
			if(len==n){
				document.getElementById("up").checked=true;
				document.getElementById("down").checked=true;
			}
			else{
				document.getElementById("up").checked=false;
				document.getElementById("down").checked=false;
			}
		}
		function wishdel(){
			// 여러 개 아이디 보내기
			var sub=document.getElementsByClassName("subcheck");
			var len=sub.length;
			var id="";
			for(i=0;i<len;i++){
				if(sub[i].checked){
					id=id+sub[i].value+",";
				}
				location="wishdel?id="+id;
			}
		}
	</script>
</head>
<body>
	
	<section>
	
		<table align="center" width="900">
			<caption><h3>찜한 상품</h3></caption>
			<tr>
				<td colspan="6">
					<input type="checkbox" onclick="maincheck(this)" id="up">전체선택
					<span id="sdel" onclick="wishdel()">선택삭제</span>
				</td>
			</tr>
			<c:if test="${empty wlist}">
			<tr>
				<td colspan="6" align="center" style="font-size:50px;">찜한 상품이 없습니다.</td>
			</tr>
			</c:if>
			<c:if test="${!empty wlist}">
			<c:forEach items="${wlist}" var="wvo">
			<tr>
				<td><input type="checkbox" class="subcheck" onclick="subcheck()" value="${wvo.id}"></td>
				<td width="120"><img src="../resources/pro/${wvo.pimg}" width="100"></td>
				<td>${wvo.title}</td>
				<td width="100">￦<fmt:formatNumber value="${wvo.price}" type="number"/></td>
				<td width="100">${wvo.writeday}</td>
				<td width="120">
					<span onclick="location='cart_add?pcode=${wvo.pcode}'">장바구니 담기</span><br>
					<span style="margin-top:5px;" onclick="location='wishdel?id=${wvo.id}'">삭제</span>
				</td>
			</tr>
			</c:forEach>
			</c:if>
			<tr>
				<td colspan="6" align="left">
					<input type="checkbox" onclick="maincheck(this)" id="down">전체선택
					<span id="sdel" onclick="wishdel()">선택삭제</span>
				</td>
			</tr>
		</table>
	
	</section>
</body>
</html>