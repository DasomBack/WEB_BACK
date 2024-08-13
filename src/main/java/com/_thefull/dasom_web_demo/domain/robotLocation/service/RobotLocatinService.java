package com._thefull.dasom_web_demo.domain.robotLocation.service;

import com._thefull.dasom_web_demo.domain.robot.domain.Robot;
import com._thefull.dasom_web_demo.domain.robot.repository.RobotRepository;
import com._thefull.dasom_web_demo.domain.robotLocation.domain.dto.RobotLocationRequestDTO;
import com._thefull.dasom_web_demo.domain.robotLocation.domain.dto.RobotLocationResponseDTO;
import com._thefull.dasom_web_demo.domain.robotLocation.repository.RobotLocationRepository;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import com._thefull.dasom_web_demo.domain.store.repository.StoreRepository;
import com._thefull.dasom_web_demo.global.exception.AppException;
import com._thefull.dasom_web_demo.global.exception.ErrorCode;
/*import com._thefull.dasom_web_demo.domain.robot.domain.Robot;
import com._thefull.dasom_web_demo.domain.robot.repository.RobotRepository;*/
import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.Length;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service
@Slf4j @Transactional
@RequiredArgsConstructor
public class RobotLocatinService {
    private final RobotLocationRepository robotLocationRepository;
    private final RobotRepository robotRepository;
    private final StoreRepository storeRepository;


    public List<RobotLocationCategory> findAllRobotLocationCategories(Long storeId){
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_STORE, "매장을 찾을 수 없습니다."));
        List<Robot> robotList = robotRepository.findByStore(store);
        List<RobotLocationCategory> robotLocationCategoryList = new ArrayList<>();
        if (robotList==null)
            throw new AppException(ErrorCode.NO_ROBOT_IN_STORE,"매장 다솜이를 찾을 수 없습니다.");
        for (Robot r: robotList){
            List<RobotLocationCategory> categoryList = robotLocationRepository.findByRobot(r);
            robotLocationCategoryList.addAll(categoryList);
        }

        if (robotLocationCategoryList==null){
            throw new AppException(ErrorCode.NO_ROBOT_IN_STORE,"매장 다솜이를 찾을 수 없습니다.");
        }

        return robotLocationCategoryList;

    }

    public void registerRobotLocation(Long storeId, RobotLocationRequestDTO dto) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_STORE, "매장을 찾을 수 없습니다."));
        List<Robot> robotList = robotRepository.findByStore(store);
        if (robotList==null)
            throw new AppException(ErrorCode.NO_ROBOT_IN_STORE,"매장 다솜이를 찾을 수 없습니다.");

        Robot robot = robotList.get(0);
        RobotLocationCategory newRobotLobotLocationCategory= dto.from(robot);
        robotLocationRepository.save(newRobotLobotLocationCategory);
    }


    public void createDasomLocation(RobotLocationRequestDTO requestDTO, Long storeId, Long robotId) {
        Robot robot = robotRepository.findById(robotId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_ROBOT, "카페봇을 찾을 수 없습니다"));

        RobotLocationCategory newLocation = requestDTO.from(robot);
        robotLocationRepository.save(newLocation);

    }

    public void changeUse(Long robotId, Boolean use, Long robotLocationId) {
        Robot robot = robotRepository.findById(robotId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_ROBOT, "카페봇을 찾을 수 없습니다"));

        RobotLocationCategory location = robotLocationRepository.findById(robotLocationId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_DASOM_LOCATION, "카페봇 위치 설정을 찾을 수 없습니다"));

        /* 수정 권한 확인 */
        if (!Objects.equals(location.getRobot().getId(), robot.getId()))
            throw new AppException(ErrorCode.UNAUTHORIZED_USER,"카페봇 위치 설정을 수정할 수 없습니다");






    }
}