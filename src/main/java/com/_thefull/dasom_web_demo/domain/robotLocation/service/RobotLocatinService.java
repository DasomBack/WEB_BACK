package com._thefull.dasom_web_demo.domain.robotLocation.service;

import com._thefull.dasom_web_demo.domain.robotLocation.domain.dto.RobotLocationRequestDTO;
import com._thefull.dasom_web_demo.domain.robotLocation.repository.RobotLocationRepository;
import com._thefull.dasom_web_demo.global.exception.AppException;
import com._thefull.dasom_web_demo.global.exception.ErrorCode;
/*import com._thefull.dasom_web_demo.domain.robot.domain.Robot;
import com._thefull.dasom_web_demo.domain.robot.repository.RobotRepository;*/
import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor
public class RobotLocatinService {
    private final RobotLocationRepository robotLocationRepository;
   /* private final RobotRepository robotRepository;*/


   /* private final StoreRepository storeRepository;*/

    public void registerRobotLocation(RobotLocationRequestDTO dto) {
       /* Robot robot = robotRepository.findById(robotId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_ROBOT, "로봇을 찾을 수 없습니다"));*/
        RobotLocationCategory newRobotLobotLocationCategory= dto.toEntity();
        robotLocationRepository.save(newRobotLobotLocationCategory);

    }


}