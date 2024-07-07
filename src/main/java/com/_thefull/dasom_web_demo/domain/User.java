package com._thefull.dasom_web_demo.domain;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Generated;
import lombok.Getter;

@AllArgsConstructor
@Getter
@Entity(name = "user")
@Builder
public class User extends BaseEntity{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long userId;

    @Column(length = 50)
    private String name;

    @Column(length = 20)
    private String phoneNum;

    private String password;
    private String email;

    private String profileImageUrl;
    private String store;


}
