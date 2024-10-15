<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadAJaxForm</title>
<link rel="stylesheet" href="../css/writeForm.css">
</head>
<body>
	<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://223.130.162.170:8090/spring/'" style="cursor: pointer;">
	<form id="uploadAJaxForm">
		<table border="1">
			<tr>
                <th><label for="imageName">상품명</label></th>
                <td>
                	<input type="text" id="imageName" name="imageName">
                </td>
            </tr>
            <tr>
                <th><label for="imageContent">상품 설명</label></th>
                <td>
                	<textarea id="imageContent" name="imageContent" style="width: 500px; height: 250px;"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<span id="showImageList">이미지 미리보기</span>
                	<img src="../image/camera.png" id="cameraimage" style="width: 100px; height: 100px;">
                	<input type="file" name="img[]" id="img" multiple = "multiple" style="visibility: hidden;">
                </td>
            </tr>
            <tr>
                <td colspan="2">
                	<div class="button-container">
	                    <input type="button" class="submit-btn" value="이미지 업로드" id="uploadAJaxbutton">
	                    <input type="reset" class="submit-btn" value="취소">
	                </div>
                </td>
            </tr>
		</table>
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/uploadAJax.js"></script>	
</body>
</html>