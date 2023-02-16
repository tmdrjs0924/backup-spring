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
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function juso_search()  // 우편번호 버튼 클릭시 호출 함수명
	  {
	    new daum.Postcode({
	        oncomplete: function(data) {
	          if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	              addr = data.roadAddress;
	          } else { // 사용자가 지번 주소를 선택했을 경우(J)
	              addr = data.jibunAddress;
	          }

	          // 우편번호와 주소 정보를 해당 필드에 넣는다.
	          document.form.zip.value = data.zonecode; // 우편번호
	          document.form.juso.value = addr;  // 주소
	          // 커서를 상세주소 필드로 이동한다.
	          document.form.juso_etc.focus();
	      }
	    }).open();
	  }
	</script>
</head>
<body>
	<c:if test="${bvo.gibon==1}">
		<c:set var="imsi" value="checked"/>
		<c:set var="chk" value="1"/>
	</c:if>
	<c:if test="${bvo.gibon!=1}">
		<c:set var="imsi" value=""/>
		<c:set var="chk" value="0"/>
	</c:if>

	<form name="form" method="post" action="baeup_ok">
	<input type="hidden" name="id" value="${bvo.id}">
		<table width="1000" align="center" id="add">
			<tr>
				<td colspan="2" style="background:none">
					<span id="left">배송지 수정</span>
				</td>
			</tr>
			<tr>
				<td width="150">받는 분</td>
				<td align="left"><input type="text" name="name" size="8" value="${bvo.name}"></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td align="left"><input type="text" name="phone" size="15" value="${bvo.phone}"></td>
			</tr>
			<tr>
				<td>주소</td>
				<td align="left">
					<div style="margin-bottom:4px;">
						<input type="text" name="zip" size="5" readonly value="${bvo.zip}">
						<input type="button" value="검색" onclick="juso_search()">
					</div>
					<div style="margin-bottom:4px;"><input type="text" name="juso" size="40" readonly value="${bvo.juso}"></div>
					<div style="margin-bottom:4px;"><input type="text" name="juso_etc" size="40" value="${bvo.juso_etc}"></div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="checkbox" name="gibon" value="1" ${imsi}>기본 배송지로 설정</td>
			</tr>
			<tr>
				<td colspan="2" style="background:none" align="center">
					<input type="submit" value="수정">
					<input type="button" value="삭제" onclick="location='baedel?id=${bvo.id}&chk=${chk}'">
				</td>
			</tr>
		</table>
	</form>
	
</body>
</html>