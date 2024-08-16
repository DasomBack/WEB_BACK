<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <div class="card">
            <div class="card-body">
                <h4 class="card-title">다솜 위치 등록</h4>
                <form action="/settings/dasom-locations" method="post">
                 <div class = "dasom-location-register-wrapper">
                    <div class="dasom-location-radio">
                        <p class="title">1. 카페 안에서 다솜이 있는 위치를 설정해 주세요.</p>
                        <label class="custom-label first-label" for="entrance">
                            <input type="radio" name="location"
                                   id="entrance" value="입구 근처" checked>
                            입구 근처
                        </label>
                        <label class="custom-label" for="counter">
                            <input type="radio" name="location"
                                   id="counter" value="계산대 근처">
                            계산대 근처
                        </label>
                        <label class="custom-label" for="pickupTable">
                            <input type="radio" name="location"
                                   id="pickupTable" value="픽업테이블 근처">
                            픽업테이블 근처
                        </label>
                        <label class="custom-label" for="goodsDisplay">
                            <input type="radio" name="location"
                                   id="goodsDisplay" value="굿즈 매대 근처">
                            굿즈 매대 근처
                        </label>
                        <label class="custom-label" for="other">
                            <input type="radio" name="location"
                                   id="other" value="기타">
                            기타
                        </label>
                    </div>

                    <div class="dasom-location-container">
                        <div class="dasom-location-register">
                            <p class="title">2. 다솜 주변에 판매제품이 전개되어 있다면 번호를 선택해 주세요</p>
                            <div class="main-content">
                                <ul class="location-list">
                                    <li>
                                        <p>①</p>
                                        <p>다솜왼쪽</p>
                                    </li>
                                    <li>
                                        <i class="material-symbols-outlined">robot_2</i>
                                        <p>다솜</p>
                                    </li>
                                    <li>
                                        <p>④</p>
                                        <p>다솜 오른쪽</p>
                                    </li>
                                    <li>
                                        <p>②</p>
                                        <p>다솜 왼 앞</p>
                                    </li>
                                    <li>
                                        <p>③</p>
                                        <p>다솜 앞</p>
                                    </li>
                                    <li>
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

                                <input type="text"
                                       class="custom-input form-control dropdown-bordered dropdown-toggle"
                                       id="input1" name="leftSide" disabled
                                       data-bs-toggle="dropdown"
                                       aria-expanded="false">
                                <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0 pt-0"
                                     aria-labelledby="messageDropdown">
                                    <!-- <a class="dropdown-item preview-item">-->
                                    <ul class="dropdown-options">
                                        <li class="nav-item dropdown" data-value="베이커리">베이커리</li>
                                        <li class="nav-item dropdown" data-value="베이커리">디저트</li>
                                        <li class="nav-item dropdown" data-value="베이커리">샌드위치</li>
                                        <li class="nav-item dropdown" data-value="베이커리">샐러드</li>
                                        <li class="nav-item dropdown" data-value="베이커리">계산대</li>
                                        <li class="nav-item dropdown" data-value="베이커리">유제품</li>
                                        <li class="nav-item dropdown" data-value="베이커리">병음료</li>
                                        <li class="nav-item dropdown" data-value="베이커리">케이크</li>
                                        <li class="nav-item dropdown" data-value="베이커리">창가자리</li>
                                        <li class="nav-item dropdown" data-value="베이커리">직접입력</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="location-group">
                                <label for="input4">② 다솜 왼쪽 앞</label>
                                <input type="text" class="custom-input form-control" id="input4" name="leftFront"
                                       disabled>
                            </div>
                            <div class="location-group">
                                <label for="input5">③ 다솜 앞</label>
                                <input type="text" class="custom-input form-control" id="input5" name="front"
                                       disabled>
                            </div>
                            <div class="location-group">
                                <label for="input3">④ 다솜 오른쪽</label>
                                <input type="text" class="custom-input form-control" id="input3" name="rightSide"
                                       disabled>
                            </div>
                            <div class="location-group">
                                <label for="input6">⑤ 다솜 오른쪽 앞</label>
                                <input type="text" class="custom-input form-control" id="input6" name="rightFront"
                                       disabled>
                            </div>

                        </div>
                    </div>
                    <div class="form-buttons">
                        <!-- 삭제 버튼은 제품 할인 영역에서 "수정" 버튼 눌렀을 시 생김
                        <button type="button" class="btn btn-outline-primary">삭제
                        </button>-->
                        <button type="submit" class="btn btn-primary">저장
                        </button>
                    </div>
                </div>
               </form>
            </div>
        </div>
    </body>
</html>