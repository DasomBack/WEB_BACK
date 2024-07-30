<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
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
                        <i class="menu-arrow"></i>
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
                            <li class="nav-item"><a class="nav-link" href="../../page/user/dasomlocation">다솜기기 관리</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
        </nav>
