 $(document).ready(function() {

 // 드롭다운 항목 클릭 시 선택된 텍스트로 업데이트하는 코드
         document.querySelectorAll('.nav-item').forEach(function(item) {
             item.addEventListener('click', function() {
                 var selectedText = this.getAttribute('data-value');
                 var parentDropdown = this.closest('.dropdown-bordered').previousElementSibling;
                 parentDropdown.querySelector('li').textContent = selectedText;
             });
         });

            // 여러 개의 location-list li 항목을 클릭할 수 있도록 수정한 코드
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
                       // 클릭한 li 요소 선택
                       $(this).addClass('selected');
                       // 해당 input 활성화
                       input.prop('disabled', false);
                   }
               });
           });