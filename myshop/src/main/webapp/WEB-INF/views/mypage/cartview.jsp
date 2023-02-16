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
		#sdel {
			display:inline-block;
			font-size:12px;
			line-height:20px;
			width:70px;
			height:20px;
			border:1px solid black;
			cursor:pointer;
			text-align:center;
			border-radius:2px;
		}
		.su {
			outline:none;
			width:25px;
		}
	</style>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script>
		$(function(){
			var $imsi=$(".su");
			$(".su").spinner({
				min:1,
				max:10,
				spin:function(e,ui){	// spinner의 값을 바꿀 때 실행되는 함수
					var n=$imsi.index(this);
					//alert(n);
					//alert(document.getElementsByClassName("pri")[n].value);
					var pri=document.getElementsByClassName("pri")[n].value;
					//alert(ui.value)
					var price=pri*ui.value;
					price=new Intl.NumberFormat().format(price);
					document.getElementsByClassName("price")[n].innerText="￦"+price;
					
					//alert(document.getElementsByClassName("pco")[n].value);
					var pcode=document.getElementsByClassName("pco")[n].value;
					var su=ui.value;
					var chk=new XMLHttpRequest();
					chk.onload=function(){
						if(chk.responseText=="1")
							alert("내부오류");
					}
					chk.open("get","cart_up2?pcode="+pcode+"&su="+su);
					chk.send();
				}
			});
		});
		function maincheck(my) {
			var sub=document.getElementsByClassName("subcheck");
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
			if(len==n){
				document.getElementById("up").checked=true;
				document.getElementById("down").checked=true;
			}
			else{
				document.getElementById("up").checked=false;
				document.getElementById("down").checked=false;
			}
			price_cal();
		}
		
		var proprice=[${proprice}];	//[5000,6000,8000]
		var prohalin=[${prohalin}];	//[0,5,10]
		var probaesong=[${probaesong}];	//[0,5000,10000]
		function price_cal(){
			var subcheck=document.getElementsByClassName("subcheck");
			var len=subcheck.length;
			var pro=new Array(len);
			
			var chongprice=0;
			var halin=0;
			var bprice=0;
			var total=0;
			for(i=0;i<len;i++){
				if(subcheck[i].checked){
					//수량
					var su=document.getElementsByClassName("su")[i].value;
					//총상품가격 product.price
					chongprice=chongprice+proprice[i]*su;
					//총할인금액 product.halin
					halin=halin+prohalin[i]*su;
					//총배송비 product.baesong
					bprice=bprice+probaesong[i];
				}
			}
			//총결제금액 
			total=chongprice+halin+bprice;
			//출력
			document.getElementById("chongprice").innerText=chongprice+"원";
			document.getElementById("halin").innerText=halin+"원";
			document.getElementById("bprice").innerText=bprice+"원";
			document.getElementById("total").innerText=total+"원";
		}
	</script>
</head>
<body>
	
	<section>
	
		<table align="center" width="900">
			<caption><h3>찜한 상품</h3></caption>
			<tr>
				<td colspan="2"><input type="checkbox" onclick="maincheck(this)" id="up"></td>
				<td align="center">상품내용</td>
				<td align="center">상품가격</td>
				<td align="center">상품수량</td>
				<td></td>
				<td></td>
			</tr>
			<c:if test="${empty clist}">
			<tr>
				<td colspan="7" align="center" style="font-size:50px;">장바구니가 비었습니다.</td>
			</tr>
			</c:if>
			<c:if test="${!empty clist}">
			<c:forEach items="${clist}" var="cvo">
			<tr>
				<td>
					<input type="hidden" class="pri" value="${cvo.price-(cvo.price*cvo.halin/100)}">
					<input type="hidden" class="pco" value="${cvo.pcode}">
					<input type="checkbox" class="subcheck" onclick="subcheck()" value="${cvo.id}">
				</td>
				<td width="120"><img src="../resources/pro/${cvo.pimg}" width="100"></td>
				<td>${cvo.title}</td>
				<td width="100" align="center" class="price">￦<fmt:formatNumber value="${(cvo.price-(cvo.price*cvo.halin/100))*cvo.su}" pattern="#,###" type="number"/></td>
				<td width="120" align="center"><input type="text" name="su" class="su" value="${cvo.su}" readonly></td>
				<td width="100">${cvo.writeday}</td>
				<td width="80">
					<span id="sdel" style="margin-top:5px;" onclick="location='cartdel?id=${cvo.id}'">삭제</span>
				</td>
			</tr>
			</c:forEach>
			</c:if>
			<tr>
				<td colspan="7" align="left">
					<input type="checkbox" onclick="maincheck(this)" id="down">전체선택
					<span id="sdel" onclick="wishdel()">선택삭제</span>
				</td>
			</tr>
			<tr>
				<td colspan="7" align="right" height="40">
					정가: <span id="chongprice">0원</span> /
					할인적용가: <span id="halin">0원</span> /
					배송비: <span id="bprice">0원</span> /
					총 결제금액: <span id="total">0원</span>
				</td>
			</tr>
		</table>
	
	</section>
	<script>
		function wishdel(){
			var sub=document.getElementsByClassName("subcheck");
			var len=sub.length;
			var id="";
			for(i=0;i<len;i++){
				if(sub[i].checked){
					id=id+sub[i].value+",";
				}
				location="cartdel?id="+id;
			}
		}
	</script>

</body>
</html>