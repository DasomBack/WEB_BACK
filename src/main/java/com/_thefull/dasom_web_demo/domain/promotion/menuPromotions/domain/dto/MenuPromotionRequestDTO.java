package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MenuPromotionRequestDTO {

    private String category;
    private String menu;

    private int price;
    private int discVal;
    private int discPrice;

    private LocalDate startDate;
    private LocalDate endDate;
    private boolean boolIsAlways;
    private LocalTime startTime;
    private LocalTime endTime;
    private LocalTime mentStartTime;
    private LocalTime mentEndTime;
    private int interval;

    private boolean boolAddCond;
    private String addDiscCond;

    private boolean boolAddDesc;
//    private String addDesc;
    private String addMenuDesc;

    private String ment;

    private boolean test;



}
