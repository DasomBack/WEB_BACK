package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain;


import com._thefull.dasom_web_demo.domain.menu.domain.Menu;
import com._thefull.dasom_web_demo.domain.promotion.BasePromotionEntity;
import com._thefull.dasom_web_demo.domain.promotion.Status;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionRequestDTO;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.*;
import lombok.experimental.SuperBuilder;
import org.hibernate.validator.internal.util.stereotypes.ThreadSafe;

import java.sql.Time;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;


@Entity
@Table(name = "MENU_PROMOTIONS")
@Getter @SuperBuilder
@NoArgsConstructor
@AllArgsConstructor
public class MenuPromotion extends BasePromotionEntity {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MENU_PROMO_ID", updatable = false)
    private Long id;

    //할인 여부 : 할인하지 않은 상품도 홍보할 수 있습니다.
    @Column(name = "IS_DISC")
    private Boolean isDisc;

    @Column(name = "PRICE")
    @NotNull
    private Integer price;

    // 할인 적용 가격 : 할인이 적용된 가격
    @Column(name = "DISC_PRICE")
    private Integer discPrice;

    // 할인값(원)
    @Builder.Default
    @Column(name = "DISC_VAL")
    private Integer discVal=0;

    // 할인율(%)
    @Builder.Default
    @Column(name = "DISC_RATE")
    private Integer discRate=0;

    @Transient
    private Boolean isDiscRate;

    @Column(name = "IS_ADD_COND")
    private Boolean isAddCond;

    @Column(name = "ADD_DISC_COND", length = 1000)
    private String addDiscCond;

    @Column(name = "IS_ALWAYS")
    private Boolean isAlways;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "STORE_ID")
    private Store store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MENU_ID")
    private Menu menu;

    @PostLoad
    public void setIsDiscRate(){

        if (this.discRate==0)
            this.isDiscRate=false;
        else
            this.isDiscRate=true;
    }


    public void updateEntity(MenuPromotionRequestDTO dto,int freq){
        super.updateEntity(dto,freq);
        this.price=dto.getPrice();
        this.discVal=dto.getDiscVal();
        this.discPrice= dto.getDiscPrice();
        this.isAddCond=dto.getBoolAddCond();
        this.addDiscCond=dto.getAddDiscCond();
        this.isAlways=dto.getBoolIsAlways();

    }

    public static MenuPromotion from(MenuPromotionRequestDTO dto, Menu menu, Store store, Status status){
        return MenuPromotion.builder()
                .status(status)
                .menu(menu)
                .use(true)
                .price(dto.getPrice())
                .discVal(dto.getDiscVal())
                .discPrice(Math.abs(dto.getDiscPrice()))
                .startDate(dto.getStartDate())
                .endDate(dto.getEndDate())
                .isAlways(dto.getBoolIsAlways())
                .startTime(dto.getStartTime())
                .endTime(dto.getEndTime())
                .boolEqlStoreOpr(dto.getBoolEqlStoreOpr())
                .mentStartTime(dto.getMentStartTime())
                .mentEndTime(dto.getMentEndTime())
                .boolEqlStoreOpr(dto.getBoolEqlStoreOpr())
                .mentInterval(dto.getInterval())
                .isAddCond(dto.getBoolAddCond())
                .addDiscCond(dto.getAddDiscCond())
                .isAddDesc(dto.getBoolAddDesc())
                .addDesc(dto.getAddMenuDesc())
                .ment(dto.getMent())
                .store(store)
                .build();
    }



}
