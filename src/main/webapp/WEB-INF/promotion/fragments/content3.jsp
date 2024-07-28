<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promotions</title>
</head>
<body>
    <div class="card-body">
        <div class="completed-table">
            <table class="table completed-promotion-list">
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
                    <c:forEach items="${completed_promotion_list}" var="promotion" varStatus="status">
                        <c:if test="${status.index<3}">
                            <tr>
                                <td>${promotion.status}</td>
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
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

            <c:set var="listSize" value="${fn:length(completed_promotion_list)}"/>
            <div style="text-align: center;" >
                <c:if test="${listSize > 100}">
                    <button class="rotated-arrow" type="button" onclick="openAllListModal()">
                        <image style="width: 20px; height: 100%" src="${pageContext.request.contextPath}/static/assets/images/pngwing.com.svg"/>
                    </button>
                </c:if>
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
</body>
</html>