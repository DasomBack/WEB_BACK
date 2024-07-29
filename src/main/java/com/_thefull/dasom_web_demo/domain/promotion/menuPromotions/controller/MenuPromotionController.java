package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.controller;


import com._thefull.dasom_web_demo.domain.menu.domain.Menu;
import com._thefull.dasom_web_demo.domain.menu.service.MenuService;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionRequestDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionResponseDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.service.MenuPromotionService;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import com._thefull.dasom_web_demo.domain.store.service.StoreService;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
@RequestMapping("/api/menu_promotion")
public class MenuPromotionController {
    private final MenuPromotionService menuPromotionService;
    private final MenuService menuService;

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
    public String registerMenuPromotion(@ModelAttribute MenuPromotionRequestDTO requestDTO){
        menuPromotionService.registerMenuPromotion(storeId, requestDTO);

        return "redirect:/api/menu_promotion/main";
    }

    @GetMapping("/list/completed")
    public String findCompletedPromotionList(Model model){
        List<MenuPromotionResponseDTO> menupromotion_list = menuPromotionService.findCompletedPromotionList(storeId);
        model.addAttribute("menupromotion_list",menupromotion_list);

        System.out.println("MenuPromotionController.findCompletedPromotionList");
        return "fragments/foot :: foot";
    }

    @ResponseStatus(HttpStatus.SEE_OTHER)
    @PutMapping("/update")
    public String updatePromotionContent(@ModelAttribute MenuPromotionRequestDTO requestDTO){
        System.out.println("MenuPromotionController.updatePromotionContent");
        menuPromotionService.updatePromotionContent(requestDTO);

        return "redirect:/api/menu_promotion/main";
    }


    @GetMapping("/main")
    public String menuPromotionMainPage(Model model){
        System.out.println("MenuPromotionController.menuPromotionMainPage");



        List<MenuPromotionResponseDTO> allPromotionList = menuPromotionService.findAllPromotionList(storeId);
        model.addAttribute("all_promotion_list",allPromotionList);

        List<MenuPromotionResponseDTO> completedPromotionList = menuPromotionService.findCompletedPromotionList(storeId);
        model.addAttribute("completed_promotion_list", completedPromotionList);

        List<Menu> menuList = menuService.findAllMenu();
        model.addAttribute("menu_list",menuList);


        return "menuPromotion/menu-promotion-main";
    }
}
