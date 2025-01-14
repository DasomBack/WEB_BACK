<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promotions</title>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


    <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">

</head>
<body>
    <div class="card-body">
        <h4 class="card-title">제품할인 등록</h4>

        <form action="/api/promotion-discount/update" method="post">
            <div class="table-responsive first-table">
                <table class="table">
                    <thead>
                    <tr>
                        <th>품목</th>
                        <th>제품</th>
                        <th>정가(할인가)</th>
                        <th>할인값(원)</th>
                        <th>행사기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="my_dropdown">
                                <a class="dropbtn"><span id="selectedItem"> ${thepromo.category} </span></a>
                                <div class="dropdown-content">
                                    <a class ="dropdown-item" data-value="음료" >음료</a>
                                    <a class ="dropdown-item" data-value="베이커리">베이커리</a>
                                    <a class ="dropdown-item" data-value="케이크" >케이크</a>
                                    <a class ="dropdown-item" data-value="세트상품">세트상품</a>
                                </div>
                            </div>

                            <input type="hidden" id="categoryInput" name="menuPromoId" value="${thepromo.menuPromoId}">
                            <!-- category hidden input -->
                            <input type="hidden" id="categoryInput" name="category" value="BEVERAGE">


                        </td>
                        <td>
                            <div class="input-container">
                                <button type="button" class="search-button custom-input form-control"
                                        id="product_search_btn" >${thepromo.menu}
                                        <i class="icon-search" onclick="openMenuModal()"></i>
                                </button>
                                <input type="hidden" id="menunameInput" name="menu" value="${thepromo.menu}">

                            </div>
                        </td>
                        <td>
                            <div class="discount-section">
                                <p id="productPrice">${thepromo.price}원</p>
                                <input type="hidden" id="priceInput" name="price" value="${thepromo.price}">

                                <p id="discountPrice">(${thepromo.discPrice}원)</p>
                                <input type="hidden" id="discPriceInput" name="discPrice" value="${thepromo.discPrice}">

                            </div>
                        </td>
                        <td>
                            <div class="discount-section">
                                -&nbsp<input type="number" class="custom-input form-control"
                                       id="discountPriceInput" name="discVal" value="${thepromo.discVal}" placeholder="${thepromo.discVal}">

                                <button type="button" class="btn btn-outline-primary btn-sm"
                                        id="confirmDiscountPriceBtn" onclick="onclickConfirmDiscountPriceBtn()">확인
                                </button>
                            </div>
                        </td>
                        <td>
                            <div class="discount-section date">
                                <input type="date" class="custom-input form-control" id="startDate" name="startDate" value="${thepromo.startDate}">

                                &nbsp~&nbsp
                                <input type="date" class="custom-input form-control" id="endDate" name="endDate" value="${thepromo.endDate}">
                                <label class="custom-label">
                                    <!-- <c:choose>
                                        <c:when test="${thepromo.boolIsAlways eq 'true'}">
                                            <input type="checkbox" name="boolIsAlways" id="isAlwaysCheckbox" checked=true>
                                            ${thepromo.boolIsAlways}
                                            &nbsp상시
                                        </c:when>
                                        <c:when test="${thepromo.boolIsAlways eq 'false'}">
                                            <input type="checkbox" name="boolIsAlways" id="isAlwaysCheckbox" checked=false>
                                            ${thepromo.boolIsAlways}
                                            &nbsp상시
                                        </c:when>
                                    </c:choose> -->

                                    <input type="checkbox" name="boolIsAlways" is="isAlwaysCheckbox" ${thepromo.boolIsAlways eq 'true' ? 'checked' : ''}>
                                    &nbsp상시
                                </label>
                            </div>
                        </td>

                    </tr>

                    </tbody>
                </table>
            </div>


            <div class="table-responsive second-table">
                <table class="table">
                    <thead>
                    <tr>
                        <th>행사시간</th>
                        <th>멘트 발화시간</th>
                        <th>발화 횟수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="discount-section time">

                                <input id="eventStartTime" name="startTime" value="${thepromo.startTime}" class="timepicker text-center" jt-timepicker="" time="model.time" time-string="model.timeString" default-time="model.options.defaultTime" time-format="model.options.timeFormat" start-time="model.options.startTime" min-time="model.options.minTime" max-time="model.options.maxTime" interval="model.options.interval" dynamic="model.options.dynamic" scrollbar="model.options.scrollbar" dropdown="model.options.dropdown">

                                &nbsp~&nbsp
                                <input id="eventEndTime" name="endTime" value="${thepromo.endTime}" class="timepicker text-center" jt-timepicker="" time="model.time" time-string="model.timeString" default-time="model.options.defaultTime" time-format="model.options.timeFormat" start-time="model.options.startTime" min-time="model.options.minTime" max-time="model.options.maxTime" interval="model.options.interval" dynamic="model.options.dynamic" scrollbar="model.options.scrollbar" dropdown="model.options.dropdown">

                                <label class="custom-label" for="sameTimeCheckbox">
                                    <input type="checkbox" id="sameTimeCheckbox" name="boolEqlStoreOpr" ${thepromo.boolEqlStoreOpr eq 'true' ? 'checked' : ''}>
                                    &nbsp영업시간과 동일
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="discount-section time">
                                <input id="speechStartTime" name="mentStartTime" value="${thepromo.mentStartTime}" class="timepicker text-center" jt-timepicker="" time="model.time" time-string="model.timeString" default-time="model.options.defaultTime" time-format="model.options.timeFormat" start-time="model.options.startTime" min-time="model.options.minTime" max-time="model.options.maxTime" interval="model.options.interval" dynamic="model.options.dynamic" scrollbar="model.options.scrollbar" dropdown="model.options.dropdown">

                                &nbsp~&nbsp

                                <input name="mentEndTime" value="${thepromo.mentEndTime}" class="timepicker text-center" jt-timepicker="" time="model.time" time-string="model.timeString" default-time="model.options.defaultTime" time-format="model.options.timeFormat" start-time="model.options.startTime" min-time="model.options.minTime" max-time="model.options.maxTime" interval="model.options.interval" dynamic="model.options.dynamic" scrollbar="model.options.scrollbar" dropdown="model.options.dropdown">

                                <label class="custom-label">
                                    <input type="checkbox" name"boolEqlEventStart" ${thepromo.boolEqlEventStart eq 'true' ? 'checked' : ''}>
                                    &nbsp행사시간과 동일
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="my_dropdown">
                                <a class="dropbtn"><span id="selectedItem">${thepromo.interval}분 간격</span></a>
                                <div class="dropdown-content">
                                    <a class ="dropdown-item" data-value="5분 간격">5분 간격</a>
                                    <a class ="dropdown-item" data-value="10분 간격">10분 간격</a>
                                    <a class ="dropdown-item" data-value="15분 간격">15분 간격</a>
                                    <a class ="dropdown-item" data-value="20분 간격">20분 간격</a>
                                    <a class ="dropdown-item" data-value="30분 간격">30분 간격</a>
                                </div>
                            </div>

                            <input type="hidden" id="intervalInput" name="interval" value=10>

                        </td>
                    </tr>

                    </tbody>
                </table>
            </div>

            <div class="table-responsive third-table">
                <table class="table">
                    <thead>
                        <tr>
                            <th>할인 조건 추가</th>
                            <th>제품 소개</th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <div class="discount-section radio">
                                <label class="custom-label first-label" for="discountOptionNone">
                                    <input type="radio" name="isAddCond-k"
                                           id="discountOptionNone" onload="changeAdditionalOption(${thepromo.boolAddCond},'discountOptionYes','addDiscCond')" value="none" ${thepromo.boolAddCond eq 'false' ? 'checked' : ''}>
                                    없음
                                </label>
                                <label class="custom-label" for="discountOptionYes">
                                    <input type="radio" name="isAddCond-k"
                                           id="discountOptionYes" value="yes" ${thepromo.boolAddCond eq 'true' ? 'checked' : ''}>
                                    있음
                                </label>
                                <input type="hidden" id="isAddCondInput" value="false" name="boolAddCond">
                                <input type="text" class="custom-input form-control" id="addCondId" value="${thepromo.addDiscCond}" name="addDiscCond" ${thepromo.boolAddCond eq 'true' ? '' : 'disabled'}>
                            </div>
                        </td>
                        <td>
                            <div class="discount-section radio">
                                <label class="custom-label first-label" for="descriptionNone">
                                    <input type="radio" name="isAddDesc-k"
                                            id="descriptionNone" onload="changeAdditionalOption(${thepromo.boolAddDesc},'descriptionYes','addMenuDesc')" value="none" ${thepromo.boolAddDesc eq 'false' ? 'checked' : ''}>
                                    없음
                                </label>
                                <label class="custom-label" for="descriptionYes">
                                    <input type="radio" name="isAddDesc-k"
                                            id="descriptionYes" value="yes" ${thepromo.boolAddDesc eq 'true' ? 'checked' : ''}>
                                    있음
                                </label>
                                <input type="hidden" id="isAddDescInput" value="false" name="boolAddDesc">
                                <input type="text" class="custom-input form-control" id="addMenuDescId" value="${thepromo.addMenuDesc}" name="addMenuDesc" ${thepromo.boolAddDesc eq 'true' ? '' : 'disabled'}>

                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>

            <div class="table-responsive fourth-tableg">
                <table class="table">
                    <thead>
                        <tr>
                            <th>AI 카페봇 멘트 생성
                            </th>
                            <th>테스트 진행<span class="info">* 카페봇이 어떻게 말하는지 확인해보세요!</span>
                            </th>
                        </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <input type="hidden" class="ment-text-input" name="ment" id="ment-text">
                            <textarea id="ment-textarea" value="${thepromo.ment}" placeholder="${thepromo.ment}">${thepromo.ment}</textarea>
                            <div class="button-container">
                                <button type="button" onclick="createMent()" class="btn btn-outline-light btn-sm">멘트생성
                                </button>
                                <!-- <button type="button" class="btn btn-outline-light btn-sm">불러오기
                                </button> -->
                                <button type="button" class="btn btn-outline-light btn-sm">수정
                                </button>
                            </div>
                        </td>
                        <td class="test">
                            <button type="button" class="btn btn-primary">카페봇 홍보 테스트
                            </button>
                        </td>

                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-buttons">
                <button type="button" id="menupromotion-delete-btn" onclick="deletePromotion(${thepromo.menuPromoId})" class="btn btn-outline-primary">
                    삭제
                </button>
                <button type="submit" class="btn btn-primary">
                    수정
                </button>
            </div>
        </form>
        </div>

        <div id="testmodaal" disabled>

        </div>


    </div>

    <script src="${pageContext.request.contextPath}/static/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>


    <script src="${pageContext.request.contextPath}/static/assets/js/beverageDiscount.js"></script>



</body>
</html>