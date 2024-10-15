$(function(){
	$('#cameraimage').click(function(){
		$('#img').trigger('click'); //강제 이벤트 발생
	});
	
	//이미지 미리보기
	$('#img').change(function(){
		$('#showImageList').empty();
		
		for(var i = 0; i<this.files.length; i++){
			readURL(this.files[i]);
		}
	});
	
	function readURL(file){
		var reader = new FileReader();
		
		var show;
		
		reader.onload = function(e){
			var img = document.createElement('img');
			img.src = e.target.result;
			img.width = 70;
			img.height = 70;
			$('#showImageList').append(img);
		}
		
		reader.readAsDataURL(file);
	}
	
	$('#uploadUpdatebutton').click(function(){
		let formData = new FormData($('#uploadUpdateForm')[0]);
		
		$.ajax({
			type: 'post',
			enctype: 'multipart/form-data',
			processData: false,
			contentType: false,
			url: '/spring/upload/uploadUpdate',
			data: formData,
			success: function(){
				location.href="/spring/upload/uploadList";		
			},
			error: function(e){
				console.log(e);
			}
			
		}); //ajax
	});
});
