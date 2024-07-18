package com._thefull.dasom_web_demo.domain.store.domain;

import com._thefull.dasom_web_demo.domain.user.domain.User;
import jakarta.annotation.Nullable;
import jakarta.persistence.*;
import jakarta.validation.constraints.Null;
import lombok.*;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import java.time.LocalDateTime;
import java.util.Stack;

@Entity
@AllArgsConstructor
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EntityListeners(AuditingEntityListener.class)
@Builder
@Getter
public class Store {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "STORE_ID")
    private Long id;

    @Column(name = "NAME", length = 100)
    private String name;

    @Column(name = "COMPANY_NAME",length = 50)
    @Nullable
    private String companyName;

    @Column(name = "INSTAGRAM_LINK")
    @Nullable
    private String instagramLink;

    @Column(name = "PHONE_NUM")
    private String phoneNum;

    @CreatedDate
    @Column(name = "REGISTER_DATE", updatable = false, columnDefinition = "TIMESTAMP")
    private LocalDateTime registerDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "USER_ID")
    private User user;
}
