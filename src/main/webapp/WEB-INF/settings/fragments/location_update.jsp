<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">다솜 위치 변경</h4>
                <form action="/settings/dasom-locations/update" method="post">
                 <div class = "dasom-location-register-wrapper">
                    <div class="dasom-location-radio">
                        <input name="id" value="${theLocation.id}" hidden>
                        <p class="title">1. 카페 안에서 다솜이 있는 위치를 설정해 주세요.</p>
                        <label class="custom-label first-label" for="entrance">
                            <input type="radio" name="location"
                                   id="entrance" value="입구 근처" ${theLocation.location eq '입구 근처' ? 'checked' : ''}>
                            입구 근처
                        </label>
                        <label class="custom-label" for="counter">
                            <input type="radio" name="location"
                                   id="counter" value="계산대 근처" ${theLocation.location eq '계산대 근처' ? 'checked' : ''}>
                            계산대 근처
                        </label>
                        <label class="custom-label" for="pickupTable">
                            <input type="radio" name="location"
                                   id="pickupTable" value="픽업테이블 근처" ${theLocation.location eq '픽업테이블 근처' ? 'checked' : ''}>
                            픽업테이블 근처
                        </label>
                        <label class="custom-label" for="goodsDisplay">
                            <input type="radio" name="location"
                                   id="goodsDisplay" value="굿즈 매대 근처" ${theLocation.location eq '굿즈 매대 근처' ? 'checked' : ''}>
                            굿즈 매대 근처
                        </label>
                        <label class="custom-label" for="other">
                            <input type="radio" name="location"
                                   id="other" value="기타" ${theLocation.location eq '기타' ? 'checked' : ''}>
                            기타
                        </label>
                    </div>

                    <div class="dasom-location-container">
                        <div class="dasom-location-register">
                            <p class="title">2. 다솜 주변에 판매제품이 전개되어 있다면 번호를 선택해 주세요</p>
                            <div class="main-content">
                                <ul class="location-list">
                                    <li class = "${not empty theLocation.leftSide ? 'selected' : ''}">
                                        <p>①</p>
                                        <p>다솜왼쪽</p>
                                    </li>
                                    <li>
                                        <i class="material-symbols-outlined">robot_2</i>
                                        <p>다솜</p>
                                    </li>
                                    <li class = "${not empty theLocation.rightSide ? 'selected' : ''}">
                                        <p>④</p>
                                        <p>다솜 오른쪽</p>
                                    </li>
                                    <li class = "${not empty theLocation.leftFront ? 'selected' : ''}">
                                        <p>②</p>
                                        <p>다솜 왼 앞</p>
                                    </li>
                                    <li class = "${not empty theLocation.front ? 'selected' : ''}">
                                        <p>③</p>
                                        <p>다솜 앞</p>
                                    </li>
                                    <li class = "${not empty theLocation.rightFront ? 'selected' : ''}">
                                        <p>⑤</p>
                                        <p>다솜 오른 앞</p>
                                    </li>
                                </ul>
                            </div>
                        </div>

                        <div class="dasom-location-input">
                            <p class="title">3. 어떤 제품이 전개되어 있는지 선택해 주세요.<br> (최대 2개까지 선택)</p>

                            <div class="location-group">
                                <label for="input1">① 다솜 왼쪽</label>

                                <c:choose>
                                    <c:when test="${fn:length(theLocation.leftSide) == 2}">
                                        <c:set var="inputValue" value="${theLocation.leftSide.get(0)}, ${theLocation.leftSide.get(1)}" />
                                    </c:when>
                                    <c:when test="${fn:length(theLocation.leftSide) == 1}">
                                        <c:set var="inputValue" value="${theLocation.leftSide.get(0)}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="inputValue" value="" />
                                    </c:otherwise>
                                </c:choose>

                                <input type="text"
                                       class="custom-input form-control dropdown-bordered dropdown-toggle"
                                       id="input1" name="leftSide"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false"
                                       value="${inputValue}" ${not empty theLocation.leftSide ? '' : 'disabled'}>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                     aria-labelledby="messageDropdown" id="1">
                                    <ul class="dropdown-options">
                                        <li class="nav-item dropdown" data-value="베이커리">베이커리</li>
                                        <li class="nav-item dropdown" data-value="디저트">디저트</li>
                                        <li class="nav-item dropdown" data-value="샌드위치">샌드위치</li>
                                        <li class="nav-item dropdown" data-value="샐러드">샐러드</li>
                                        <li class="nav-item dropdown" data-value="계산대">계산대</li>
                                        <li class="nav-item dropdown" data-value="유제품">유제품</li>
                                        <li class="nav-item dropdown" data-value="병음료">병음료</li>
                                        <li class="nav-item dropdown" data-value="케이크">케이크</li>
                                        <li class="nav-item dropdown" data-value="창가자리">창가자리</li>
                                        <li class="nav-item dropdown" data-value="직접입력">직접입력</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="location-group">
                                <label for="input4">② 다솜 왼쪽 앞</label>

                                <c:choose>
                                    <c:when test="${fn:length(theLocation.leftFront) == 2}">
                                        <c:set var="inputValue" value="${theLocation.leftFront.get(0)}, ${theLocation.leftFront.get(1)}" />
                                    </c:when>
                                    <c:when test="${fn:length(theLocation.leftFront) == 1}">
                                        <c:set var="inputValue" value="${theLocation.leftFront.get(0)}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="inputValue" value="" />
                                    </c:otherwise>
                                </c:choose>

                                <input type="text"
                                       class="custom-input form-control dropdown-bordered dropdown-toggle"
                                       id="input4" name="leftFront"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false"
                                       value="${inputValue}" ${not empty theLocation.leftFront ? '' : 'disabled'}>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                     aria-labelledby="messageDropdown" id="4">
                                    <ul class="dropdown-options">
                                        <li class="nav-item dropdown" data-value="베이커리">베이커리</li>
                                        <li class="nav-item dropdown" data-value="디저트">디저트</li>
                                        <li class="nav-item dropdown" data-value="샌드위치">샌드위치</li>
                                        <li class="nav-item dropdown" data-value="샐러드">샐러드</li>
                                        <li class="nav-item dropdown" data-value="계산대">계산대</li>
                                        <li class="nav-item dropdown" data-value="유제품">유제품</li>
                                        <li class="nav-item dropdown" data-value="병음료">병음료</li>
                                        <li class="nav-item dropdown" data-value="케이크">케이크</li>
                                        <li class="nav-item dropdown" data-value="창가자리">창가자리</li>
                                        <li class="nav-item dropdown" data-value="직접입력">직접입력</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="location-group">
                                <label for="input5">③ 다솜 앞</label>

                                <c:choose>
                                    <c:when test="${fn:length(theLocation.front) == 2}">
                                        <c:set var="inputValue" value="${theLocation.front.get(0)}, ${theLocation.front.get(1)}" />
                                    </c:when>
                                    <c:when test="${fn:length(theLocation.front) == 1}">
                                        <c:set var="inputValue" value="${theLocation.front.get(0)}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="inputValue" value="" />
                                    </c:otherwise>
                                </c:choose>

                                <input type="text"
                                       class="custom-input form-control dropdown-bordered dropdown-toggle"
                                       id="input5" name="front"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false"
                                       value="${inputValue}" ${not empty theLocation.front ? '' : 'disabled'}>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                     aria-labelledby="messageDropdown" id="5">
                                    <ul class="dropdown-options">
                                        <li class="nav-item dropdown" data-value="베이커리">베이커리</li>
                                        <li class="nav-item dropdown" data-value="디저트">디저트</li>
                                        <li class="nav-item dropdown" data-value="샌드위치">샌드위치</li>
                                        <li class="nav-item dropdown" data-value="샐러드">샐러드</li>
                                        <li class="nav-item dropdown" data-value="계산대">계산대</li>
                                        <li class="nav-item dropdown" data-value="유제품">유제품</li>
                                        <li class="nav-item dropdown" data-value="병음료">병음료</li>
                                        <li class="nav-item dropdown" data-value="케이크">케이크</li>
                                        <li class="nav-item dropdown" data-value="창가자리">창가자리</li>
                                        <li class="nav-item dropdown" data-value="직접입력">직접입력</li>
                                    </ul>
                                </div>
                            </div>

                            <div class="location-group">
                                <label for="input3">④ 다솜 오른쪽</label>

                                <c:choose>
                                    <c:when test="${fn:length(theLocation.rightSide) == 2}">
                                        <c:set var="inputValue" value="${theLocation.rightSide.get(0)}, ${theLocation.rightSide.get(1)}" />
                                    </c:when>
                                    <c:when test="${fn:length(theLocation.rightSide) == 1}">
                                        <c:set var="inputValue" value="${theLocation.rightSide.get(0)}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="inputValue" value="" />
                                    </c:otherwise>
                                </c:choose>


                                <input type="text"
                                       class="custom-input form-control dropdown-bordered dropdown-toggle"
                                       id="input3" name="rightSide"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false"
                                       value="${inputValue}" ${not empty theLocation.rightSide ? '' : 'disabled'}>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                     aria-labelledby="messageDropdown" id="3">
                                    <ul class="dropdown-options">
                                        <li class="nav-item dropdown" data-value="베이커리">베이커리</li>
                                        <li class="nav-item dropdown" data-value="디저트">디저트</li>
                                        <li class="nav-item dropdown" data-value="샌드위치">샌드위치</li>
                                        <li class="nav-item dropdown" data-value="샐러드">샐러드</li>
                                        <li class="nav-item dropdown" data-value="계산대">계산대</li>
                                        <li class="nav-item dropdown" data-value="유제품">유제품</li>
                                        <li class="nav-item dropdown" data-value="병음료">병음료</li>
                                        <li class="nav-item dropdown" data-value="케이크">케이크</li>
                                        <li class="nav-item dropdown" data-value="창가자리">창가자리</li>
                                        <li class="nav-item dropdown" data-value="직접입력">직접입력</li>
                                    </ul>
                                </div>
                            </div>


                            <div class="location-group">
                                <label for="input6">⑤ 다솜 오른쪽 앞</label>

                                <c:choose>
                                    <c:when test="${fn:length(theLocation.rightFront) == 2}">
                                        <c:set var="inputValue" value="${theLocation.rightFront.get(0)}, ${theLocation.rightFront.get(1)}" />
                                    </c:when>
                                    <c:when test="${fn:length(theLocation.rightFront) == 1}">
                                        <c:set var="inputValue" value="${theLocation.rightFront.get(0)}" />
                                    </c:when>
                                    <c:otherwise>
                                        <c:set var="inputValue" value="" />
                                    </c:otherwise>
                                </c:choose>


                                <input type="text"
                                       class="custom-input form-control dropdown-bordered dropdown-toggle"
                                       id="input6" name="rightFront"
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false"
                                       value="${inputValue}" ${not empty theLocation.rightFront ? '' : 'disabled'}>
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                     aria-labelledby="messageDropdown" id="6">
                                    <ul class="dropdown-options">
                                        <li class="nav-item dropdown" data-value="베이커리">베이커리</li>
                                        <li class="nav-item dropdown" data-value="디저트">디저트</li>
                                        <li class="nav-item dropdown" data-value="샌드위치">샌드위치</li>
                                        <li class="nav-item dropdown" data-value="샐러드">샐러드</li>
                                        <li class="nav-item dropdown" data-value="계산대">계산대</li>
                                        <li class="nav-item dropdown" data-value="유제품">유제품</li>
                                        <li class="nav-item dropdown" data-value="병음료">병음료</li>
                                        <li class="nav-item dropdown" data-value="케이크">케이크</li>
                                        <li class="nav-item dropdown" data-value="창가자리">창가자리</li>
                                        <li class="nav-item dropdown" data-value="직접입력">직접입력</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-buttons">
                        <button type="button" class="btn btn-outline-primary" onclick="deleteLocation(${theLocation.id})">
                            삭제
                        </button>
                        <button type="submit" class="btn btn-primary">
                            수정
                        </button>
                    </div>
                </div>
               </form>
            </div>
        </div>
        <script src="${pageContext.request.contextPath}/static/assets/js/dasom_location.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    </body>
</html>