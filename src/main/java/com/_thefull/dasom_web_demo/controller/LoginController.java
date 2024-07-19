package com._thefull.dasom_web_demo.controller;

import com._thefull.dasom_web_demo.domain.User;
import com._thefull.dasom_web_demo.domain.dto.LoginRequestDto;
import com._thefull.dasom_web_demo.domain.dto.UserJoinRequestDto;
import com._thefull.dasom_web_demo.service.LoginService;
import com._thefull.dasom_web_demo.service.UserRegisterService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class LoginController {

    private final LoginService LoginService;

    @PostMapping("/login")
    public String login(@RequestParam("store") String store,
                        @RequestParam("phoneNum") String phoneNum,
                        @RequestParam("password") String password){

        LoginRequestDto dto = new LoginRequestDto(store, phoneNum, password);
        User user = LoginService.login(dto);


        if (user != null) {
            return "redirect:/page/user/product";
        } else {
            return "redirect:/page/user/login";
        }
    }
}


