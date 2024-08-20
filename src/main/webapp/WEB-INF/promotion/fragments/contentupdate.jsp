<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promotions</title>
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
                        <th>정가</th>
                        <th>할인값(원)</th>
                        <th>행사기간</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            <ul class="navbar-nav custom-input form-control">
                                <li class="nav-item dropdown d-lg-block">
                                    <a class="dropdown-bordered dropdown-toggle"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        <span id="selectedItem"> ${thepromo.category} </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                         aria-labelledby="messageDropdown">
                                        <a class="dropdown-item preview-item" data-value="음료">
                                            <div class="preview-item-content flex-grow">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    음료</p>
                                            </div>
                                        </a>
                                        <a class="dropdown-item preview-item" data-value="베이커리">
                                            <div class="preview-item-content flex-grow">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    베이커리</p>
                                            </div>
                                        </a>
                                        <a class="dropdown-item preview-item" data-value="케이크">
                                            <div class="preview-item-content flex-grow">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    케이크</p>
                                            </div>
                                        </a>
                                        <a class="dropdown-item preview-item" data-value="세트상품">
                                            <div class="preview-item-content flex-grow">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    세트상품</p>
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            </ul>

                            <input type="hidden" id="categoryInput" name="menuPromoId" value="${thepromo.menuPromoId}">
                            <!-- category hidden input -->
                            <input type="hidden" id="categoryInput" name="category" value="BEVERAGE">


                        </td>
                        <td>
                            <div class="input-container">
                                <!--<input type="text" class="custom-input form-control search" disabled>-->
                                <button type="button" class="search-button custom-input form-control"
                                        id="product_search_btn">${thepromo.menu}
                                        <i class="icon-search"></i>
                                </button>
                                <!-- menu name hidden input -->
                                <input type="hidden" id="menunameInput" name="menu" value="${thepromo.menu}">

                            </div>
                        </td>
                        <td>
                            <div class="discount-section">
                                <p id="productPrice">${thepromo.price}원</p>
                                <!-- menu name hidden input -->
                                <input type="hidden" id="priceInput" name="price" value="${thepromo.price}">

                                <p id="discountPrice">(${thepromo.discPrice}원)</p>
                                <!-- menu name hidden input -->
                                <input type="hidden" id="discPriceInput" name="discPrice" value="${thepromo.discPrice}">

                            </div>
                        </td>
                        <td>
                            <div class="discount-section">
                                -<input type="number" class="custom-input form-control"
                                       id="discountPriceInput" name="discVal" value="${thepromo.discVal}" placeholder="${thepromo.discVal}">

                                <button type="button" class="btn btn-outline-primary btn-sm"
                                        id="confirmDiscountPriceBtn">확인
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
                                <input type="time" class="custom-input form-control" id="eventStartTime" name="startTime" value="${thepromo.startTime}">

                                &nbsp~&nbsp
                                <input type="time" class="custom-input form-control" id="eventEndTime" name="endTime" value="${thepromo.endTime}">
                                <label class="custom-label" for="sameTimeCheckbox">
                                    <input type="checkbox" id="sameTimeCheckbox" name="boolEqlStoreOpr" ${thepromo.boolEqlStoreOpr eq 'true' ? 'checked' : ''}>
                                    &nbsp영업시간과 동일
                                </label>
                            </div>
                        </td>
                        <td>
                            <div class="discount-section time">
                                <input type="time" class="custom-input form-control" id="speechStartTime" name="mentStartTime" value="${thepromo.mentStartTime}">

                                &nbsp~&nbsp
                                <input type="time" class="custom-input form-control" name="mentEndTime" value="${thepromo.mentEndTime}">
                                <label class="custom-label">
                                    <input type="checkbox" name"boolEqlEventStart" ${thepromo.boolEqlEventStart eq 'true' ? 'checked' : ''}>
                                    &nbsp행사시간과 동일
                                </label>
                            </div>
                        </td>
                        <td>
                            <ul class="navbar-nav custom-input form-control">
                                <li class="nav-item dropdown d-lg-block">
                                    <a class="dropdown-bordered dropdown-toggle"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                        <span class="selectedItem"> ${thepromo.freq}분 간격 </span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                         aria-labelledby="messageDropdown">
                                        <a class="dropdown-item preview-item" data-value="5분 간격">
                                            <div class="preview-item-content flex-grow py-2">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    5분 간격</p>
                                            </div>
                                        </a>
                                        <a class="dropdown-item preview-item" data-value="10분 간격">
                                            <div class="preview-item-content flex-grow py-2">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    10분 간격</p>
                                            </div>
                                        </a>
                                        <a class="dropdown-item preview-item" data-value="15분 간격">
                                            <div class="preview-item-content flex-grow py-2">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    15분 간격</p>
                                            </div>
                                        </a>
                                        <a class="dropdown-item preview-item" data-value="20분 간격">
                                            <div class="preview-item-content flex-grow py-2">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    20분 간격</p>
                                            </div>
                                        </a>
                                        <a class="dropdown-item preview-item" data-value="30분 간격">
                                            <div class="preview-item-content flex-grow py-2">
                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                    30분 간격</p>
                                            </div>
                                        </a>
                                    </div>


                                </li>
                            </ul>
                            <!-- category hidden input -->
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
                                <input type="hidden" id="isAddCondInput" name="boolAddCond">
                                <input type="text" class="custom-input form-control" id="addCondId" value="${thepromo.addDiscCond}" name="addDiscCond" placeholder="${thepromo.addDiscCond}" ${thepromo.boolAddCond eq 'true' ? '' : 'disabled'}>
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
                                <input type="hidden" id="isAddDescInput" name="boolAddDesc">
                                <input type="text" class="custom-input form-control" id="addMentDescId" value="${thepromo.addMenuDesc}" name="addMenuDesc" placeholder="${thepromo.addMenuDesc}" ${thepromo.boolAddDesc eq 'true' ? '' : 'disabled'}>

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
                            <th>AI 다솜 멘트 생성<span class="info">* AI 멘트는 하루에 3번까지만 가능합니다. (0/3)</span>
                            </th>
                            <th>테스트 진행<span class="info">* 다솜이 어떻게 말하는지 확인해보세요!</span>
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
                                <button type="button" class="btn btn-outline-light btn-sm">불러오기
                                </button>
                                <button type="button" class="btn btn-outline-light btn-sm">수정
                                </button>
                            </div>
                        </td>
                        <td class="test">
                            <button type="button" class="btn btn-primary">다솜 홍보 테스트
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

        <!-- Product Search Modal -->
        <div id="productModal" class="custom-modal" tabindex="-1" aria-labelledby="productModalLabel"
             role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"><strong>제품 검색</strong></h5>
                        <button type="button" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="search-box">
                            <form action="" method="get">
                                <input type="text" class="form-control"
                                       placeholder="검색" name="" id="searchInput"><i
                                    class="icon-search"></i>
                                <button class="modal-search-button" type="button"></button>
                            </form>
                        </div>
                        <ul class="grid-container" id="itemList">
                            <c:forEach items="${menu_list}" var = "menu" varStatus="status">
                                <li class="item" id="item${menu.id}" menu-add-desc="${menu.desc}">
                                    <img style="width: 50px; height: 100%" src="${menu.imgUrl}" alt="샘플이미지">
                                    <p class="title" id="productName${menu.id}">${menu.name}</p>
                                    <p id="productPrice${menu.id}">${menu.price}원</p>
                                </li>
                            </c:forEach>
                        </ul>
                        <button type="button" class="btn btn-light" id="loadMoreBtn">더보기</button>
                        <button type="button" class="btn btn-light" id="selectBtn"
                                style="display:none;">선택
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="${pageContext.request.contextPath}/static/assets/js/beverageDiscount.js"></script>
</body>
</html>