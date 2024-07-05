package com._thefull.dasom_web_demo.controller;

import com._thefull.dasom_web_demo.domain.User;
import com._thefull.dasom_web_demo.domain.dto.UserJoinRequestDto;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {

    @PostMapping("/join")
    public ResponseEntity join(@RequestBody @Valid UserJoinRequestDto dto){
        System.out.println(dto.getName());
        return null;
    }
}
