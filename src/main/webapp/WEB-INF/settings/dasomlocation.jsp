<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>카페봇 위치 설정</title>

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
    <%@ include file="../promotion/fragments/top-nav.jsp" %>
        <div class="container-fluid page-body-wrapper">
             <%@ include file="../promotion/fragments/nav-menu.jsp" %>

    <div class="main-panel">
        <div class="content-wrapper dasomLocation">
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title">카페봇 위치 목록</h4>
                    <span><button id="prevButton" class="hidden" onclick="showPreviousItems()" style="border: none; background-color:white;"><image style="width: 40px; height: 100%" src="${pageContext.request.contextPath}/static/assets/images/free-icon-arrow-right-6423875left.svg"/></button><span>
                        <c:forEach items="${all_robot_location_category_list}" var="robot_location" varStatus="status">
                            <ul class="location-info dropdown-options hidden" id="settings${robot_location.id}">
                                <h5><strong>${robot_location.location}</strong></h5>
                                <br>
                                <label style="display: inline-block; margin-right: 10px;">왼쪽</label>
                                <c:choose>
                                    <c:when test="${not empty robot_location.leftSide}">
                                        <ul style="display: inline-block; padding-left: 0; list-style: none;">
                                            <c:forEach items="${robot_location.leftSide}" var="lse" varStatus="status">
                                                <li style="display: inline-block; margin-right: 10px;"><span>${lse}</span></li>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                </c:choose>
                                <br>
                                <label style="display: inline-block; margin-right: 10px;">왼쪽 앞</label>
                                <c:choose>
                                    <c:when test="${not empty robot_location.leftFront}">
                                        <ul style="display: inline-block; padding-left: 0; list-style: none;">
                                            <c:forEach items="${robot_location.leftFront}" var="lfe" varStatus="status">
                                                <li style="display: inline-block; margin-right: 10px;"><span>${lfe}</span></li>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                </c:choose>
                                <br>
                                <label style="display: inline-block; margin-right: 10px;">앞</label>
                                <c:choose>
                                    <c:when test="${not empty robot_location.front}">
                                        <ul style="display: inline-block; padding-left: 0; list-style: none;">
                                            <c:forEach items="${robot_location.front}" var="fe" varStatus="status">
                                                <li style="display: inline-block; margin-right: 10px;"><span>${fe}</span></li>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                </c:choose>
                                <br>
                                <label style="display: inline-block; margin-right: 10px;">오른쪽</label>
                                <c:choose>
                                    <c:when test="${not empty robot_location.rightSide}">
                                        <ul style="display: inline-block; padding-left: 0; list-style: none;">
                                            <c:forEach items="${robot_location.rightSide}" var="rse" varStatus="status">
                                                <li style="display: inline-block; margin-right: 10px;"><span>${rse}</span></li>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                </c:choose>
                                <br>
                                <label style="display: inline-block; margin-right: 10px;">오른쪽 앞</label>
                                <c:choose>
                                    <c:when test="${not empty robot_location.rightFront}">
                                        <ul style="display: inline-block; padding-left: 0; list-style: none;">
                                            <c:forEach items="${robot_location.rightFront}" var="rfe" varStatus="status">
                                                <li style="display: inline-block; margin-right: 10px;"><span>${rfe}</span></li>
                                            </c:forEach>
                                        </ul>
                                    </c:when>
                                </c:choose>
                                <br>
                                <button class="btn-primary edit-location" onclick="loadUpdateLocationContent(${robot_location.id})">
                                    <i class="material-symbols-outlined">pin_drop</i>
                                    위치수정
                                </button>
                                <br>
                                <div class="toggle">
                                    <c:choose>
                                        <c:when test="${robot_location.use eq 'true'}">
                                            <input type="checkbox" id="toggle${status.index}" hidden checked>
                                            <label for="toggle${status.index}" class="toggleSwitch active" data-id="${robot_location.id}">
                                                <span class="toggleButton"></span>
                                            </label>
                                        </c:when>
                                        <c:otherwise>
                                            <input type="checkbox" id="toggle${status.index}" hidden>
                                            <label for="toggle${status.index}" class="toggleSwitch" data-id="${robot_location.id}">
                                                <span class="toggleButton"></span>
                                            </label>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </ul>
                        </c:forEach>
                    <span><button id="nextButton" class="hidden" onclick="showNextItems()" style="border: none; background-color:white;"><image style="width: 40px; height: 100%" src="${pageContext.request.contextPath}/static/assets/images/free-icon-arrow-right-6423875.svg"/></button></span>
                </div>
            </div>
            <br>
            <br>
            <div id="location_input">
                <%@ include file = "fragments/location_registration.jsp" %>
            </div>
<!-- locationupdate or locationregisteration  -->
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