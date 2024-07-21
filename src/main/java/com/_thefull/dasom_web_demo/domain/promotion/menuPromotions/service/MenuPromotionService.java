package com._thefull.dasom_web_demo.domain.promotion.menuPromotions.service;

import com._thefull.dasom_web_demo.domain.menu.domain.Menu;
import com._thefull.dasom_web_demo.domain.menu.repository.MenuRepository;
import com._thefull.dasom_web_demo.domain.promotion.Status;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.MenuPromotion;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionRequestDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.domain.dto.MenuPromotionResponseDTO;
import com._thefull.dasom_web_demo.domain.promotion.menuPromotions.repository.MenuPromotionsRepository;
import com._thefull.dasom_web_demo.domain.store.domain.Store;
import com._thefull.dasom_web_demo.domain.store.repository.StoreRepository;
import com._thefull.dasom_web_demo.global.exception.AppException;
import com._thefull.dasom_web_demo.global.exception.ErrorCode;
import jakarta.persistence.PrePersist;
import jakarta.transaction.Transactional;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.time.Duration;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class MenuPromotionService {

    private final MenuPromotionsRepository menuPromotionsRepository;
    private final StoreRepository storeRepository;
    private final MenuRepository menuRepository;

    @Transactional
    public List<MenuPromotionResponseDTO> findAllPromotionList(Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_STORE, "매장을 찾을 수 없습니다"));

        List<MenuPromotionResponseDTO> responseDTOList = new ArrayList<>();
        List<MenuPromotion> findPromoList = menuPromotionsRepository.findByStore(store);
        for (MenuPromotion mp : findPromoList){
            if (mp.getStatus()!= Status.COMPLETED) {
                MenuPromotionResponseDTO e = MenuPromotionResponseDTO.from(mp);
                responseDTOList.add(e);
            }
        }
        return responseDTOList;
    }

    @Transactional
    public void registerMenuPromotion(Long storeId, MenuPromotionRequestDTO dto) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_STORE, "매장을 찾을 수 없습니다"));
        Menu menu = menuRepository.findByName(dto.getMenu())
                .orElseThrow(()-> new AppException(ErrorCode.NOT_FOUND_MENU, "메뉴를 찾을 수 없습니다"));
        int freq = calculateFreq(dto.getInterval(), dto.getMentEndTime(), dto.getMentStartTime());
        MenuPromotion newEntity = MenuPromotion.from(dto, menu, freq);
        menuPromotionsRepository.save(newEntity);

    }

    @Transactional
    public List<MenuPromotionResponseDTO> findCompletedPromotionList(Long storeId) {
        Store store = storeRepository.findById(storeId)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUND_STORE, "매장을 찾을 수 없습니다"));

        List<MenuPromotionResponseDTO> responseDTOList = new ArrayList<>();
        List<MenuPromotion> findPromoList = menuPromotionsRepository.findByStore(store);
        for (MenuPromotion mp : findPromoList){
            if (mp.getStatus() == Status.COMPLETED) {
                MenuPromotionResponseDTO e = MenuPromotionResponseDTO.from(mp);
                responseDTOList.add(e);
            }
        }
        return responseDTOList;
    }

    private int calculateFreq(int interval, Time mentEndTime, Time mentStartTime){
        Duration duration;
        Long minutes = Duration.between(mentEndTime.toLocalTime(),mentStartTime.toLocalTime()).toMinutes();
        return (int)(minutes/interval);
    }

}
