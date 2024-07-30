package com._thefull.dasom_web_demo.domain.robotLocation.domain.dto;

import com._thefull.dasom_web_demo.domain.robot.domain.Robot;
import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

@Data
public class RobotLocationRequestDTO {

    private String location;
    private String leftSide;
    private String front;
    private String rightFront;
    private String rightSide;
    private String leftFront;


    public RobotLocationCategory toEntity(Robot robot) {
        return RobotLocationCategory.builder()
                .location(this.location)
                .leftSide(this.leftSide)
                .front(this.front)
                .rightFront(this.rightFront)
                .rightSide(this.rightSide)
                .leftFront(this.leftFront)
                .robot(robot)
                .build();
    }
}
