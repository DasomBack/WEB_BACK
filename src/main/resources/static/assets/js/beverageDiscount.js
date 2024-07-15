
document.addEventListener('DOMContentLoaded', function() {
        // 드롭다운 항목 클릭 시 선택된 텍스트로 업데이트하는 코드
        document.querySelectorAll('.dropdown-item').forEach(function(item) {
            item.addEventListener('click', function() {
                var selectedText = this.getAttribute('data-value');
                var parentDropdown = this.closest('.dropdown-menu').previousElementSibling;
                parentDropdown.querySelector('span').textContent = selectedText;
            });
        });

         // 검색 아이콘을 클릭하면 모달을 표시
        const productModal = document.querySelector('#productModal');
        const searchIcon = document.querySelector('#product_search_btn');
        const closeBtn = document.getElementById(".btn-secondary");

        searchIcon.addEventListener('click', function() {
        $('#productModal').show();

         });

        // 모달의 닫기 버튼을 클릭하면 모달을 숨김
        const closeButton = document.querySelector('#productModal .close');
        const secondaryButton = document.querySelector('#productModal .btn-secondary');

        closeButton.addEventListener('click', function() {
        $('#productModal').hide();
        });

        secondaryButton.addEventListener('click', function() {
        $('#productModal').hide();
        });

});

//커스텀 셀렉트 박스
let selectFlag;
$('.custom-select').on('click', function() {
  $(this).toggleClass('selected');
  if($(this).hasClass('selected')) {
    $('.custom-select-list').show();
  } else {
    $('.custom-select-list').hide();
  }
})

$('.custom-select').on('focusin', function() {
  $('.custom-select-list').show();
});

$('.custom-select').on('focusout', function() {
  if(!selectFlag) {
    $('.custom-select-list').hide();
  }
  $(this).removeClass('selected');
});

$('.custom-select-option').on('mouseenter', function() {
  selectFlag = true;
});

$('.custom-select-option').on('mouseout', function() {
  selectFlag = false;
});

$('.custom-select-option').on('click', function() {
  let value = $(this).attr('value');

  $('.custom-select-text').text($(this).text());
  $('.select-origin').val(value);
  $('.custom-select-list').hide();

  $('.select-origin').find('option').each(function(index, el) {
    if($(el).attr('value') == value) {
      $(el).attr('selected', 'selected');
    } else {
      $(el).removeAttr('selected');
    }
  });
});

/*
모든 필드를 입력하여야 등록 가능하다
function validateAndSubmit() {
  // Get form elements
  const store = document.getElementById('exampleInputStorename1').value;
  const name = document.getElementById('exampleInputUsername1').value;
  const phoneNum = document.getElementById('exampleInputPhonenum1').value;
  const email = document.getElementById('exampleInputEmail1').value;
  const password = document.getElementById('exampleInputPassword1').value;
  const passwordConfirm = document.getElementById('exampleInputPasswordConfirm1').value;
  const passwordMatchStatus = document.getElementById('passwordMatchStatus').className;

  // Check if all fields are filled
  if (!store || !name || !phoneNum || !email) {
    showModal('모든 필드를 올바르게 채워주세요.');
    return;
  }

  // Check if password is at least 6 characters
  else if (password.length < 6) {
    showModal('비밀번호는 6자리 이상이어야 합니다.');
    return;
  }

  // Check if passwords match
  else if (passwordMatchStatus !== 'match') {
    showModal('비밀번호가 일치하지 않습니다.');
    return;
  }

  // Submit the form
  document.getElementById('registerForm').submit();
}

function showModal(message) {
  // Get the modal
  const modal = document.getElementById('errorModal');

  // Change the modal message
  modal.querySelector('.modal-body p').textContent = message;

  // Show the modal
  $(modal).modal('show');
}*/
