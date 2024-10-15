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
	<h2 style="text-align: center; color:white;">SignUp</h2>
	<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://localhost:8080/spring/'" style="cursor: pointer;">
    <form id="writeForm" name="writeForm">
        <table border="1">
            <tr>
                <th><label for="name">이름</label></th>
                <td>
                	<input type="text" id="name" name="name" required>
                	<div id="nameDiv" style="color: red; font-size: 14px; text-align:left; margin-left:13px;"></div>
                </td>
            </tr>
            <tr>
                <th><label for="id">아이디</label></th>
                <td>
                	<input type="text" id="id" name="id" required>
                	 <div id="idDiv" style="color: red; font-size: 14px; text-align:left; margin-left:13px;"></div>
                </td>
            </tr>
            <tr>
                <th><label for="password">비밀번호</label></th>
                <td>
                	<input type="password" id="pwd" name="pwd" required>
                	<div id="pwdDiv" style="color: red; font-size: 14px; text-align:left; margin-left:13px;"></div>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<div class="button-container">
	                    <input type="button" class="submit-btn" id="writeButton" value="회원가입">
	                    <input type="reset" class="submit-btn" value="다시입력">
	                </div>
                </td>
            </tr>
        </table>
    </form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/writeForm.js"></script>
</body>
</html>