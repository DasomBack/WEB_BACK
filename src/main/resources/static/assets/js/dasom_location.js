let currentStartIndex = 0;
const itemsPerPage = 3;

function showItems(startIndex) {

    const items = document.querySelectorAll('.location-info');

    items.forEach((item, index) => {
        item.classList.add('hidden');
        item.classList.remove('showlist');
        if (index >= startIndex && index < startIndex + itemsPerPage) {
            item.classList.remove('hidden');
            item.classList.add('showlist');
        }
    });

    // 이전 버튼 제어
    if (currentStartIndex <= 0) {
        document.getElementById('prevButton').classList.add('hidden');
    } else {
        document.getElementById('prevButton').classList.remove('hidden');
    }

    // 다음 버튼 제어
    if (currentStartIndex + itemsPerPage >= items.length) {
        document.getElementById('nextButton').classList.add('hidden');
    } else {
        document.getElementById('nextButton').classList.remove('hidden');
    }
}

function showNextItems() {
    const items = document.querySelectorAll('.location-info');
    currentStartIndex += itemsPerPage;
    showItems(currentStartIndex);
}

function showPreviousItems() {
    const items = document.querySelectorAll('.location-info');
    currentStartIndex -= itemsPerPage;
    showItems(currentStartIndex);
}

// 페이지 로드 시 처음 3개의 항목을 표시
showItems(currentStartIndex);

/////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////

function initiateLocationSettings(){
    var graphicSelections= document.querySelectorAll(".dasom-location-register li");
    for (var i=0; i<graphicSelections.length; i++){
        if (graphicSelections[i].classList.contains('selected')){
            graphicSelections[i].classList.remove('selected');
        }
    }
    var inputLists = document.querySelectorAll(".dasom-location-input input");
    for (var i=0; i<inputLists.length; i++){
        inputLists[i].value="";
        inputLists[i].setAttribute('disabled', 'disabled');
    }
}

///////////////////////////////////
    var selectedItems_5 = [];
    var selectedItems_4 = [];
    var selectedItems_6 = [];
    var selectedItems_1 = [];
    var selectedItems_3 = [];

    document.querySelectorAll('.dropdown-menu .nav-item').forEach(function(item) {
        item.addEventListener('click', function() {


            var selectedText = this.getAttribute('data-value');

            console.log(selectedText);



            var parentDivId = this.closest('.dropdown-menu').id;
            var selectedItems=[];



            switch(parentDivId){

                case "1":
                    selectedItems=selectedItems_1;

                    break;

                case "3":

                    selectedItems=selectedItems_3;
                    break;

                case "4":
                    selectedItems=selectedItems_4;
                    break;

                case "5":

                    selectedItems=selectedItems_5;
                    break;

                case "6":
                    selectedItems=selectedItems_6;
                    break;

            }

            // 선택된 항목이 이미 있는지 확인
            if (selectedItems.includes(selectedText)) {
                // 이미 선택된 항목이면, 선택 해제
                selectedItems = selectedItems.filter(function(text) {
                    return text !== selectedText;
                });
                this.classList.remove('selected'); // 선택된 항목에 표시 제거
            } else {
                if (selectedItems.length < 2) {
                    // 새로운 항목 선택
                    selectedItems.push(selectedText);
                    this.classList.add('selected'); // 선택된 항목에 표시 추가
                }
            }

            // 선택된 항목들을 input 필드에 표시
            var selectedInput = document.getElementById('input'+parentDivId);

            selectedInput.value = selectedItems.join(', ');
            console.log(selectedItems);
            console.log(selectedItems_1);



        });
    });


    var radl=document.updateForm.location;
    var prev = null;
    for (var i =0; i<radl.length; i++){
        radl[i].addEventListener('change', function(){
            if (this !== prev){
                prev=this;
            }

            initiateLocationSettings();

        });

    }

