<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>uploadForm</title>
<link rel="stylesheet" href="../css/writeForm.css">
</head>
<body>
	<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://localhost:8080/spring/'" style="cursor: pointer;">
	<form method="post" encType="multipart/form-data" action="/spring/upload/basicupload">
		<table border="1">
			<tr>
                <th><label for="imageName">상품명</label></th>
                <td>
                	<input type="text" id="imageName" name="imageName" required>
                </td>
            </tr>
            <tr>
                <th><label for="imageContent">상품 설명</label></th>
                <td>
                	<textarea id="imageContent" name="imageContent" style="width: 500px; height: 250px;"></textarea>
                </td>
            </tr>
             <%--
            <tr>
                <th><label for="img">파일</label></th>
                <td>
                	<input type="file" name="img">
          
                </td>
            </tr>
            <!-- 다중 업로드 할 때는 name 속성의 이름이 같아야 한다. => 서버에서 배열로 받는다. -->
            <tr>
                <th><label for="img">파일</label></th>
                <td>
                	<input type="file" name="img">
          
                </td>
            </tr>
            --%>
            
            <!-- 한번에 한개 또는 여러개의 파일을 선택 (드래그 등) => 서버에서 list로 받는다. -->
            <tr>
                <th><label for="img">파일</label></th>
                <td>
                	<input type="file" name="img[]" multiple = "multiple">
          
                </td>
            </tr>
            <tr>
            
                <td colspan="2">
                	<div class="button-container">
	                    <input type="submit" class="submit-btn" value="이미지 업로드">
	                    <input type="reset" class="submit-btn" value="취소">
	                </div>
                </td>
            </tr>
		</table>
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/upload.js"></script>	
</body>
</html>