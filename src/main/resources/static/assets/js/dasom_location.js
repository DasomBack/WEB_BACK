 $(document).ready(function() {
            $('.location-list li').click(function() {
                var text = $(this).text().trim();
                if (text === '다솜') {
                    return; // '다솜' 텍스트를 가진 요소는 클릭을 막음
                }

                var index = $(this).index() + 1;
                var input = $('#input' + index);

                if ($(this).hasClass('selected')) { // 이미 선택된 경우
                    // 선택 해제
                    $(this).removeClass('selected');
                    // input을 비활성화
                    input.prop('disabled', true);
                } else {
                    // 모든 li 요소의 선택 해제
                    $('.location-list li').removeClass('selected');
                    // 모든 input을 비활성화
                    $('.dasom-location-input input').prop('disabled', true);

                    // 클릭한 li 요소 선택
                    $(this).addClass('selected');
                    // 해당 input 활성화
                    input.prop('disabled', false);
                }
            });
        });