//     // 드롭다운 항목 클릭 시 선택된 텍스트로 업데이트하는 코드
//     document.querySelectorAll('.nav-item').forEach(function(item) {
//         item.addEventListener('click', function() {
//             var selectedText = this.getAttribute('data-value');
//             var parentDropdown = this.closest('.dropdown-bordered').previousElementSibling;
//             parentDropdown.querySelector('li').textContent = selectedText;
//         });
//     });

    // 여러 개의 location-list li 항목을 클릭할 수 있도록 수정한 코드
   $('.location-list li').click(function() {

        console.log("here");
       var text = $(this).text().trim();

       console.log(text);
       if (text === '카페봇') {
           return; // '다솜' 텍스트를 가진 요소는 클릭을 막음
       }

       var index = $(this).index() + 1;
       var input = $('#input' + index);

       if ($(this).hasClass('selected')) { // 이미 선택된 경우
            console.log("already selected");
           // 선택 해제
           $(this).removeClass('selected');
           // input을 비활성화
           input.val("");
           input.prop('disabled', true);

       } else {
            console.log("not selected");
           // 클릭한 li 요소 선택
           $(this).addClass('selected');
           // 해당 input 활성화
           input.prop('disabled', false);
       }
   });
///////////////////////////////////


function inputEventListener() {

    var selectedItems_5 = [];
    var selectedItems_4 = [];
    var selectedItems_6 = [];
    var selectedItems_1 = [];
    var selectedItems_3 = [];

    document.querySelectorAll('.dropdown-menu .nav-item').forEach(function(item) {
        item.addEventListener('click', function() {


            var selectedText = this.getAttribute('data-value');


            if (selectedText == "직접입력"){

                var directInput= document.getElementById("directInput");
                directInput.classList.remove("hidden");
                directInput.classList.add("show");

                directInput.addEventListener('onchange',function(){
                    selectedText=directInput.value;
                });

            }

            var parentDivId = this.closest('.dropdown-menu').id;
            var selectedItems=[];



            switch(parentDivId){

                case "1":
                    selectedItems=selectedItems_1;

                    break;

                case "3":

                    selectedItems=selectedItems_3;
                    break;

                case "4":
                    selectedItems=selectedItems_4;
                    break;

                case "5":

                    selectedItems=selectedItems_5;
                    break;

                case "6":
                    selectedItems=selectedItems_6;
                    break;

            }

            // 선택된 항목이 이미 있는지 확인
            if (selectedItems.includes(selectedText)) {
                // 이미 선택된 항목이면, 선택 해제
                selectedItems = selectedItems.filter(function(text) {
                    return text !== selectedText;
                });
                this.classList.remove('selected'); // 선택된 항목에 표시 제거
            } else {
                if (selectedItems.length < 2) {
                    // 새로운 항목 선택
                    selectedItems.push(selectedText);
                    this.classList.add('selected'); // 선택된 항목에 표시 추가
                }
            }

            // 선택된 항목들을 input 필드에 표시
            var selectedInput = document.getElementById('input'+parentDivId);

            selectedInput.value = selectedItems.join(', ');
            console.log(selectedInput.value);


        });
    });


    var radl=document.updateForm.location;
    var prev = null;
    for (var i =0; i<radl.length; i++){
        radl[i].addEventListener('change', function(){
            if (this !== prev){
                prev=this;
            }

            initiateLocationSettings();

        });

    }

//     // 드롭다운 항목 클릭 시 선택된 텍스트로 업데이트하는 코드
//     document.querySelectorAll('.nav-item').forEach(function(item) {
//         item.addEventListener('click', function() {
//             var selectedText = this.getAttribute('data-value');
//             var parentDropdown = this.closest('.dropdown-bordered').previousElementSibling;
//             parentDropdown.querySelector('li').textContent = selectedText;
//         });
//     });

    // 여러 개의 location-list li 항목을 클릭할 수 있도록 수정한 코드
   $('.location-list li').click(function() {

        console.log("here");
       var text = $(this).text().trim();

       console.log(text);
       if (text === '카페봇') {
           return; // '다솜' 텍스트를 가진 요소는 클릭을 막음
       }

       var index = $(this).index() + 1;
       var input = $('#input' + index);

       if ($(this).hasClass('selected')) { // 이미 선택된 경우
            console.log("already selected");
           // 선택 해제
           $(this).removeClass('selected');
           // input을 비활성화
           input.val("");
           input.prop('disabled', true);
       } else {
            console.log("not selected");
           // 클릭한 li 요소 선택
           $(this).addClass('selected');
           // 해당 input 활성화
           input.prop('disabled', false);
       }
   });
}



// 토글
const toggleList = document.querySelectorAll(".toggleSwitch");

