package com._thefull.dasom_web_demo.domain.robotLocation.controller;

import com._thefull.dasom_web_demo.domain.robotLocation.domain.dto.RobotLocationRequestDTO;
import com._thefull.dasom_web_demo.domain.robotLocation.service.RobotLocatinService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/robotLocation")
public class RobotLocationController {
    private final RobotLocatinService robotLocatinService;

    /*@Value("${tmp.user_id}")
    private Long userId;*/

   /* @Value("${tmp.robot_id}")
    private Long robotId;*/

    //    @PostMapping("/register")
//    public String register(@RequestParam("location") String location,
//                           @RequestParam("category") String category,
//                           RedirectAttributes redirectAttributes) {
//        RobotLocationRequestDTO dto = new RobotLocationRequestDTO(location, category);
//        robotService.registerRobotLocation(dto);
//
//        redirectAttributes.addFlashAttribute("category", category);
//
//        return "redirect:/page/user/register";
//    }

    @PostMapping("/register")
    public String registerRobotLocation(@RequestParam("location") String location,
                                        @RequestParam(value = "leftSide", required = false) String leftSide,
                                        @RequestParam(value = "leftFront", required = false) String leftFront,
                                        @RequestParam(value = "front", required = false) String front,
                                        @RequestParam(value = "rightSide", required = false) String rightSide,
                                        @RequestParam(value = "rightFront", required = false) String rightFront
                                        /*HttpSession session*/) {
           /* Long userId = (Long) session.getAttribute("userId");*/
        RobotLocationRequestDTO dto = new RobotLocationRequestDTO(location, leftSide, front, rightFront, rightSide, leftFront);
        robotLocatinService.registerRobotLocation(dto);
        return "settings/dasomlocation";
    }


}
