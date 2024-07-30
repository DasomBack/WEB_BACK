package com._thefull.dasom_web_demo.domain.promotion;


import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionRequestDTO;
import jakarta.persistence.*;
import lombok.*;
import lombok.experimental.SuperBuilder;

import java.sql.Time;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;

@Getter
@MappedSuperclass
@SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public abstract class BasePromotionEntity {

    @Column(name = "`USE`")
    private Boolean use;

    @Setter
    @Convert(converter = StatusConverter.class)
    @Column(name = "STATUS" , columnDefinition = "TINYINT")
    private Status status;

    @Column(name = "START_DATE")
    private LocalDate startDate;

    @Column(name = "END_DATE")
    private LocalDate endDate;

    @Column(name = "START_TIME")
    private LocalTime startTime;

    @Column(name = "END_TIME")
    private LocalTime endTime;

    @Column(name = "MENT_START_TIME")
    private LocalTime mentStartTime;

    @Column(name = "MENT_END_TIME")
    private LocalTime mentEndTime;

    @Column(name = "MENT_FREQ")
    private int mentFreq;

    @Column(name = "IS_ADD_DESC")
    private Boolean isAddDesc;

    @Column(name = "ADD_DESC", columnDefinition = "TINYTEXT")
    private String addDesc;

    @Column(name = "MENT", columnDefinition = "TEXT")
    private String ment;

    public void updateStatus(Status s){
        this.status=s;
    }

    public void updateEntity(MenuPromotionRequestDTO dto,int freq){
        this.startDate=dto.getStartDate();
        this.endDate=dto.getEndDate();
        this.startTime=dto.getStartTime();
        this.endTime=dto.getEndTime();
        this.mentStartTime=dto.getMentStartTime();
        this.mentEndTime=dto.getMentEndTime();
        this.isAddDesc=dto.isBoolAddDesc();
        this.mentFreq=freq;
        this.addDesc=dto.getAddMenuDesc();
        this.ment=dto.getMent();

    }


}
