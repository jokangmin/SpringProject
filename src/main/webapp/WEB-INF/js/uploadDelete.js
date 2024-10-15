$(function(){
	$("#all_checkbox").change(function(){
		let isChecked = $(this).is(':checked');
		$('.list_checkbox').prop('checked',isChecked);
	});
	
	$('.list_checkbox').change(function(){
		let total = $('.list_checkbox').length; // 리스트 체크박스 전체 개수
	    let checked = $('.list_checkbox:checked').length; // 체크된 리스트 체크박스 개수
	
	    if(total === checked) { // 모든 체크박스가 체크된 경우
	        $('#all_checkbox').prop('checked', true); // 전체 선택 체크박스 체크
	    } else {
	        $('#all_checkbox').prop('checked', false); // 하나라도 체크 해제되면 전체 선택 해제
	    }
	});
	
	$('#uploadDeleteButton').click(function(){
        let selectedSeqs = [];
        $('.list_checkbox:checked').each(function() {
        	let seq = $(this).closest('tr').find('td:eq(1)').text().trim();
            selectedSeqs.push(seq);
        });

        // 체크된 항목이 있는 경우에만 삭제 요청
        if (selectedSeqs.length > 0) {
            if (confirm('선택된 항목을 삭제하시겠습니까?')) {
            	$('#seqs').val(selectedSeqs.join(',')); // seq를 콤마로 구분하여 설정
                console.log("설정된 seqs 값: " + $('#seqs').val()); // 여기서 seqs 값 출력
                $('#delete_form').submit();
            }
        } else {
            alert('삭제할 항목을 선택하세요.');
        }
    });
	
});