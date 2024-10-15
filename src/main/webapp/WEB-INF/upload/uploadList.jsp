<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 목록</title>
<link rel="stylesheet" href="../css/board.css">
</head>
<body>
<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://localhost:8080/spring/'" style="cursor: pointer; width:130px; height:65px;">
	<section class="notice">
	  <div class="page-title">
	        <div class="container">
	            <h3>📝 이미지 리스트 📝</h3>
	        </div>
	    </div>
	    <!-- board list area -->
	    <div id="board-list">
	        <div class="container">
	            <table class="board-table">
	                <thead>
	                <tr>
	                	<th><input type="checkbox" id="all_checkbox"></th>
	                	<th scope="col" class="th-seq">번호</th>
	                    <th scope="col" class="th-name">이름</th>
	                    <th scope="col" class="th-id">내용</th>
	                    <th scope="col" class="th-pwd">이미지</th>
	                </tr>
	                </thead>
	                <tbody>
		                <c:forEach var="data" items="${ map2.getImageList }">
		                	<tr>
		                		<td><input type="checkbox" class="list_checkbox" data-seq="${ data.seq }"></td>
		                		<td>${ data.seq }</td>
		                		<td>${ data.imageName }</td>
		                    	<td>${ data.imageContent }</td>
		                    	<td>
		                    		<span>
		                    			<%-- <img src="/spring/storage/${data.imageOriginalFileName}" width="300" height="300"> --%>
		                    			<!-- Naver Object -->
		                    			<a href="/spring/upload/uploadView?seq=${ data.seq }">
		                    				<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-141/storage/${data.imageFileName}" width="300" height="300"> 
		                    			</a>
		                    		</span>
		                    	</td>
	                    	</tr>
		                </c:forEach>
	                </tbody>
	            </table>
	             <div style="margin-top: 8px;">
	            	<form method="post" id="delete_form" action="/spring/upload/uploadDelete">
	            		<input type="button" value="선택삭제" id="uploadDeleteButton" name="uploadDeleteButton" class="btn btn-dark"/>
	            		<input type="hidden" name="seqs" id="seqs" value=""/>
	            	</form>
	            </div>
	        </div>
	    </div>
	    
	    <div style='text-align: center; margin: 20px 0;'>
	    	<div>${ map2.userImagePaging.pagingHTML } </div>
	    </div>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/uploadDelete.js"></script>		
</body>
</html>