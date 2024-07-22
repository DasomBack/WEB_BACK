<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Promotions</title>
</head>
<body>
    <div id="content">
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
                            <td><button type="button" onclick="openAdditionalContent(${promotion.isAddCond},${promotion.isAddDesc},'${promotion.addCond}','${promotion.addDesc}','${promotion.ment}')">보기</button></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
                <button type="button" id="closeModalBtn">닫기</button>
                <p>모달 내용을 입력하세요.</p>
            </div>
        </div>


    </div>
    <script src="${pageContext.request.contextPath}/static/assets/js/beverageDiscount.js"></script>

</body>
</html>