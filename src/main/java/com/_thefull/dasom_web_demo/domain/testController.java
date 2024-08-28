package com._thefull.dasom_web_demo.domain;

import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/test")
@RequiredArgsConstructor
public class testController {
    @GetMapping("/test")
    public ResponseEntity test(){
        System.out.println("testController.test");
        return ResponseEntity.ok().body("here, connected");
    }
}
