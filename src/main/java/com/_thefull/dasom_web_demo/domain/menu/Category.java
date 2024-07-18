package com._thefull.dasom_web_demo.domain.menu;

import com._thefull.dasom_web_demo.global.exception.AppException;
import com._thefull.dasom_web_demo.global.exception.ErrorCode;
import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum Category {

    BEVERAGE(1,"음료","음료"),
    BAKERY(2, "베이커리", "베이커리"),
    CAKE(3, "케이크", "케이크"),
    SET(4, "세트상품","세트");


    private int categoryNum;
    private String categoryName;
    private String simpleName;


    public static Category fromCategoryNum(int categoryNum){
        for (Category c: Category.values()){
            if (c.getCategoryNum()==categoryNum)
                return c;
        }
        throw new AppException(ErrorCode.NO_CATEGORY,"존재하지 않는 카테고리입니다");
    }
}
