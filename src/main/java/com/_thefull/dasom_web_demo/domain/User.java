package com._thefull.dasom_web_demo.domain;

import jakarta.persistence.*;
import lombok.*;

@AllArgsConstructor
@Getter
@Entity(name = "user")
@Builder
@NoArgsConstructor // 기본 생성자 추가
public class User extends BaseEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private long userId;

    @Column(length = 50, name = "name")
    private String name;

    @Column(length = 20, name = "phone_num")
    private String phoneNum;

    @Column(name = "password")
    private String password;

    @Column(name = "email")
    private String email;

    @Column(name = "profile_image_url")
    private String profileImageUrl;

    @Column(name = "store")
    private String store;


}
