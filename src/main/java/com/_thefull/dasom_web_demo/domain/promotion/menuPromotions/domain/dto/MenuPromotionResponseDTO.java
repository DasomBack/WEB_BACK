package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto;

import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.MenuPromotion;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.sql.Time;
import java.util.Date;

@Getter
@AllArgsConstructor @Builder
public class MenuPromotionResponseDTO {

    String status;
    String category;
    String menu;

    int price;
    boolean isRate;
    int discPrice;
    int discRate;
    int discVal;

    Date startDate;
    Date endDate;
    Time startTime;
    Time endTime;
    Time mentStartTime;
    Time mentEndTime;

    int freq;

    boolean isAddCond;
    boolean isAddDesc;
    String addCond;
    String addDesc;
    String ment;

    public static MenuPromotionResponseDTO from(MenuPromotion e){
        return MenuPromotionResponseDTO.builder()
                .status(e.getStatus().name())
                .category(e.getMenu().getCategory().getSimpleName())
                .menu(e.getMenu().getName())
                .price(e.getPrice())
                .discPrice(e.getDiscPrice())
                .isRate(e.getIsDiscRate())
                .discVal(e.getDiscVal())
                .discRate(e.getDiscRate())
                .startDate(e.getStartDate())
                .endDate(e.getEndDate())
                .startTime(e.getStartTime())
                .endTime(e.getEndTime())
                .mentStartTime(e.getMentStartTime())
                .mentEndTime(e.getMentEndTime())
                .freq(e.getMentFreq())
                .isAddCond(e.getIsAddCond())
                .addCond(e.getAddDiscCond())
                .isAddDesc(e.getIsAddDesc())
                .addDesc(e.getAddDesc())
                .ment(e.getMent())
                .build();
    }


}
