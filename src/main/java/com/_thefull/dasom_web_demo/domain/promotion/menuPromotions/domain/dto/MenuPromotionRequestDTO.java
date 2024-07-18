package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.util.Date;

@Getter
@NoArgsConstructor
public class MenuPromotionRequestDTO {

    private String category;
    private String menu;

    private int price;
    private int discVal;
    private int discPrice;

    private Date startDate;
    private Date endDate;
    private boolean isAlways;
    private Time startTime;
    private Time endTime;
    private Time mentStartTime;
    private Time mentEndTime;
    private int interval;

    private boolean isAddCond;
    private String addDiscCond;

    private boolean isAddDesc;
    private String addDesc;

    private String ment;


}
