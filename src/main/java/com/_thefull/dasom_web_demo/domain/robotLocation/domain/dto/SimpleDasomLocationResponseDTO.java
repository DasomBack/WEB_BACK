package com._thefull.dasom_web_demo.domain.robotLocation.domain.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

@Getter @Builder
@AllArgsConstructor
public class SimpleDasomLocationResponseDTO {
    private Long id;
    private String leftSide;
    private String rightSide;
    private String leftFront;
    private String rightFront;
    private String Front;

    private boolean use;

}
