<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    </head>

    <body>
        <div class="fragment-content">
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
                    <c:forEach items="${completed_promotions_list}" var="promotion" varStatus="status">
                        <c:if test="${status.index < 3}">
                            <tr>
                                <td>
                                    ${promotion.status}
                                </td>
                                <td>${promotion.category}</td>
                                <td>${promotion.menu}</td>
                                <td>${promotion.price}</td>
                                <td>${promotion.discPrice}</td>
                                <td>${promotion.startDate} ~ ${promotion.endDate}</td>
                                <td>${promotion.startTime} ~ ${promotion.endTime}</td>
                                <td>${promotion.mentStartTime} ~ ${promotion.mentEndTime}</td>
                                <td>${promotion.freq}</td>
                                <td>
                                    <button type="button" class="btn-add-desc"
                                            onclick="openAdditionalDesc( ${promotion.boolAddCond}, ${promotion.boolAddDesc}, '${promotion.addDiscCond}', '${promotion.addMenuDesc}', '${promotion.ment}')">
                                        보기
                                    </button>
                                </td>
                                <td>
                                    <button type="button" class="btn-add-desc"
                                            onclick="loadUpdateFragment(${promotion.menuPromoId})">
                                        편집
                                    </button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <c:set var="listSize" value="${fn:length(completed_promotion_list)}"/>
            <div>
                <c:if test="${listSize > 3}">
                <button class="all-list-btn" id="all-list-btn" type="button"
                        onclick="openAllListModal()">
                    <image style="width: 20px; height: 100px;" src="${pageContext.request.contextPath}/static/assets/images/pngwing.com.svg"/>
                </button>
                </c:if>
            </div>

            <div id="all-list-modal" class="all-list-modal" tabindex="-1" role="dialog" style="display:none;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" style="margin-left: auto" class="close-btn"
                                data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                        </button>
                    </div>

                    <div class="modal-body">
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
                                <c:forEach items="${completed_promotions_list}" var="promotion" varStatus="status">
                                    <tr>
                                        <td>
                                            ${promotion.status}
                                        </td>
                                        <td>${promotion.category}</td>
                                        <td>${promotion.menu}</td>
                                        <td>${promotion.price}</td>
                                        <td>${promotion.discPrice}</td>
                                        <td>${promotion.startDate} ~ ${promotion.endDate}</td>
                                        <td>${promotion.startTime} ~ ${promotion.endTime}</td>
                                        <td>${promotion.mentStartTime} ~ ${promotion.mentEndTime}</td>
                                        <td>${promotion.freq}</td>
                                        <td>
                                            <button type="button" class="btn-add-desc"
                                                    onclick="openAdditionalDesc( ${promotion.boolAddCond}, ${promotion.boolAddDesc}, '${promotion.addDiscCond}', '${promotion.addMenuDesc}', '${promotion.ment}')">
                                                보기
                                            </button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn-add-desc"
                                                    onclick="loadUpdateFragment(${promotion.menuPromoId})">
                                                편집
                                            </button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>

                    </div>
                </div>
            </div>

            <div id="add-content-modal" class="add-content-modal" style="display:none;">
                <div class="modal-header">
                    <button type="button" style="margin-left: auto" class="close-btn"
                            data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <ul class="add-list">
                        <li>할인 조건 추가    <span id="add-disc-cond"></span></li>
                        <li>제품 소개   <span id = "add-menu-desc"></span></li>
                        <li>AI 멘트 생성    <span id="ai-ment"></span></li>
                    </ul>
                </div>
            </div>

        </div>
    </body>
</html>