package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.service;

import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.MenuPromotion;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionRequestDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionResponseDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.repository.MenuPromotionsRepository;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import com._thefull.dasom_web_demo.domain.store.repository.StoreRepository;
import com._thefull.dasom_web_demo.global.exception.AppException;
import com._thefull.dasom_web_demo.global.exception.ErrorCode;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MenuPromotionService {

    private final MenuPromotionsRepository menuPromotionsRepository;
    private final StoreRepository storeRepository;

    public List<MenuPromotionResponseDTO> findAllPromotionList(Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_STORE, "매장을 찾을 수 없습니다"));
        List<MenuPromotionResponseDTO> responseDTOList = new ArrayList<>();
        List<MenuPromotion> findPromoList = menuPromotionsRepository.findByStore(store);
        for (MenuPromotion mp : findPromoList){
            MenuPromotionResponseDTO e = MenuPromotionResponseDTO.from(mp);
            responseDTOList.add(e);
        }
        return responseDTOList;
    }

    public void registerMenuPromotion(Long storeId, MenuPromotionRequestDTO dto) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_STORE, "매장을 찾을 수 없습니다"));


    }
}
