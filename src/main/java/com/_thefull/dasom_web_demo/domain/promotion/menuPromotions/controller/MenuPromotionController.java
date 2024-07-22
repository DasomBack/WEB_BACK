package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.controller;


import com._thefull.dasom_web_demo.domain.menu.domain.Menu;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionRequestDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionResponseDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.service.MenuPromotionService;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import com._thefull.dasom_web_demo.domain.store.service.StoreService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/menu_promotion")
public class MenuPromotionController {
    private final MenuPromotionService menuPromotionService;

    @Value("${tmp.store_id}")
    private Long storeId;

    @Value("${tmp.user_id}")
    private Long userId;

    @GetMapping("/list/all")
    public String findAllPromotionList(Model model){
        List<MenuPromotionResponseDTO> menupromotion_list = menuPromotionService.findAllPromotionList(storeId);
        model.addAttribute("menupromotion_list",menupromotion_list);

//        return "pages/main/promotion3/menu-promotion/head";
        System.out.println("MenuPromotionController.findAllPromotionList");

        return "fragments/head :: head";
    }

    @PostMapping("/register")
    public String registerMenuPromotion(@RequestBody MenuPromotionRequestDTO requestDTO, Model model){
        menuPromotionService.registerMenuPromotion(storeId, requestDTO);

        return "redirect:/api/menu_promotion/list/all";
    }

    @GetMapping("/list/completed")
    public String findCompletedPromotionList(Model model){
        List<MenuPromotionResponseDTO> menupromotion_list = menuPromotionService.findCompletedPromotionList(storeId);
        model.addAttribute("menupromotion_list",menupromotion_list);

        System.out.println("MenuPromotionController.findCompletedPromotionList");
        return "fragments/foot :: foot";
    }

    @GetMapping("/main")
    public String menuPromotionMainPage(Model model){
        System.out.println("MenuPromotionController.menuPromotionMainPage");
        findAllPromotionList(model);
        findCompletedPromotionList(model);
        System.out.println("MenuPromotionController.menuPromotionMainPage");

        return "pages/main/promotion3/menu-promotion/main";
    }
}
