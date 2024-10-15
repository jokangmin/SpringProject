<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/writeForm.css">
</head>
<body>
	<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://localhost:8080/spring/'" style="cursor: pointer;">
    <form id="updateForm" name="updateForm">
        <table border="1">
            <tr>
                <th><label for="name">수정할 이름</label></th>
                <td>
                	<input type="text" id="name" name="name" value="${ name }">
                	<div id="nameDiv" style="color: red; font-size: 14px; text-align:left; margin-left:13px;"></div>
                </td>
            </tr>
            <tr>
                <th><label for="id">아이디</label></th>
                <td>
                	<input type="text" id="id" name="id" value="${ id }" readonly>
                	<input type="hidden" id="pg" value="${pg}">
                </td>
            </tr>
            <tr>
                <th><label for="password">수정할 비밀번호</label></th>
                <td>
                	<input type="password" id="pwd" name="pwd" value="${ pwd }">
                	<div id="pwdDiv" style="color: red; font-size: 14px; text-align:left; margin-left:13px;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<div class="button-container">
                		<input type="button" class="submit-btn" id="listButton" onclick="location='http://localhost:8080/spring/user/getUserList?pg=${pg}'" value="목록">
	                    <input type="button" class="submit-btn" id="updateButton" value="회원정보수정">
	                    <input type="button" class="submit-btn" id="deleteButton" value="회원탈퇴">
	                </div>
                </td>
            </tr>
        </table>
    </form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/updateForm.js"></script>    
<script type="text/javascript" src="../js/delete.js"></script>    

</body>
</html>