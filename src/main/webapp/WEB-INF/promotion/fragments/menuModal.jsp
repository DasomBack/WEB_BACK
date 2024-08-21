<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<div id="productModal" class="custom-modal" tabindex="-1" aria-labelledby="productModalLabel"
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
                        <input type="text" class="form-control"
                               placeholder="검색" name="search" id="searchInput"><i
                            class="icon-search"></i>
                        <button class="modal-search-button" type="button"></button>
                </div>
                <ul class="grid-container" id="itemList">
                    <c:forEach items="${menu_list}" var = "menu" varStatus="status">
                        <li class="item" id="item${menu.id}" menu-add-desc="${menu.desc}">
                            <img style="width: 50px; height: 100%" src="${menu.imgUrl}" alt="샘플이미지">
                            <p class="title" id="productName${menu.id}">${menu.name}</p>
                            <p id="productPrice${menu.id}">${menu.price}원</p>
                        </li>
                    </c:forEach>
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