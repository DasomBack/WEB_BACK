<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>제품할인</title>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css.style.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/css/beverageDiscountpage.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/feather/feather.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/ti-icons/css/themify-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/typicons/typicons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/simple-line-icons/css/simple-line-icons.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/static/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    </head>

    <body>
        <div class="container-scroller">
            <%@ include file="fragments/top-nav.jsp" %>
            <div class="container-fluid page-body-wrapper">
                <%@ include file="fragments/nav-menu.jsp" %>
                <div class="main-panel">
                    <div class="content-wrapper">

                        <div class="content all-list">
                            <%@ include file="fragments/menu-promotion-fragment1.jsp" %>
                        </div>

                        <div class="content register-promotion">
                            <%@ include file="fragments/menu-promotion-fragment2.jsp" %>
                        </div>

                        <div class="content completed-list">
                            <%@ include file="fragments/menu-promotion-fragment3.jsp" %>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendors/js/vendor.bundle.base.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendors/typeahead.js/typeahead.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/vendors/select2/select2.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/off-canvas.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/template.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/settings.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/hoverable-collapse.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/todolist.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/file-upload.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/typeahead.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/select2.js"></script>
    <script src="${pageContext.request.contextPath}/static/assets/js/menuPromotion.js"></script>
    </body>
</html>



