package com._thefull.dasom_web_demo.domain.robotLocation.domain.dto;

import com._thefull.dasom_web_demo.domain.robot.domain.Robot;
import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.bind.annotation.RequestParam;

@Data
@NoArgsConstructor
public class RobotLocationRequestDTO {

    @NotBlank
    private String location;

    private String leftSide;
    private String rightSide;
    private String rightFront;
    private String leftFront;
    private String front;


    public RobotLocationCategory from(Robot robot) {
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
