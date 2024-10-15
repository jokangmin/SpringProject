<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 목록</title>
<link rel="stylesheet" href="../css/board.css">
</head>
<body>
	<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://localhost:8080/spring/'" style="cursor: pointer; width:130px; height:65px;">
	<section class="notice">
	  <div class="page-title">
	        <div class="container">
	            <h3>📝 회원 리스트 📝</h3>
	        </div>
	    </div>
	   
	  <!-- board list area -->
	    <div id="board-list">
	        <div class="container">
	            <table class="board-table">
	                <thead>
	                <tr>
	                    <th scope="col" class="th-name">이름</th>
	                    <th scope="col" class="th-id">아이디</th>
	                    <th scope="col" class="th-pwd">비밀번호</th>
	                </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="data" items="${ map2.getUserList }">
		                	<tr>
		                		<td>${ data.name }</td>
		                    	<td><a href="/spring/user/updateForm?id=${ data.id }&pg=${ map2.pg }&pwd=${ data.pwd }&name=${ data.name }">${ data.id }</a></td>
		                    	<td>${ data.pwd }</td>
	                    	</tr>
		                </c:forEach>
	                </tbody>
	            </table>
	        </div>
	    </div>
	    
	    <div style='text-align: center; margin: 20px 0;'>
	    	<div>${ map2.userPaging.pagingHTML } </div>
	    </div>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/delete.js"></script>	
</body>
</html>