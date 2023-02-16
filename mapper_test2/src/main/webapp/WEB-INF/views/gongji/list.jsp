<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <style>
   #section {
      width:1000px;
      height:500px;
      margin:auto;
   }
   #section table {
     border-spacing:0px;
   }
   #section table tr:hover {
      background:#eeeeee;
   }
   #section table tr:first-child:hover {
      background:white;
   }
   #section table td {
     height:30px;
     font-size:13px;
   }
   #section table td {
     border-bottom:1px solid purple;
   }
   #section table tr:first-child td {
     border-top:2px solid purple;
     font-weight:900;
   }
   #section table tr:last-child td {
     border-bottom:2px solid purple;
   }
   #section a {
     color:purple;
   }
 </style>
 
  <div id="section">
    <table width="700" align="center">
      <caption> <h3> 공지사항 </h3></caption>
      <tr align="center">
        <td> 제목 </td>
        <td> 작성자 </td>
        <td> 조회수 </td>
        <td> 작성일 </td>
      </tr>
      
      <c:forEach items="${list}" var="gdto">
      <tr>
        <td> ${gdto.title } </td>
        <td align="center"> 관리자 </td>
        <td align="center"> ${gdto.readnum} </td>
        <td align="center"> ${gdto.writeday} </td>
      </tr>
      </c:forEach>
      
      <tr>
        <td colspan="4" align="center">
          <a href="write">공지사항 글쓰기</a>
        </td>
      </tr>
    </table>
  
  </div>
</body>
</html>