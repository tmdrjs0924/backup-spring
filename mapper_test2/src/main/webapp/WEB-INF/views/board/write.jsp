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
     height:430px;
     margin:auto;
     color:purple;
     
   }
   #section table {
     border-spacing:6px;
   }
   #section table td {
     font-size:13px;
   }
   #section #title {
      width:400px;
      height:28px;
      border:1px solid purple;
      outline:none;
   }
   #section #submit {
      width:200px;
      height:32px;
      border:1px solid purple;
      outline:none;
      background:white;
      color:purple;
      font-size:15px;
      font-weight:900;
   }
   #section #name {
      width:100px;
      height:28px;
      border:1px solid purple;
      outline:none;
   }
    #section #pwd {
      width:100px;
      height:28px;
      border:1px solid purple;
      outline:none;
   }
    #section #content {
      width:400px;
      height:120px;
      border:1px solid purple;
      outline:none;
   }
   #section input[type=checkbox] {
      width:16px;
      height:16px;
      accent-color:purple;
   }
 </style>
 <div id="section">
   <form method="post" action="write_ok">
    <table width="500" align="center">
      <caption> <h3> 자유게시판 글쓰기 </h3></caption>
      <tr>
        <td> 제 목 </td>
        <td> <input type="text" name="title" id="title"> </td>
      </tr>
      <tr>
        <td> 이 름 </td>
        <td> <input type="text" name="name" id="name"> </td>
      </tr>
      <tr>
        <td> 비밀번호 </td>
        <td> <input type="password" name="pwd" id="pwd"> </td>
      </tr>
      <tr>
        <td> 내 용 </td>
        <td> <textarea name="content" id="content"></textarea> </td>
      </tr>
      <tr>
        <td> 좋아하는<br>여행지 </td>
        <td>
          <input type="checkbox" name="dest" value="0">속초
          <input type="checkbox" name="dest" value="1">제주도
          <input type="checkbox" name="dest" value="2">태안
          <input type="checkbox" name="dest" value="3">영덕 <br>
          <input type="checkbox" name="dest" value="4">장흥
          <input type="checkbox" name="dest" value="5">독도
          <input type="checkbox" name="dest" value="6">해운대
          <input type="checkbox" name="dest" value="7">강화도
        </td>
      </tr>
      <tr>
        <td colspan="2" align="center"> 
          <input type="submit" value="글 쓰기" id="submit">
        </td>
      </tr>
    </table>
  </form>
 
 </div>
</body>
</html>