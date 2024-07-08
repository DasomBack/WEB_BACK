package com._thefull.dasom_web_demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/page/user")
public class UserRegisterPageController {
    @GetMapping("/register")
    public String getRegisterPage(){
        System.out.println("UserPageController.getRegisterPage");
        return "/pages/user/register";
    }


    @GetMapping("/registersuccess")
    public String getRegisterSuccessPage(){

        return "/pages/user/registersuccess";
    }

    @GetMapping("/index")
    public String indexpage(){
        return "../static/index";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "/pages/user/login";
    }

}
