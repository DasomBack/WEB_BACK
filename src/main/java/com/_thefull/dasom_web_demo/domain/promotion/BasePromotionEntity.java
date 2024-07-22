package com._thefull.dasom_web_demo.domain.promotion;


import jakarta.persistence.*;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.SuperBuilder;

import java.sql.Time;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;

@Getter
@MappedSuperclass
@SuperBuilder
@NoArgsConstructor
public abstract class BasePromotionEntity {

    @Column(name = "`USE`")
    private Boolean use;

    @Convert(converter = StatusConverter.class)
    @Column(name = "STATUS" , columnDefinition = "TINYINT")
    private Status status;

    @Column(name = "START_DATE")
    private Date startDate;

    @Column(name = "END_DATE")
    private Date endDate;

    @Column(name = "START_TIME")
    private Time startTime;

    @Column(name = "END_TIME")
    private Time endTime;

    @Column(name = "MENT_START_TIME")
    private Time mentStartTime;

    @Column(name = "MENT_END_TIME")
    private Time mentEndTime;

    @Column(name = "MENT_FREQ")
    private int mentFreq;

//    @Column(name = "MENT_INTERVAL")
//    private int mentInterval;

    @Column(name = "IS_ADD_DESC")
    private Boolean isAddDesc;

    @Column(name = "ADD_DESC", columnDefinition = "TINYTEXT")
    private String addDesc;

    @Column(name = "MENT", columnDefinition = "TEXT")
    private String ment;

    public BasePromotionEntity(Boolean use, Status status, Date startDate, Date endDate, Time startTime, Time endTime, Time mentStartTime, Time mentEndTime, int mentFreq, Boolean isAddDesc, String addDesc, String ment) {
        LocalDateTime starttime = startDate.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        LocalDateTime now = LocalDateTime.now();
        status = Status.IN_PROGRESS;
        if (now.isBefore(starttime)){
            status=Status.SCHEDULED;
        }

        this.use = use;
        this.status = status;
        this.startDate = startDate;
        this.endDate = endDate;
        this.startTime = startTime;
        this.endTime = endTime;
        this.mentStartTime = mentStartTime;
        this.mentEndTime = mentEndTime;
        this.mentFreq = mentFreq;
        this.isAddDesc = isAddDesc;
        this.addDesc = addDesc;
        this.ment = ment;
    }
}
