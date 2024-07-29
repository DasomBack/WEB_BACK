package com._thefull.dasom_web_demo.domain.robotLocation.domain.dto;

import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

@Data
@NoArgsConstructor
@AllArgsConstructor

public class RobotLocationRequestDTO {

    private String location;
    private String leftSide;
    private String front;
    private String rightFront;
    private String rightSide;
    private String leftFront;


    public RobotLocationCategory toEntity() {
        return RobotLocationCategory.builder()
                .location(this.location)
                .leftSide(this.leftSide)
                .front(this.front)
                .rightFront(this.rightFront)
                .rightSide(this.rightSide)
                .leftFront(this.leftFront)
                /*.robotId(this.robotId)*/
                .build();
    }
}
