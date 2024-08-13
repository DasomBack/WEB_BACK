<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
        <nav class="sidebar sidebar-offcanvas" id="sidebar">
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="../../page/main" aria-expanded="false"
                        aria-controls="form-elements">
                        <i class="material-symbols-outlined">bar_chart_4_bars</i>
                        <span class="menu-title">영업 데이터 통계 </span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#" aria-expanded="false"
                       aria-controls="form-elements">
                        <i class="material-symbols-outlined">inventory_2</i>
                        <span class="menu-title">재고관리</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#promotions" aria-expanded="false"
                                                               aria-controls="promotions">
                        <i class="material-symbols-outlined">campaign</i>
                        <span class="menu-title">다솜 홍보 등록</span>
                    </a>
                    <div class="collapse" id="promotions">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link"
                                                    href="#">자동영업</a></li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="../../api/promotion-discount/main">제품홍보</a></li>
                            <li class="nav-item"><a class="nav-link"
                                                    href="#">프로모션</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">공지사항</a>
                            </li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-bs-toggle="collapse" href="#tables" aria-expanded="false"
                       aria-controls="tables">
                        <i class="material-symbols-outlined">settings</i>
                        <span class="menu-title">설정</span>
                    </a>
                    <div class="collapse" id="tables">
                        <ul class="nav flex-column sub-menu">
                            <li class="nav-item"><a class="nav-link" href="#">내 정보 관리</a></li>
                            <li class="nav-item"><a class="nav-link" href="../../settings/dasom-locations/main">매장정보 관리</a></li>
                            <li class="nav-item"><a class="nav-link" href="#">다솜기기 관리</a></li>
                        </ul>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../../page/user/login">로그인</a>
                    <a class="nav-link" href="../../page/user/register">회원가입</a>
                </li>
            </ul>
        </nav>
