package com._thefull.dasom_web_demo.controller;

import com._thefull.dasom_web_demo.domain.dto.UserJoinRequestDto;
import com._thefull.dasom_web_demo.service.UserRegisterService;
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
    public String register(@RequestParam("store") String store,
                                 @RequestParam("name") String name,
                                 @RequestParam("phoneNum") String phoneNum,
                                 @RequestParam("email") String email,
                                 @RequestParam("password") String password,
                                 RedirectAttributes redirectAttributes){

        UserJoinRequestDto dto = new UserJoinRequestDto(store, name, email, phoneNum, password);
        userRegisterService.registerUser(dto);

        redirectAttributes.addFlashAttribute("name",name);

        return "redirect:/page/user/registersuccess";
    }

}
