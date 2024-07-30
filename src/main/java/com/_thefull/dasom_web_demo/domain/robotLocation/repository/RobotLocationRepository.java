package com._thefull.dasom_web_demo.domain.robotLocation.repository;

/*import com._thefull.dasom_web_demo.domain.robot.domain.Robot;*/
import com._thefull.dasom_web_demo.domain.robot.domain.Robot;
import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface RobotLocationRepository extends JpaRepository<RobotLocationCategory, Long> {
    List<RobotLocationCategory> findByRobot(Robot robot);
}