toggleList.forEach(($toggle) => {
$toggle.onclick = () => {
  const locationId = $toggle.getAttribute("data-id");

  var xhr = new XMLHttpRequest();

  if ($toggle.classList.contains('active')){
    $toggle.classList.remove('active')
    var url = '/settings/dasom-locations/use?use='+false+'&id='+locationId;
    xhr.open('PATCH', url, true);
    xhr.onload=function(){
        if(xhr.status >= 200 && xhr.status<400){
            console.error("카페봇 위치 설정 상태 변경에 성공하였습니다.");
        }else{
            console.error("카페봇 위치 설정 상태 변경에 실패하였습니다");
        }
    };
    xhr.onerror = function(){
        console.error("[Location Settings Change Status- PATCH] Connection Error");
    }

    xhr.send();

  }
  else{
    $toggle.classList.toggle('active');
    var url = '/settings/dasom-locations/use?use='+true+'&id='+locationId;
    xhr.open('PATCH', url, true);
    xhr.onload=function(){
        if(xhr.status >= 200 && xhr.status<400){
            console.error("카페봇 위치 설정 상태 변경에 성공하였습니다.");
        }else{
            console.error("카페봇 위치 설정 상태 변경에 실패하였습니다");
        }
    };
    xhr.onerror = function(){
        console.error("[Location Settings Change Status- PATCH] Connection Error");
    }
    xhr.send();
  }
};
});


document.addEventListener('DOMContentLoaded', function() {

    var dropdownOptions = document.querySelectorAll('.dropdown-options li');



    // Add click event listener to each dropdown item
    dropdownOptions.forEach(function(option) {
        option.addEventListener('click', function() {


            // Get the value from the clicked item
            var selectedValue = option.getAttribute('data-value');

            // Find the input associated with the dropdown
            var inputField = option.closest('.location-group').querySelector('input.custom-input');

            // Set the value of the input field
            // inputField.value = selectedValue;

            // Optionally, close the dropdown after selection
            var dropdownMenu = option.closest('.dropdown-menu');
            dropdownMenu.classList.remove('show');
        });
    });

    var inputFields = document.querySelectorAll('input.custom-input');
    inputFields.forEach(function(input) {
        input.addEventListener('click', function() {
            var dropdownMenu = this.closest('.location-group').querySelector('.dropdown-menu');
            dropdownMenu.classList.add('show');
        });
    });

    document.addEventListener('click', function(event) {
        if (!event.target.closest('.location-group')) {
            var openDropdowns = document.querySelectorAll('.dropdown-menu.show');
            openDropdowns.forEach(function(menu) {
                menu.classList.remove('show');
            });
        }
    });
});




function deleteLocation(locationId){
    var xhr = new XMLHttpRequest();

    var url = '/settings/dasom-locations?id='+locationId;
    xhr.open('DELETE', url, true);
    xhr.onload=function(){
        if(xhr.status >= 200 && xhr.status<400){
            console.error("카페봇 위치 설정 삭제에 성공하였습니다.");
        }else{
            console.error("카페봇 위치 설정 삭제에 실패하였습니다");
        }
    };
    xhr.onerror = function(){
        console.error("[Location Settings DELETE - DELETE] Connection Error");
    }
    xhr.send();

}


function loadUpdateLocationContent(locationId){

    var xhr = new XMLHttpRequest();

    xhr.open('GET','/settings/dasom-locations/updatepage?id='+locationId, true);

    // 요청 성공할 경우 onload 설정
    xhr.onload=function(){
        if(xhr.status >= 200 && xhr.status<400){
            document.getElementById('location_input').innerHTML = xhr.responseText;


            var allSpans = document.querySelectorAll('[id^="settings"]');
            allSpans.forEach(function(span) {
                span.style.backgroundColor = ''; // 배경색 초기화
            });

            // 여기서 해당 id를 가진 요소의 배경색을 변경
            var locationSpan = document.getElementById('settings' + locationId);
            if(locationSpan) {
                locationSpan.style.backgroundColor = '#F5DEB3'; // 연한 갈색
            }

            inputEventListener();


        }else{
            console.error("제품할인 수정 화면 페이지 로드에 실패하였습니다");
        }
    };

    // 요청 에러가 날 경우 onerror 설정
    xhr.onerror = function() {
        console.error("Connection error");
    };
    xhr.send();

}
