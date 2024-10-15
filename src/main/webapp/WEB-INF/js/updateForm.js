$(function(){
	var pg = $("#pg").val();
	var id = $("#id").val();
	var pwd = $("#pwd").val();

	$('#updateButton').click(function(){
		$('#pwdDiv').empty();
		$('#nameDiv').empty();
		if($('#pwd').val() == ''){
			$('#pwdDiv').html('수정할 비밀번호를 입력하세요.').css('color', 'red');
		}else if($('#name').val() == ''){
			$('#nameDiv').html('수정할 이름을 입력하세요.').css('color', 'red');
		}else{
			$.ajax({
				type : 'post',              
				url : '/spring/user/update', 
				data: $('#updateForm').serialize(),
				dataType : 'text',      
				success : function(data) {
					 alert("회원정보수정 완료");
					 location.href='/spring/user/getUserList?pg='+pg;
				},    
				error : function(e) {        
					console.log(e);
				}
			});
		}
	});
	
});