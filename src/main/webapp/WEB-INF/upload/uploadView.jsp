<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/uploadview.css">
</head>
<body>
<img alt="로고" src="../image/odiga_logo.png" id="logo_image" onclick="location='http://223.130.162.170:8090/spring/'" style="cursor: pointer; width:130px; height:65px;">
<table border="1" class="view">
	<tr>
		<td rowspan="3">
			<img src="https://kr.object.ncloudstorage.com/bitcamp-9th-bucket-141/storage/${userUploadDTO.imageFileName}" alt="${ userUploadDTO.imageName }"  width="200" height="200"/>
		</td>
		<td width="250">번호 : ${ userUploadDTO.seq }</td>
	</tr>
	<tr>
		<td>상품명 : ${ userUploadDTO.imageName }</td>
	</tr>
	<tr>
		<td>파일명 : ${ userUploadDTO.imageOriginalFileName }</td>
	</tr>
	<tr>
		<td colspan="2" height="200">
			<pre>${ userUploadDTO.imageContent}</pre>
		</td>
	</tr>
</table>
<div class="button-container">
	<input type="button" value="목록" onclick="location.href='/spring/upload/uploadList'" />
	<input type="button" value="수정" onclick="location.href='/spring/upload/uploadUpdateForm?seq=${ userUploadDTO.seq }'" />
</div>
</body>
</html>