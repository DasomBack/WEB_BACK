package com._thefull.dasom_web_demo.domain.user.controller;

import com._thefull.dasom_web_demo.domain.spare_robotLocation.domain.RobotLocationCategory;
import com._thefull.dasom_web_demo.domain.spare_robotLocation.service.RobotLocatinService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/page/user")
public class UserRegisterPageController {
    private final RobotLocatinService robotLocatinService;

    @GetMapping("/register")
    public String getRegisterPage(){
        System.out.println("UserPageController.getRegisterPage");
        return "/user/register";
    }

    @GetMapping("/registersuccess")
    public String getRegisterSuccessPage(){
        return "/user/registersuccess";
    }



    @GetMapping("/index")
    public String indexpage(){
        return "../static/index";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "/user/login";
    }

    @GetMapping("/promotion")
    public String productPage(){
        return "/promotion/main";
    }

    @GetMapping("/resetpassword")
    public String resetpasswordPage(){
        return "/user/resetpassword";
    }

    @GetMapping("/dasomlocation")
    public String dasomlocation(Model model,
                                HttpServletRequest request){
        HttpSession session = request.getSession(false);

        System.out.println("여기로 로딩되면 안됨");

        if (session==null){
            return "redirect:/page/user/login";
        }

        Long storeId = (Long) session.getAttribute("storeId");
        List<RobotLocationCategory> allRobotLocationCategories = robotLocatinService.findAllRobotLocationCategories(storeId);
        model.addAttribute("all_robot_location_category_list", allRobotLocationCategories);


        return "settings/dasomlocation";

    }

}
