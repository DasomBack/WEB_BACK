package com._thefull.dasom_web_demo.domain.spare_robotLocation.controller;

import com._thefull.dasom_web_demo.domain.spare_robotLocation.domain.RobotLocationCategory;
import com._thefull.dasom_web_demo.domain.spare_robotLocation.domain.dto.RobotLocationRequestDTO;
import com._thefull.dasom_web_demo.domain.spare_robotLocation.service.RobotLocatinService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/test")
public class RobotLocationController {
    private final RobotLocatinService robotLocatinService;

    @GetMapping("/main")
    public String mainPage(Model model,
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

    @PostMapping
    public String createDasomLocation(@ModelAttribute RobotLocationRequestDTO requestDTO,
                                      BindingResult bindingResult,
                                      HttpServletRequest request){
        HttpSession session = request.getSession(false);
        if(session==null){
            return "redirect:/page/user/login";
        }

        Long storeId = (Long) session.getAttribute("storeId");
        Long robotId = (Long) session.getAttribute("robotId");
        robotLocatinService.createDasomLocation(requestDTO,storeId, robotId);

        return "redirect:/settings/dasom-locations/main";
    }

    @PatchMapping("/use")
    public String changeWhetherUse(@RequestParam(name = "use")Boolean use,
                                   @RequestParam(name = "id")Long id,
                                   BindingResult bindingResult,
                                   HttpServletRequest request){

        HttpSession session = request.getSession(false);
        if(session==null){
            return "redirect:/page/user/login";
        }

        Long robotId = (Long) session.getAttribute("robotId");

        robotLocatinService.changeUse(robotId, use, id);

        return "redirect:/settings/dasom-locations/main";
    }




}
