package com._thefull.dasom_web_demo.domain.robotLocation.controller;

import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import com._thefull.dasom_web_demo.domain.robotLocation.domain.dto.RobotLocationRequestDTO;
import com._thefull.dasom_web_demo.domain.robotLocation.service.RobotLocatinService;
import com._thefull.dasom_web_demo.domain.user.domain.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/robotLocation")
public class RobotLocationController {
    private final RobotLocatinService robotLocatinService;

    /* 메인 화면 */
    @GetMapping("/main")
    public String getMainPageRobotLocation(Model model,
                                           HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if (session==null){
            return "redirect:/page/user/login";
        }

        Long storeId = (Long) session.getAttribute("storeId");
        List<RobotLocationCategory> allRobotLocationCategories = robotLocatinService.findAllRobotLocationCategories(storeId);
        model.addAttribute("all_robot_location_category_list", allRobotLocationCategories);

        return "settings/dasomlocation";

    }

    @PostMapping("/register")
    public String registerRobotLocation(@ModelAttribute RobotLocationRequestDTO requestDTO,
                                        BindingResult bindingResult,
                                        HttpServletRequest request){

        HttpSession session = request.getSession(false);
        if (session==null){
            return "redirect:/page/user/login";
        }

        Long storeId = (Long) session.getAttribute("storeId");

        robotLocatinService.registerRobotLocation( storeId, requestDTO);
        return "redirect:/page/user/dasomlocation";
    }


}
