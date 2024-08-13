package com._thefull.dasom_web_demo.domain.robotLocation.domain.dto;

import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;

import java.util.List;
import java.util.stream.Collectors;

@Getter
@AllArgsConstructor
@Builder
public class RobotLocationResponseDTO {

    private Long id;
    private String location;
    private String leftSide;
    private String rightSide;
    private String leftFront;
    private String rightFront;
    private String front;
    private Boolean use;

    public static RobotLocationResponseDTO of(RobotLocationCategory e){
        return RobotLocationResponseDTO.builder()
                .id(e.getId())
                .location(e.getLocation())
                .leftSide(e.getLeftSide())
                .rightSide(e.getRightSide())
                .leftFront(e.getLeftFront())
                .rightFront(e.getRightFront())
                .front(e.getFront())
                .use(e.getUse())
                .build();
    }

    public static List<RobotLocationResponseDTO> toDTOList(List<RobotLocationCategory> dasomLocationList){
        return dasomLocationList.stream()
                .map(RobotLocationResponseDTO::of)
                .collect(Collectors.toList());
    }



}
