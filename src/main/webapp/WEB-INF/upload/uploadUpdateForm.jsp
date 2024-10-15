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
	<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://223.130.162.170:8090/spring/'" style="cursor: pointer;">
	<form id="uploadUpdateForm">
		<table border="1">
			<tr>
                <th><label for="imageName">상품명</label></th>
                <td>
                	<input type="text" id="imageName" name="imageName" value="${userUploadDTO.imageName}">
                </td>
            </tr>
            <tr>
                <th><label for="imageContent">상품 설명</label></th>
                <td>
                	<textarea id="imageContent" name="imageContent" style="width: 500px; height: 250px;">${userUploadDTO.imageContent}</textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<span id="showImageList">
                		<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-141/storage/${userUploadDTO.imageFileName}" 
                		alt="${ userUploadDTO.imageName }" width="100" height="100"/>
                	</span>
                	<img src="../image/camera.png" id="cameraimage" style="width: 100px; height: 100px;">
                	<input type="file" name="img" id="img" style="visibility: hidden;">
                	<input type="hidden" name="seq" value="${userUploadDTO.seq}">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<div class="button-container">
	                    <input type="button" class="submit-btn" value="이미지 정보 수정" id="uploadUpdatebutton">
	                    <input type="reset" class="submit-btn" value="취소">
	                </div>
                </td>
            </tr>
		</table>
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/uploadUpdateForm.js"></script>		
</body>
</html>