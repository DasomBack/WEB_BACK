<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>다솜 위치 설정</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/feather/feather.css">
    <link rel="stylesheet"
              href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@24,400,0,0"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/ti-icons/css/themify-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/typicons/typicons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/simple-line-icons/css/simple-line-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/beverageDiscountpage.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/settings.css">
    <!-- endinject -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/assets/images/favicon.png"/>
</head>
<body>
<div class="container-scroller">
    <!-- partial:../../partials/_navbar.html -->
    <%@ include file="../promotion/fragments/top-nav.jsp" %>
    <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:../../partials/_sidebar.html -->
             <%@ include file="../promotion/fragments/nav-menu.jsp" %>
    <!-- partial -->

    <div class="main-panel">
        <div class="content-wrapper dasomLocation">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">다솜 위치 목록</h4>
                    <ul class="location-info dropdown-options">
                        <h5><strong>입구 근처</strong></h5>
                        <label>다솜 왼쪽</label><li>베이커리</li><li>샐러드</li>
                        <br>
                        <label>다솜 왼쪽 앞</label><li>베이커리</li>
                        <br>
                        <label>다솜 앞</label><li>베이커리</li>
                        <br>
                        <label>다솜 오른쪽</label><li>베이커리</li>
                        <br>
                        <label>다솜 오른쪽 앞</label><li>베이커리</li>
                        <button class="btn-primary"> <i class="material-symbols-outlined">pin_drop</i>
                            위치수정
                        </button>
                        <div class="toggle">
                            <input type="checkbox" id="toggle" hidden>
                            <label for="toggle" class="toggleSwitch">
                                <span class="toggleButton"></span>
                            </label>
                        </div>
                    </ul>
                </div>
            </div>
            <br>
            <br>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">다솜 위치 등록</h4>
                    <form action="/api/robotLocation/register" method="post">
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
                                        <!--  </a>-->
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
            <!-- Product Search Modal -->
            <div id="productModal" class="modal" tabindex="-1" aria-labelledby="productModalLabel"
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
                                    <!--<button class="search-button" type="submit"><i class="icon-search"></i>-->
                                    <button class="modal-search-button" type="submit"></button>
                                </form>
                            </div>
                            <ul class="grid-container" id="itemList">
                                <li class="item" id="item1">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName1">음료1</p>
                                    <p id="productPrice1">3,000원</p>
                                </li>
                                <li class="item" id="item2">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName2">음료2</p>
                                    <p id="productPrice2">3,500원</p>
                                </li>
                                <li class="item" id="item3">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName3">수박주스</p>
                                    <p id="productPrice3">6,000원</p>
                                </li>
                                <li class="item" id="item4">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName4">음료4</p>
                                    <p id="productPrice4">3,000원</p>
                                </li>
                                <li class="item" id="item5">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName5">음료5</p>
                                    <p id="productPrice5">3,500원</p>
                                </li>
                                <li class="item" id="item6">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName6">음료6</p>
                                    <p id="productPrice6">3,500원</p>
                                </li>
                                <li class="item" id="item7">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName7">음료7</p>
                                    <p id="productPrice7">3,000원</p>
                                </li>
                                <li class="item" id="item8">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName8">음료8</p>
                                    <p id="productPrice8">3,500원</p>
                                </li>
                                <li class="item" id="item9">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName9">음료9</p>
                                    <p id="productPrice9">3,500원</p>
                                </li>
                                <li class="item" id="item10">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName10">음료10</p>
                                    <p id="productPrice10">3,500원</p>
                                </li>
                                <li class="item" id="item11">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName11">음료11</p>
                                    <p id="productPrice11">3,000원</p>
                                </li>
                                <li class="item" id="item12">
                                    <img src="https://via.placeholder.com/150" alt="샘플이미지">
                                    <p class="title" id="productName12">음료12</p>
                                    <p id="productPrice12">3,500원</p>
                                </li>
                            </ul>
                            <button type="button" class="btn btn-light" id="loadMoreBtn">더보기</button>
                            <button type="button" class="btn btn-light" id="selectBtn"
                                    style="display:none;">선택
                            </button>
                        </div>

                    </div>
                </div>
            </div>

                    <!-- Beverage Search Modal ends -->


                </div>


            </div>
        </div>
    </div>


<!-- content-wrapper ends -->
<!-- partial:../../partials/_footer.html -->
<footer class="footer">
    <div class="d-sm-flex justify-content-center justify-content-sm-between">
                    <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Premium <a
                            href="https://www.bootstrapdash.com/" target="_blank">Bootstrap admin template</a> from BootstrapDash.</span>
        <span class="float-none float-sm-end d-block mt-1 mt-sm-0 text-center">Copyright © 2023. All rights reserved.</span>
    </div>
</footer>
<!-- partial -->
</div>
<!-- main-panel ends -->
</div>
<!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->
<!-- plugins:js -->
<!-- Include jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- Include Bootstrap JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/dasom_location.js"></script>


<script src="${pageContext.request.contextPath}/static/assets/vendors/js/vendor.bundle.base.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="${pageContext.request.contextPath}/static/assets/vendors/typeahead.js/typeahead.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/vendors/select2/select2.min.js"></script>
<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="${pageContext.request.contextPath}/static/assets/js/off-canvas.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/template.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/settings.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/hoverable-collapse.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/todolist.js"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="${pageContext.request.contextPath}/static/assets/js/file-upload.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/typeahead.js"></script>
<script src="${pageContext.request.contextPath}/static/assets/js/select2.js"></script>


<!-- End custom js for this page-->
</body>
</html>