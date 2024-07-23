//package com._thefull.dasom_web_demo.domain.robot.domain;
//
//import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
//import com._thefull.dasom_web_demo.domain.user.domain.User;
//import jakarta.persistence.*;
//import lombok.*;
//import org.springframework.data.jpa.domain.support.AuditingEntityListener;
//
//import java.util.ArrayList;
//import java.util.List;
//
//@AllArgsConstructor
//@NoArgsConstructor(access = AccessLevel.PROTECTED)
//@EntityListeners(AuditingEntityListener.class)
//@Getter
//@Builder
//@Entity(name = "ROBOT")
//public class Robot {
//
//    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
//    @Column(name = "ROBOT_ID")
//    private long id;
//
//    @Column(name = "MODEL")
//    private String model;
//
//    @ManyToOne
//    @JoinColumn (name = "USER_ID")
//    private User user;
//
//    @OneToMany(mappedBy = "robot", cascade = CascadeType.ALL)
//    @Builder.Default
//    private List<RobotLocationCategory> robotLocationCategories = new ArrayList<>();
//}
//
