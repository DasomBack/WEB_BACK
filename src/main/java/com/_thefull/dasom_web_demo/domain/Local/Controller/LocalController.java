package com._thefull.dasom_web_demo.domain.Local.Controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;

import java.util.Locale;

@Controller

public class LocalController {
    @GetMapping("/hello-world-internationalized")
    public String helloWorldInternationalized() {
        return "redirect:/dasomLocation";
    }
}