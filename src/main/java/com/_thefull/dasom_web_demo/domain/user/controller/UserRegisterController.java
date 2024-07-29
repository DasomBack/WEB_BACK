package com._thefull.dasom_web_demo.domain.user.controller;

import com._thefull.dasom_web_demo.domain.user.service.UserRegisterService;
import com._thefull.dasom_web_demo.domain.user.domain.dto.UserJoinRequestDto;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class UserRegisterController {

    private final UserRegisterService userRegisterService;

    @PostMapping("/register")
    public String register(@RequestParam("code") String code,
                                @RequestParam("name") String name,
                                 @RequestParam("phoneNum") String phoneNum,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 RedirectAttributes redirectAttributes){

        UserJoinRequestDto dto = new UserJoinRequestDto(code, name, email, phoneNum, password);
        userRegisterService.registerUser(dto,code);

        redirectAttributes.addFlashAttribute("name",name);

        return "redirect:/page/user/registersuccess";
    }


}
