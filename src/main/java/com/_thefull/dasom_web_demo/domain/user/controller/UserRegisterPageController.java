package com._thefull.dasom_web_demo.domain.user.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page/user")
public class UserRegisterPageController {

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
    public String dasomlocation(HttpServletRequest request){
        HttpSession session = request.getSession();
        return "/settings/dasomlocation";
    }

}
