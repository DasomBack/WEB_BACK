<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promotions</title>
</head>
<body>
    <div class="card-body">
        <div id="all-table">
            <table class="table all-promotion-list">
                <thead>
                    <tr>
                        <th>상태</th>
                        <th>품목</th>
                        <th>제품</th>
                        <th>정가</th>
                        <th>할인가</th>
                        <th>행사기간</th>
                        <th>행사시간</th>
                        <th>멘트발화시간</th>
                        <th>빈도수</th>
                        <th>조건 및 멘트</th>
                        <th>편집</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${all_promotion_list}" var="promotion" varStatus="status">
                        <c:if test="${status.index < 3}">
                            <tr>
                                <td>
                                    <ul class="navbar-nav custom-input form-control">
                                        <li class="nav-item dropdown d-lg-block">
                                            <a class="dropdown-bordered dropdown-toggle"
                                               data-bs-toggle="dropdown"
                                               aria-expanded="false">
                                                <span id="selectedItem"> ${promotion.status} </span>
                                                <p id="menuPromotionId" style="display: none" data-menu-promo-id="${promotion.menuPromoId}"></p>
                                            </a>
                                            <a class="dropdown-item preview-item" data-value="예정">
                                                <div class="preview-item-content flex-grow">
                                                    <p class="preview-subject ellipsis fw-medium text-dark">
                                                        예정</p>
                                                </div>
                                            </a>
                                            <a class="dropdown-item preview-item" data-value="중지">
                                                <div class="preview-item-content flex-grow">
                                                    <p class="preview-subject ellipsis fw-medium text-dark">
                                                        중지</p>
                                                </div>
                                            </a>
                                            <a class="dropdown-item preview-item" data-value="완료">
                                                <div class="preview-item-content flex-grow">
                                                    <p class="preview-subject ellipsis fw-medium text-dark">
                                                        완료</p>
                                                    </div>
                                                </a>
                                            </div>
                                        </li>
                                    </ul>
                                </td>

                                <td>${promotion.category}</td>
                                <td>${promotion.menu}</td>
                                <td>${promotion.price}</td>
                                <td>${promotion.discPrice}</td>
                                <td>${promotion.startDate} ~ ${promotion.endDate}</td>
                                <td>${promotion.startTime} ~ ${promotion.endTime}</td>
                                <td>${promotion.mentStartTime} ~ ${promotion.mentEndTime}</td>
                                <td>${promotion.freq}</td>
                                <td><button type="button" class="btn btn-outline-primary btn-sm" style="border-radius: 10px;" onclick="openAdditionalContent(${promotion.boolAddCond},${promotion.boolAddDesc},'${promotion.addDiscCond}','${promotion.addMenuDesc}','${promotion.ment}')">보기</button></td>
                                <td><button type="button" class="btn btn-outline-primary btn-sm" style="border-radius: 10px;" onclick="loadUpdateContent(${promotion.menuPromoId})">편집</button></td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <c:set var="listSize" value="${fn:length(all_promotion_list)}"/>
            <div style="text-align: center;" >
                <c:if test="${listSize > 3}">
                    <button class="rotated-arrow" id="all_list_btn" type="button">
                        <image style="width: 20px; height: 100%" src="${pageContext.request.contextPath}/static/assets/images/pngwing.com.svg"/>
                    </button>
                </c:if>
            </div>
        </div>

        <div id="allListModal" class="custom-modal" tabindex="-1" role="dialog">

                <div class="all-list-modal-content">

                    <div class="modal-header">
                        <button type="button" style="margin-left: auto" class="close" data-dismiss="modal"
                                aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
                        <table class="table all-promotion-list">
                            <thead class="modal-header">
                                <tr>
                                    <th>상태</th>
                                    <th>품목</th>
                                    <th>제품</th>
                                    <th>정가</th>
                                    <th>할인가</th>
                                    <th>행사기간</th>
                                    <th>행사시간</th>
                                    <th>멘트발화시간</th>
                                    <th>빈도수</th>
                                    <th>조건 및 멘트</th>
                                    <th>편집</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${all_promotion_list}" var="promotion" varStatus="status">
                                    <tr>
                                        <td>
                                            <ul class="navbar-nav custom-input form-control">
                                                <li class="nav-item dropdown d-lg-block">
                                                    <a class="dropdown-bordered dropdown-toggle"
                                                       data-bs-toggle="dropdown"
                                                       aria-expanded="false">
                                                        <span id="selectedItem"> ${promotion.status} </span>
                                                        <p id="menuPromotionId" style="display: none" data-menu-promo-id="${promotion.menuPromoId}"></p>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                                         aria-labelledby="messageDropdown">
                                                        <a class="dropdown-item preview-item" data-value="진행중">
                                                            <div class="preview-item-content flex-grow">
                                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                                    진행중</p>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item preview-item" data-value="예정">
                                                            <div class="preview-item-content flex-grow">
                                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                                    예정</p>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item preview-item" data-value="중지">
                                                            <div class="preview-item-content flex-grow">
                                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                                    중지</p>
                                                            </div>
                                                        </a>
                                                        <a class="dropdown-item preview-item" data-value="완료">
                                                            <div class="preview-item-content flex-grow">
                                                                <p class="preview-subject ellipsis fw-medium text-dark">
                                                                    완료</p>
                                                            </div>
                                                        </a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </td>
                                        <td>${promotion.category}</td>
                                        <td>${promotion.menu}</td>
                                        <td>${promotion.price}</td>
                                        <td>${promotion.discPrice}</td>
                                        <td>${promotion.startDate} ~ ${promotion.endDate}</td>
                                        <td>${promotion.startTime} ~ ${promotion.endTime}</td>
                                        <td>${promotion.mentStartTime} ~ ${promotion.mentEndTime}</td>
                                        <td>${promotion.freq}</td>
                                        <td><button type="button" class="btn btn-outline-primary btn-sm" onclick="openAdditionalContent(${promotion.boolAddCond},${promotion.boolAddDesc},'${promotion.addDiscCond}','${promotion.addMenuDesc}','${promotion.ment}')">보기</button></td>
                                        <td><button type="button" class="btn btn-outline-primary btn-sm" onclick="loadUpdateContent(${promotion.menuPromoId})">편집</button></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>

        </div>

        <div id="additionalContentModal" class="modal-addc">
            <div class="modal-popup-addc">
                <ul>
                    <li>할인 조건 추가    <span id="modal-additional-cond"></span></li>
                    <li>제품 소개    <span id="modal-product-desc"></span></li>
                    <li>AI 멘트 생성    <span id="modal-ment"></span></li>
                </ul>
                <button type="button" class="close-btn-addc" onclick="closeAdditionalContent()">닫기</button>
            </div>
        </div>
    </div>

    <script src="${pageContext.request.contextPath}/static/assets/js/beverageDiscount.js"></script>

</body>
</html>