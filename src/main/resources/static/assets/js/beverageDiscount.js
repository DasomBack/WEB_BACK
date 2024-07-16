
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

        closeButton.addEventListener('click', function() {
        $('#productModal').hide();
        });

        // 제품 검색 모달의 제품 검색 기능
        var images = document.querySelectorAll('#itemList img');
            var selectedProductName = '';

            // 각각의 이미지에 클릭 이벤트를 추가합니다.
            for (var i = 0; i < images.length; i++) {
                images[i].addEventListener('click', function() {
                    // 클릭한 이미지의 부모 요소(li)의 id를 사용하여 p 태그를 찾음
                    var parentId = this.parentElement.id;
                    var productNameId = 'productName' + parentId.replace('item', '');
                    var productNameElement = document.getElementById(productNameId);

                    var productPriceId = 'productPrice' + parentId.replace('item', '');
                    var productPriceElement = document.getElementById(productPriceId);

                        selectedProductName = productNameElement.innerText;
                        selectedProductPrice = productPriceElement.innerText;

                        var selectBtn = document.getElementById('selectBtn');
                        selectBtn.style.display = 'inline-block';

                        // 더보기 버튼을 숨기기
                        var loadMoreBtn = document.getElementById('loadMoreBtn');
                        loadMoreBtn.style.display = 'none';

                        // 제품할인 등록 영역의 버튼에 제품명 설정
                        var discountProductBtn = document.getElementById('discountProductBtn');
                        discountProductBtn.innerText = selectedProductName;

                        var productPrice =  document.getElementById('productPrice');
                        productPrice.innerText = selectedProductPrice;

                });
            }

            // 선택 버튼 클릭 시 모달 창 닫기 이벤트 추가
            document.getElementById('selectBtn').addEventListener('click', function() {
                // 제품할인 등록 영역의 버튼에 제품명 설정
                var ProductSearchBtn = document.getElementById('product_search_btn');
                    ProductSearchBtn.innerText = selectedProductName;
                 var ProductPrice = document.getElementById('productPrice');
                    ProductPrice.innerText = selectedProductPrice;

                var selectButton = document.getElementById('selectBtn');
                selectButton.addEventListener('click', function() {
                $('#productModal').hide();
                });
            });

            // 검색 input 박스에 입력된 값으로 리스트를 필터링합니다.
            function filterProductList(query) {
                // 모든 리스트 항목을 선택합니다.
                var items = document.querySelectorAll('#itemList li');
                // 각 항목을 반복하면서 필터링합니다.
                for (var i = 0; i < items.length; i++) {
                    var item = items[i];
                    var productNameId = 'productName' + item.id.replace('item', '');
                    var productName = document.getElementById(productNameId).innerText;
                    // 검색어가 없으면 모든 항목을 표시합니다.
                    if (query === '') {
                        item.style.display = '';
                    } else if (productName.toLowerCase().indexOf(query.toLowerCase()) !== -1) {
                        // 제품명이 입력된 값과 일치하면 항목을 표시합니다.
                        item.style.display = '';
                    } else {
                        // 일치하지 않으면 항목을 숨깁니다.
                        item.style.display = 'none';
                    }
                }
            }

            // 할인가 입력 후 확인 버튼 클릭 시 할인가 영역에 할인된 금액 표시
                document.getElementById('confirmDiscountPriceBtn').addEventListener('click', function() {
                    var discountPriceInput = document.getElementById('discountPriceInput').value;
                    var ProductPriceText = document.getElementById('productPrice').innerText;
                    var discountPrice = parseInt(ProductPriceText.replace('원', '').replace(',', ''));

                    if (!isNaN(discountPriceInput) && discountPriceInput.trim() !== '') {
                        var discountedPrice = discountPriceInput - discountPrice;
                        document.getElementById('discountPrice').innerText = `(${discountedPrice.toLocaleString()}원)`;
                    }
                });

            //라디오 버튼 "없음" 일시, input 버튼이 disable 상태로 된다.


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

// 라디오버튼 "없음" 클릭시 input창 disable
function toggleInput(radioName, inputName) {
    $("input:radio[name=" + radioName + "]").click(function() {
        if ($("input[name=" + radioName + "]:checked").val() == "yes") {
            $("input:text[name=" + inputName + "]").attr("disabled", false);
        } else if ($("input[name=" + radioName + "]:checked").val() == "none") {
            $("input:text[name=" + inputName + "]").attr("disabled", true);
        }
    });
}

toggleInput("description", "descriptionText");
toggleInput("discountCondition", "discountConditionText");


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