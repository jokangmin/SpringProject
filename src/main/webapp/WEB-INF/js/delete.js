$(function(){
	var pg = $("#pg").val();
	var id = $("#id").val();
	var pwd = $("#pwd").val();
	
	$('#deleteButton').click(function(){
		
		var password = prompt("삭제할 아이디의 비밀번호를 입력하세요");
		if(password === pwd && password !== null && password.trim() !== ""){
			if (confirm("정말 삭제하겠습니까?")) {
				$.ajax({
					type : 'post',              
					url : '/spring/user/delete', 
					data: { id : id },
					dataType : 'text',      
					success : function() {
						 alert("회원삭제 완료");
						 location.href='/spring/user/getUserList?pg='+pg;
					},    
					error : function(e) {        
						console.log(e);
					}
				});
			}
		}else{
			alert("비밀번호가 틀렸습니다.");
		}
	});
	
});