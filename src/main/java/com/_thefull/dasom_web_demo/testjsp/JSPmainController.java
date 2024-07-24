package com._thefull.dasom_web_demo.testjsp;


import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionRequestDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionResponseDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.service.MenuPromotionService;
import lombok.*;
import org.eclipse.tags.shaded.org.apache.xpath.operations.Mod;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.Banner;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/api/promotion-discount")
@RequiredArgsConstructor
public class JSPmainController {

    private final MenuPromotionService menuPromotionService;

    @Value("${tmp.store_id}")
    private Long storeId;

    @GetMapping("/main")
    public String mainPage(Model model) {
        model.addAttribute("data", "Sample data for content section");

        List<MenuPromotionResponseDTO> allPromotionList = menuPromotionService.findAllPromotionList(storeId);
        model.addAttribute("all_promotion_list",allPromotionList);

        List<MenuPromotionResponseDTO> completedPromotionList = menuPromotionService.findCompletedPromotionList(storeId);
        model.addAttribute("completed_promotion_list",completedPromotionList);

        return "promotion/main";
    }

    @PostMapping("/register")
    public String registerMenuPromotion(@ModelAttribute MenuPromotionRequestDTO requestDTO){
        System.out.println("JSPmainController.registerMenuPromotion");
        System.out.println(requestDTO.getAddMenuDesc());
        menuPromotionService.registerMenuPromotion(storeId, requestDTO);

        return "redirect:/api/promotion-discount/main";
    }

    @GetMapping("/updatepage")
    public String loadUpdatePage(@RequestParam(name = "id") Long id, Model model){
        MenuPromotionResponseDTO dto = menuPromotionService.findOneMenuPromotion(id);
        model.addAttribute("thepromo",dto);

        return "promotion/fragments/contentupdate";
    }

    @ResponseStatus(HttpStatus.SEE_OTHER)
    @PutMapping("/updateContent")
    public String updatePromotionContent(@ModelAttribute MenuPromotionRequestDTO requestDTO){

        System.out.println("JSPmainController.updatePromotionContent");
//        menuPromotionService.updatePromotionContent(requestDTO);

        return "redirect:/api/promotion-discount/main";
    }

    @ResponseStatus(HttpStatus.SEE_OTHER)
    @DeleteMapping("/delete")
    public String deleteMenuPromotion(@RequestParam(name = "id")Long id){
        menuPromotionService.deleteMenuPromotion(id);

        return "redirect:/api/promotion-discount/main";

    }


    @GetMapping("/changestatus")
    public String changeMenuPromotionStatus(@RequestParam(name = "id") Long id,
                                            @RequestParam(name = "status")String status){
        System.out.println("JSPmainController.changeMenuPromotionStatus");
        menuPromotionService.changeMenuPromotionStatus(id, status);

        return "redirect:/api/promotion-discount/main";

    }

    @GetMapping("/header")
    public String header() {
        return "header"; // This refers to header.jsp
    }

    @GetMapping("/footer")
    public String footer() {
        return "footer"; // This refers to footer.jsp
    }
}
