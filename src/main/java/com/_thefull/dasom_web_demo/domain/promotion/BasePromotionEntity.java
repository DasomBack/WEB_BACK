package com._thefull.dasom_web_demo.domain.promotion;


import jakarta.persistence.Column;
import jakarta.persistence.Convert;
import jakarta.persistence.MappedSuperclass;
import lombok.Getter;

import java.sql.Time;
import java.util.Date;

@Getter
@MappedSuperclass
public abstract class BasePromotionEntity {

    @Column(name = "USE")
    private Boolean use;

    @Convert(converter = StatusConverter.class)
    @Column(name = "STATE" , columnDefinition = "TINYINT")
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

    @Column(name = "MENT_INTERVAL")
    private int mentInterval;

    @Column(name = "IS_ADD_DESC")
    private Boolean isAddDesc;

    @Column(name = "ADD_DESC", columnDefinition = "TINYTEXT")
    private String addDesc;

    @Column(name = "MENT", columnDefinition = "TEXT")
    private String ment;


}
