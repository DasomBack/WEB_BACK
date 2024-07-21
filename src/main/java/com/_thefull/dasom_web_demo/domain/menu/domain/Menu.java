package com._thefull.dasom_web_demo.domain.menu.domain;

import com._thefull.dasom_web_demo.domain.menu.Category;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.MenuPromotion;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import jakarta.validation.constraints.Null;
import lombok.*;

import javax.print.attribute.standard.MediaSize;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "MENU")
@Getter @Builder
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor
public class Menu {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MENU_ID")
    private Long id;

    @Column(name = "NAME", length = 100)
    private String name;

    @Column(name = "PRICE")
    private int price;

    @Column(name = "BASE_PRICE")
    private int basePrice;

    @Column(name = "IMG_URL")
    private String imgUrl;

    // 메뉴 한 줄 설명
    @Column(name = "`DESC`", length = 500)
    private String desc;

    //신메뉴 여부
    @Column(name = "IS_NEW")
    private Boolean isNew;

    @Convert(converter = CategoryConverter.class)
    @Column(name = "CATEGORY")
    private Category category;

    @Column(name = "SIZE", length = 10)
    private String size;

    @Column(name = "CAPACITY")
    private int capacity;

    // 가게 제조 메뉴 여부
    @Column(name = "IS_INHOUSE")
    private Boolean isInhouse;

    // 납품메뉴인 경우
    @Column(name = "STOCK")
    private int stock;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "STORE_ID")
    private Store store;

    @Builder.Default
    @OneToMany(mappedBy = "menu", cascade = CascadeType.ALL)
    private List<MenuPromotion> menuPromotionList = new ArrayList<>();


}