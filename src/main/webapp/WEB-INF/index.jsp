<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
    <nav>
		<button type="button" title="Home" onclick="location.reload()">
	   		<span>Home</span>
	    	<span class="material-symbols-outlined" aria-hidden="true" >home</span>
	    	<svg viewBox="0 0 300 300" aria-hidden="true">
	      		<g>
	        		<text fill="currentColor">
	          			<textPath xlink:href="#circlePath">Home</textPath>
	        		</text>
		        	<text fill="currentColor">
		          		<textPath xlink:href="#circlePath" startOffset="50%">Home</textPath>
		        	</text>
		      	</g>
		    </svg>
	  	</button>
		<button type="button" onclick="location.href='http://localhost:8080/spring/user/writeForm'">
		    <span>SignUp</span>
		    <span class="material-symbols-outlined" aria-hidden="true">SignUp</span>
		    <svg viewBox="0 0 300 300" aria-hidden="true">
		      	<g>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath">member</textPath>
			        </text>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath" startOffset="50%">member</textPath>
			        </text>
		      	</g>
		    </svg>
		 </button>
		  <button type="button" onclick="location.href='http://localhost:8080/spring/user/getUserList'">
		    <span>Services</span>
		    <span class="material-symbols-outlined" aria-hidden="true">Board</span>
		    <svg viewBox="0 0 300 300" aria-hidden="true">
			      <g>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath">Services</textPath>
			        </text>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath" startOffset="50%">Services</textPath>
			        </text>
			      </g>
		    </svg>
		  </button>
		  <button type="button" onclick="location.href='http://localhost:8080/spring/upload/uploadForm'">
		    <span>File</span>
		    <span class="material-symbols-outlined" aria-hidden="true">Upload</span>
		    <svg viewBox="0 0 300 300">
			      <g>
			        <text fill="currentColor" aria-hidden="true">
			          <textPath xlink:href="#circlePath">File</textPath>
			        </text>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath" startOffset="50%">File</textPath>
			        </text>
			      </g>
		    </svg>
		  </button>
		  <button type="button" onclick="location.href='http://localhost:8080/spring/upload/uploadAJaxForm'">
		    <span>File AJAX</span>
		    <span class="material-symbols-outlined" aria-hidden="true">Upload AJAX</span>
		    <svg viewBox="0 0 300 300">
			      <g>
			        <text fill="currentColor" aria-hidden="true">
			          <textPath xlink:href="#circlePath">File</textPath>
			        </text>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath" startOffset="50%">File</textPath>
			        </text>
			      </g>
		    </svg>
		  </button>
		  
		  <button type="button" onclick="location.href='http://localhost:8080/spring/upload/uploadList'">
		    <span>Image List</span>
		    <span class="material-symbols-outlined" aria-hidden="true">Image List</span>
		    <svg viewBox="0 0 300 300">
			      <g>
			        <text fill="currentColor" aria-hidden="true">
			          <textPath xlink:href="#circlePath">List</textPath>
			        </text>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath" startOffset="50%">List</textPath>
			        </text>
			      </g>
		    </svg>
		  </button>
		  
		  
		   <button type="button" onclick="location.href='http://localhost:8080/spring/upload/text'">
		    <span>test</span>
		    <span class="material-symbols-outlined" aria-hidden="true">test</span>
		    <svg viewBox="0 0 300 300">
			      <g>
			        <text fill="currentColor" aria-hidden="true">
			          <textPath xlink:href="#circlePath">test</textPath>
			        </text>
			        <text fill="currentColor">
			          <textPath xlink:href="#circlePath" startOffset="50%">test</textPath>
			        </text>
			      </g>
		    </svg>
		  </button>
	</nav>

	<!-- SVG template with dynamic text -->
	<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 300 300" width="0" height="0">
	  <defs>
	    <path id="circlePath" d="M 150, 150 m -50, 0 a 50,50 0 0,1 100,0 a 50,50 0 0,1 -100,0" />
	  </defs>
	</svg>
    
</body>
</html>

<!-- 
	Spring framework + Maven + MySQL + MyBatis(@Mapper) + JSP(jQuery)
	
	project : SpringProject
	
	파일 경로 정리해두기
 -->