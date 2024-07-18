package com._thefull.dasom_web_demo.domain.menu.domain;

import com._thefull.dasom_web_demo.domain.menu.Category;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import jakarta.validation.constraints.Null;
import lombok.*;

import javax.print.attribute.standard.MediaSize;

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
    @Nullable
    private String imgUrl;

    // 메뉴 한 줄 설명
    @Column(name = "DESC", length = 500)
    @Nullable
    private String desc;

    //신메뉴 여부
    @Column(name = "IS_NEW")
    @Nullable
    private Boolean isNew;

    @Convert(converter = CategoryConverter.class)
    @Column(name = "CATEGORY")
    private Category category;

    @Column(name = "SIZE", length = 10)
    private String size;

    @Column(name = "CAPACITY")
    @Nullable
    private int capacity;

    // 가게 제조 메뉴 여부
    @Column(name = "IS_INHOUSE")
    private Boolean isInhouse;

    // 납품메뉴인 경우
    @Column(name = "STOCK")
    @Nullable
    private int stock;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "STORE_ID")
    private Store store;


}
