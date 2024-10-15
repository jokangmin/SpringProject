$(function(){

	$('#id').focus(function(){
		$('#check_id').empty();
	});

	//아이디 중복 체크
	$('#id').focusout(function(){
		$('#idDiv').empty();
		
		if($('#id').val() == '') $('#idDiv').html('먼저 아이디를 입력하세요.').css('color', 'red');
		else{
			$.ajax({
				type : 'get',              
				url : '/spring/user/checkId', 
				data: { id : $('#id').val() }, 
				dataType : 'text',      
				success : function(data) {
					 if(data !== "null"){
						$('#idDiv').text("사용 불가능").css('color', 'red');
						$('#id').focus();
					 }
					 else{
						$('#idDiv').text("사용 가능").css('color', 'blue');
						$('#pwd').focus();
					 }
				},    
				error : function(e) {        
					console.log(e);
				}
			});
		}
	});
	
	$('#writeButton').click(function(){
		$('#idDiv').empty();
		$('#pwdDiv').empty();
		$('#nameDiv').empty();
		if($('#id').val() == ''){
			$('#idDiv').html('아이디를 입력하세요.').css('color', 'red');
		}else if($('#pwd').val() == ''){
			$('#pwdDiv').html('비밀번호를 입력하세요.').css('color', 'red');
		}else if($('#name').val() == ''){
			$('#nameDiv').html('이름을 입력하세요.').css('color', 'red');
		}else{
			$.ajax({
				type : 'post',              
				url : '/spring/user/write', 
				data: $('#writeForm').serialize(),
				dataType : 'text',      
				success : function(data) {
					 alert("회원가입완료");
					 location.href='/spring/user/getUserList';
				},    
				error : function(e) {        
					console.log(e);
				}
			});
		}
	});
});