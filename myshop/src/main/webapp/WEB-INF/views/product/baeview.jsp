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
		#add tr td:first-child {
			background:#f6f6f6;
			border-top:0px;
		}
		#add tr td:last-child {
			padding-left:5px;
		}
		#add #left {
			float:left;
			font-size:22px;
			font-weight:bold;
			margin:5px 0;
		}
		#add #right {
			float:right;
			line-height:37px;
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
		#chuga {
			width:1000px;
			text-align:center;
		}
	</style>
	<script>
		function gumae_move(id,n,g,j,p,c,cla){
			opener.document.gform.id.value=id;
			opener.document.gform.cla.value=cla;
			var gibon="";
			if(g==1)
				gibon="(기본 배송지)";
			
			opener.document.getElementsByClassName("my")[0].innerText=gibon;
			opener.document.getElementsByClassName("my")[1].innerText=n;
			opener.document.getElementsByClassName("my")[2].innerText=j;
			opener.document.getElementsByClassName("my")[3].innerText=p;
			opener.document.getElementsByClassName("my")[4].innerText=c;
		}
	</script>
</head>
<body>

	<c:forEach items="${blist}" var="bvo">
		<table width="1000" align="center" id="add">
		<c:if test="${bvo.gibon==1}">
			<tr>
				<td colspan="2" style="background:none">
					<span id="left">기본 배송지</span>
					<span id="right">
						<input type="button" value="수정" onclick="location='baeup?id=${bvo.id}'">
						<input type="button" value="선택" onclick="gumae_move(${bvo.id},'${bvo.name}',${bvo.gibon},'${bvo.juso} ${bvo.juso_etc}','${bvo.phone}',${bvo.cla})">
					</span>
				</td>
			</tr>
		</c:if>
		<c:if test="${bvo.gibon!=1}">
			<tr>
				<td colspan="2" style="background:none">
					<span id="left">추가 배송지</span>
					<span id="right">
						<input type="button" value="수정" onclick="location='baeup?id=${bvo.id}'">
						<input type="button" value="선택" onclick="gumae_move(${bvo.id},'${bvo.name}',${bvo.gibon},'${bvo.juso} ${bvo.juso_etc}','${bvo.phone}','${cla}',${bvo.cla})">
					</span>
				</td>
			</tr>
		</c:if>
			<tr>
				<td width="150">받는 분</td>
				<td align="left">${bvo.name}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td align="left">
					<div style="margin-bottom:4px;">${bvo.juso}</div>
					<div style="margin-bottom:4px;">${bvo.juso_etc}</div>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td align="left">${bvo.phone}</td>
			</tr>
			<tr>
				<td>배송 시 요청사항</td>
				<td>
					<!-- 배송방법(cla) => 0:문 앞, 1:경비실, 2:택배함, 3:편의점택배 -->
					<c:if test="${bvo.cla==0}">
						<span>문 앞</span>
					</c:if>
					<c:if test="${bvo.cla==1}">
						<span>경비실</span>
					</c:if>
					<c:if test="${bvo.cla==2}">
						<span>택배함</span>
					</c:if>
					<c:if test="${bvo.cla==3}">
						<span>편의점택배</span>
					</c:if>
				</td>
			</tr>
		</table>
	</c:forEach>
	
	<div id="chuga">
		<input type="button" value="배송지 추가" onclick="location='jusoadd'">
	</div>
	<form name="baeup" method="post" action="baeup">
		<input type="hidden" name="id">
	</form>
	<script>
    function baeup(id) {
    	document.baeup.id.value=id;
    	document.baeup.submit();
   	}
	</script>
</body>
</html>