package com._thefull.dasom_web_demo.domain.robotLocation.controller;

import com._thefull.dasom_web_demo.domain.robotLocation.domain.RobotLocationCategory;
import com._thefull.dasom_web_demo.domain.robotLocation.domain.dto.RobotLocationRequestDTO;
import com._thefull.dasom_web_demo.domain.robotLocation.service.RobotLocatinService;
import com._thefull.dasom_web_demo.domain.user.domain.User;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/settings/dasom-locations")
public class RobotLocationController {
    private final RobotLocatinService robotLocatinService;
//
//    @GetMapping("/all")
//    public ResponseEntity<>





}
