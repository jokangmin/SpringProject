<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>test</title>
<link rel="stylesheet" href="../css/test.css">
</head>
<body>
	<section id="inc01">
	   <div class="big_txt">
	      <p class="b_txt">나의 생활과 인생에</p>
	      <p class="b_txt">한줄기 위로가</p>
	      <p class="b_txt">하나의 지식이 필요할 때</p>
	     <p class="b_txt">BOOBOOBOOK에서..</p>
	   </div>
	</section>
	<div class="marquee_title">
    	<h2>BooBooBook List</h2>
  	</div>
  	<div class="marquee_conts">
	     <ul>
	      <li class="big">
	       <a href="javascript:">
	         <img src="../image/book1.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book2.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="big">
	       <a href="javascript:">
	         <img src="../image/book3.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book4.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="big">
	       <a href="javascript:">
	         <img src="../image/book5.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book6.jpeg" alt="sample"/>
	       </a>
	     </li>
	       <li class="big">
	       <a href="javascript:">
	         <img src="../image/book7.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book8.jpeg" alt="sample"/>
	       </a>
	     </li>
   		</ul>
  	</div>
  	<div class="marquee_conts2">
	    <ul>
	      <li class="big">
	       <a href="javascript:">
	         <img src="../image/book9.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book10.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="big">
	       <a href="javascript:">
	         <img src="../image/book11.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book12.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="big">
	       <a href="javascript:">
	         <img src="../image/book13.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book14.jpeg" alt="sample"/>
	       </a>
	     </li>
	       <li class="big">
	       <a href="javascript:">
	         <img src="../image/book15.jpeg" alt="sample"/>
	       </a>
	     </li>
	      <li class="small">
	       <a href="javascript:">
	         <img src="../image/book16.jpeg" alt="sample"/>
	       </a>
	     </li>
   		</ul>
  	</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery.marquee@1.6.0/jquery.marquee.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.4/gsap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.4/ScrollTrigger.min.js"></script>
<script type="text/javascript">
let marquee = $(".marquee_conts").marquee({
    duration: 25000,
    delayBeforeStart: 500,
    direction: "left",
    startVisible: true,
    duplicated: true,
  });
let marquee2 = $(".marquee_conts2").marquee({
    duration: 25000,
    delayBeforeStart: 500,
    direction: "right",
    startVisible: true,
    duplicated: true,
  });

marqueePaused = false;

$("ul > li").mouseenter(function () {
    if (!marqueePaused) {
      marquee.marquee("pause");
      marquee2.marquee("pause");
    }
});

$("ul > li").mouseleave(function () {
    if (!marqueePaused) {
      marquee.marquee("resume");
      marquee2.marquee("resume");
    }
});



const textElements = gsap.utils.toArray('#inc01 .b_txt');
textElements.forEach(text => {
	gsap.to(text, {
		backgroundSize: '100%',
		ease: 'none',
		scrollTrigger: {
			trigger: text,
			start: 'center 30%',
			end: 'center 30%',
			scrub: true,
		},
	});
});

</script>	
</body>
</html>