<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>제품 할인</title>

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
    <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex align-items-top flex-row">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-start">
            <!-- <div class="me-3">
                <button class="navbar-toggler navbar-toggler align-self-center" type="button" data-bs-toggle="minimize">
                    <span class="icon-menu"></span>
                </button>
            </div> -->
            <div>
                <a class="navbar-brand brand-logo" href="../../index.html">
                    <h6> 관리자페이지</h6>
                </a>
                <a class="navbar-brand brand-logo-mini" href="../../index.html">
                    <h4> 관리자페이지</h4>
                </a>
            </div>
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-top">
            <!--<ul class="navbar-nav">
                <li class="nav-item fw-semibold d-none d-lg-block ms-0">
                    <h1 class="welcome-text">Good Morning, <span class="text-black fw-bold">John Doe</span></h1>
                    <h3 class="welcome-sub-text">Your performance summary this week </h3>
                </li>
            </ul>-->
            <ul class="navbar-nav ms-auto">
                <!--<li class="nav-item dropdown d-none d-lg-block">
                    <a class="nav-link dropdown-bordered dropdown-toggle dropdown-toggle-split" id="messageDropdown"
                       href="#" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="ti-world icon-md text-info d-flex align-self-start me-3"></i>
                        <span class="selectedItem"> 한국어 </span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
                         aria-labelledby="messageDropdown">
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item preview-item" href="#">
                            <div class="preview-item-content flex-grow py-2">
                                <p class="preview-subject ellipsis fw-medium text-dark">한국어</p>
                            </div>
                        </a>
                        <a class="dropdown-item preview-item" href="#">
                            <div class="preview-item-content flex-grow py-2">
                                <p class="preview-subject ellipsis fw-medium text-dark">English</p>
                            </div>
                        </a>
                    </div>
                </li>-->
                <li class="nav-item d-none d-lg-block">
                    <p id="login-user-info"><strong>반갑습니다. ${sessionScope.userId.name}님!</strong></p>
                </li>
                <!--<li class="nav-item">
                    <form class="search-form" action="#">
                        <i class="icon-search"></i>
                        <input type="search" class="form-control" placeholder="Search Here" title="Search here">
                    </form>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link count-indicator" id="notificationDropdown" href="#" data-bs-toggle="dropdown">
                        <i class="icon-bell"></i>
                        <span class="count"></span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
                         aria-labelledby="notificationDropdown">
                        <a class="dropdown-item py-3 border-bottom">
                            <p class="mb-0 fw-medium float-start">You have 4 new notifications </p>
                            <span class="badge badge-pill badge-primary float-end">View all</span>
                        </a>
                        <a class="dropdown-item preview-item py-3">
                            <div class="preview-thumbnail">
                                <i class="mdi mdi-alert m-auto text-primary"></i>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject fw-normal text-dark mb-1">Application Error</h6>
                                <p class="fw-light small-text mb-0"> Just now </p>
                            </div>
                        </a>
                        <a class="dropdown-item preview-item py-3">
                            <div class="preview-thumbnail">
                                <i class="mdi mdi-lock-outline m-auto text-primary"></i>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject fw-normal text-dark mb-1">Settings</h6>
                                <p class="fw-light small-text mb-0"> Private message </p>
                            </div>
                        </a>
                        <a class="dropdown-item preview-item py-3">
                            <div class="preview-thumbnail">
                                <i class="mdi mdi-airballoon m-auto text-primary"></i>
                            </div>
                            <div class="preview-item-content">
                                <h6 class="preview-subject fw-normal text-dark mb-1">New user registration</h6>
                                <p class="fw-light small-text mb-0"> 2 days ago </p>
                            </div>
                        </a>
                    </div>
                </li>-->
                <!-- <li class="nav-item dropdown">
                     <a class="nav-link count-indicator" id="countDropdown" href="#" data-bs-toggle="dropdown"
                        aria-expanded="false">
                         <i class="icon-mail icon-lg"></i>
                     </a>
                     <div class="dropdown-menu dropdown-menu-right navbar-dropdown preview-list pb-0"
                          aria-labelledby="countDropdown">
                         <a class="dropdown-item py-3">
                             <p class="mb-0 fw-medium float-start">You have 7 unread mails </p>
                             <span class="badge badge-pill badge-primary float-end">View all</span>
                         </a>
                         <div class="dropdown-divider"></div>
                         <a class="dropdown-item preview-item">
                             <div class="preview-thumbnail">
                                 <img src="../../../static/assets/images/faces/face10.jpg" alt="image"
                                      class="img-sm profile-pic">
                             </div>
                             <div class="preview-item-content flex-grow py-2">
                                 <p class="preview-subject ellipsis fw-medium text-dark">Marian Garner </p>
                                 <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                             </div>
                         </a>
                         <a class="dropdown-item preview-item">
                             <div class="preview-thumbnail">
                                 <img src="../../../static/assets/images/faces/face12.jpg" alt="image"
                                      class="img-sm profile-pic">
                             </div>
                             <div class="preview-item-content flex-grow py-2">
                                 <p class="preview-subject ellipsis fw-medium text-dark">David Grey </p>
                                 <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                             </div>
                         </a>
                         <a class="dropdown-item preview-item">
                             <div class="preview-thumbnail">
                                 <img src="../../../static/assets/images/faces/face1.jpg" alt="image"
                                      class="img-sm profile-pic">
                             </div>
                             <div class="preview-item-content flex-grow py-2">
                                 <p class="preview-subject ellipsis fw-medium text-dark">Travis Jenkins </p>
                                 <p class="fw-light small-text mb-0"> The meeting is cancelled </p>
                             </div>
                         </a>
                     </div>
                 </li>-->
                <!--<li class="nav-item dropdown d-none d-lg-block user-dropdown">
                    <a class="nav-link" id="UserDropdown" href="#" data-bs-toggle="dropdown" aria-expanded="false">
                        <img class="img-xs rounded-circle" src="../../../../static/assets/images/faces/face8.jpg"
                             alt="Profile image"> </a>
                    <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                        <div class="dropdown-header text-center">
                            <img class="img-md rounded-circle" src="../../../../static/assets/images/faces/face8.jpg"
                                 alt="Profile image">
                            <p class="mb-1 mt-3 fw-semibold">Allen Moreno</p>
                            <p class="fw-light text-muted mb-0">allenmoreno@gmail.com</p>
                        </div>
                        <a class="dropdown-item"><i
                                class="dropdown-item-icon mdi mdi-account-outline text-primary me-2"></i> My Profile
                            <span class="badge badge-pill badge-danger">1</span></a>
                        <a class="dropdown-item"><i
                                class="dropdown-item-icon mdi mdi-message-text-outline text-primary me-2"></i> Messages</a>
                        <a class="dropdown-item"><i
                                class="dropdown-item-icon mdi mdi-calendar-check-outline text-primary me-2"></i>
                            Activity</a>
                        <a class="dropdown-item"><i
                                class="dropdown-item-icon mdi mdi-help-circle-outline text-primary me-2"></i> FAQ</a>
                        <a class="dropdown-item"><i class="dropdown-item-icon mdi mdi-power text-primary me-2"></i>Sign
                            Out</a>
                    </div>
                </li>-->
            </ul>
            <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button"
                    data-bs-toggle="offcanvas">
                <span class="mdi mdi-menu"></span>
            </button>
        </div>
    </nav>
    <!-- partial -->
        <div class="container-fluid page-body-wrapper">
            <!-- partial:../../partials/_sidebar.html -->
            <nav class="sidebar sidebar-offcanvas" id="sidebar">
                <ul class="nav">
                    <!-- <li class="nav-item">
                        <a class="nav-link" href="../../index.html">
                            <i class="mdi mdi-grid-large menu-icon"></i>
                            <span class="menu-title">관리자 페이지</span>
                        </a>
                    </li> -->
                    <!--            <li class="nav-item nav-category">UI Elements</li>-->
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#ui-basic" aria-expanded="false"
                           aria-controls="ui-basic">
                            <i class="menu-icon mdi mdi-floor-plan"></i>
                            <span class="menu-title">영업 데이터 통계 </span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="ui-basic">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link" href="../../ui-features/buttons.html">Buttons</a>
                                </li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="../../ui-features/dropdowns.html">Dropdowns</a></li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="../../ui-features/typography.html">Typography</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#form-elements" aria-expanded="false"
                           aria-controls="form-elements">
                            <i class="menu-icon mdi mdi-card-text-outline"></i>
                            <span class="menu-title">재고관리</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="form-elements">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link" href="../../forms/basic_elements.html">Basic
                                    Elements</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#charts" aria-expanded="false"
                           aria-controls="charts">
                            <i class="menu-icon mdi mdi-chart-line"></i>
                            <span class="menu-title">다솜 홍보 등록</span>
                            <i class="menu-arrow"></i>``
                        </a>
                        <div class="collapse" id="charts">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link"
                                                        href="../../main/promotion3/auto_promo1.html">자동영업</a></li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="../../api/promotion-discount/main">제품할인</a></li>
                                <li class="nav-item"><a class="nav-link"
                                                        href="../../main/promotion3/event_promo3.html">프로모션</a></li>
                                <li class="nav-item"><a class="nav-link" href="../../main/promotion3/announcement4.html">공지사항</a>
                                </li>
                            </ul>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false"
                           aria-controls="tables">
                            <i class="menu-icon mdi mdi-table"></i>
                            <span class="menu-title">설정</span>
                            <i class="menu-arrow"></i>
                        </a>
                        <div class="collapse" id="tables">
                            <ul class="nav flex-column sub-menu">
                                <li class="nav-item"><a class="nav-link" href="../../tables/basic-table.html">내 정보 관리</a></li>
                                <li class="nav-item"><a class="nav-link" href="../../tables/basic-table.html">매장정보 관리</a></li>
                                <li class="nav-item"><a class="nav-link" href="redirect:/page/user/dasomlocation">다솜기기 관리</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </nav>
    <!-- partial -->

    <div class="main-panel">

        <div class="content-wrapper">
            <div class="row">
                <div class="col-lg-12 grid-margin">
                    <div id ="test">
                        <div class="card discount-register">
                            <%@ include file="fragments/content1.jsp" %>
                        </div>

                        <div id="content2" class="card discount-register">
                            <%@ include file="fragments/content2.jsp" %>
                        </div>

                        <div class="card discount-register">
                            <%@ include file="fragments/content3.jsp" %>
                        </div>
                    </div>

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
<script src="${pageContext.request.contextPath}/static/assets/js/beverageDiscount.js"></script>


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