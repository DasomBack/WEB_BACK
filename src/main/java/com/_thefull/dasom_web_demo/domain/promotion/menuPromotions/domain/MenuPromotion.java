package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain;


import com._thefull.dasom_web_demo.domain.menu.domain.Menu;
import com._thefull.dasom_web_demo.domain.promotion.BasePromotionEntity;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.hibernate.validator.internal.util.stereotypes.ThreadSafe;


@Entity
@Table(name = "MENU_PROMOTIONS")
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
public class MenuPromotion extends BasePromotionEntity {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MENU_PROMO_ID", updatable = false)
    private Long id;

    //할인 여부 : 할인하지 않은 상품도 홍보할 수 있습니다.
    @Column(name = "IS_DISC")
    @NotNull
    private Boolean isDisc;

    @Column(name = "PRICE")
    @NotNull
    private int price;

    // 할인 적용 가격 : 할인이 적용된 가격
    @Column(name = "DISC_PRICE")
    @Nullable
    private int discPrice;

    // 할인값(원)
    @Column(name = "DISC_VAL")
    @Nullable
    private Integer discVal;

    // 할인율(%)
    @Column(name = "DISC_RATE")
    @Nullable
    private Integer discRate;

    @Transient
    private Boolean isDiscRate;

    @Column(name = "IS_ADD_COND")
    private Boolean isAddCond;

    @Column(name = "ADD_DISC_COND", columnDefinition = "SMALLTEXT")
    private String addDiscCond;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "STORE_ID")
    private Store store;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MENU_ID")
    private Menu menu;

    public void setIsDiscRate(){
        if (this.discRate==null)
            this.isDiscRate=false;
        else
            this.isDiscRate=true;
    }




}
