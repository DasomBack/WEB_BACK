package com._thefull.dasom_web_demo.domain.menu.controller;

import com._thefull.dasom_web_demo.domain.menu.domain.Menu;
import com._thefull.dasom_web_demo.domain.menu.service.MenuService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping("/menu")
@RequiredArgsConstructor
public class MenuController {

    private final MenuService menuService;

    @GetMapping("/all")
    public String getAllMenuList(HttpServletRequest request,
                                 Model model) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return "redirect:/page/user/login";
        }

        Long storeId= (Long)session.getAttribute("storeId");

        List<Menu> allMenu = menuService.findAllMenu(storeId);

        model.addAttribute("menu_list",allMenu);

        return "promotion/fragments/menuModal";

    }

    @GetMapping("/search")
    public String getSearchedMenuList(HttpServletRequest request,
                                      Model model,
                                      @RequestParam(name = "search")String search) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return "redirect:/page/user/login";
        }



        Long storeId = (Long) session.getAttribute("storeId");

        List<Menu> searchedMenu = menuService.findSearchedMenu(storeId, search);


        model.addAttribute("menu_list", searchedMenu);

        return "promotion/fragments/menuModal :: itemList";
    }

}
