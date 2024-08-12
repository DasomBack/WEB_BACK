package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto;

import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.MenuPromotion;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Getter
@Builder
public class MenuPromotionResponseDTO {
    Long menuPromoId;

    String status;
    String category;
    String menu;

    Integer price;
    Boolean isRate;
    Integer discPrice;
    Integer discRate;
    Integer discVal;

    Boolean boolIsAlways;
    String startDate;
    String endDate;
    String startTime;
    String endTime;
    Boolean boolEqlStoreOpr;

    String mentStartTime;
    String mentEndTime;
    Boolean boolEqlEventStart;

    Integer freq;
    Integer interval;

    Boolean boolAddCond;
    Boolean boolAddDesc;
    String addDiscCond;
    String addMenuDesc;
    String ment;


    public static MenuPromotionResponseDTO from(MenuPromotion e, int freq){
        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm");

        String startD = dateFormatter.format(e.getStartDate());
        String endD = dateFormatter.format(e.getEndDate());

        String startT = timeFormatter.format(e.getStartTime());
        String endT = timeFormatter.format(e.getEndTime());
        String MstartT = timeFormatter.format(e.getMentStartTime());
        String MendT = timeFormatter.format(e.getMentEndTime());


        return MenuPromotionResponseDTO.builder()
                .menuPromoId(e.getId())
                .status(e.getStatus().getStateType())
                .category(e.getMenu().getCategory().getSimpleName())
                .menu(e.getMenu().getName())
                .price(e.getPrice())
                .discPrice(e.getDiscPrice())
                .isRate(e.getIsDiscRate())
                .discRate(e.getDiscRate())
                .discVal(e.getDiscVal())
                .startDate(startD)
                .endDate(endD)
                .boolIsAlways(e.getIsAlways())
                .startTime(startT)
                .endTime(endT)
                .boolEqlStoreOpr(e.getBoolEqlStoreOpr())
                .mentStartTime(MstartT)
                .mentEndTime(MendT)
                .boolEqlEventStart(e.getBoolEqlEventStart())
                .freq(freq)
                .interval(e.getMentInterval())
                .boolAddCond(e.getIsAddCond())
                .addDiscCond(e.getAddDiscCond())
                .boolAddDesc(e.getIsAddDesc())
                .addMenuDesc(e.getAddDesc())
                .ment(e.getMent())
                .build();

    }


}
