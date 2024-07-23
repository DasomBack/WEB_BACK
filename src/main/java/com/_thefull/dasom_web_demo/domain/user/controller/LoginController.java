package com._thefull.dasom_web_demo.domain.user.controller;

import com._thefull.dasom_web_demo.domain.dto.LoginRequestDto;
import com._thefull.dasom_web_demo.domain.user.domain.User;
import com._thefull.dasom_web_demo.domain.user.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/user")
public class LoginController {

    private final LoginService loginService;

    @PostMapping("/login")
    public String login(@RequestParam("phoneNum") String phoneNum,
                        @RequestParam("password") String password,
                        RedirectAttributes redirectAttributes){

        LoginRequestDto dto = new LoginRequestDto(phoneNum, password);
        User user = loginService.login(dto);

        if (user != null) {
            return "redirect:/page/user/promotion";
        } else {
            redirectAttributes.addFlashAttribute("error", "전화번호 또는 비밀번호가 일치하지 않습니다.");
            return "redirect:/page/user/login";
        }
    }
}
