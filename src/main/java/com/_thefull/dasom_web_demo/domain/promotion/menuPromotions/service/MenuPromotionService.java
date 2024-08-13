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
import org.springframework.cglib.core.Local;
import org.springframework.stereotype.Service;

import java.sql.Time;
import java.time.Duration;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
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
                int freq= calculateFreq(mp.getMentInterval(), mp.getMentEndTime(), mp.getMentStartTime());
                MenuPromotionResponseDTO e = MenuPromotionResponseDTO.from(mp, freq);
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

        Status status = decideStatus(dto.getEndDate(), dto.getStartDate());

        MenuPromotion newEntity = MenuPromotion.from(dto, menu, store, status);

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
                int freq = calculateFreq(mp.getMentInterval(), mp.getMentEndTime(), mp.getMentStartTime());
                MenuPromotionResponseDTO e = MenuPromotionResponseDTO.from(mp,freq);
                responseDTOList.add(e);
            }
        }
        return responseDTOList;
    }

    @Transactional
    public MenuPromotionResponseDTO findOneMenuPromotion(Long id) {

        MenuPromotion findPromotion = menuPromotionsRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUNT_MENU_PROMOTION, "해당 제품할인을 찾지 못했습니다"));

        int freq = calculateFreq(findPromotion.getMentInterval(), findPromotion.getMentEndTime(), findPromotion.getMentStartTime());
        return MenuPromotionResponseDTO.from(findPromotion,freq);

    }

    public void updatePromotionContent(MenuPromotionRequestDTO requestDTO) {
        MenuPromotion foundMenuPromotion = menuPromotionsRepository.findById(requestDTO.getMenuPromoId())
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUNT_MENU_PROMOTION, "메뉴 프로모션을 찾을 수 없습니다"));

        int freq = calculateFreq(requestDTO.getInterval(), requestDTO.getMentEndTime(), requestDTO.getMentStartTime());
        foundMenuPromotion.updateEntity(requestDTO,freq);

    }

    public void deleteMenuPromotion(Long id) {

        menuPromotionsRepository.deleteById(id);
    }

    @Transactional
    public void changeMenuPromotionStatus(Long id, String statusname) {

        MenuPromotion findPromotion = menuPromotionsRepository.findById(id)
                .orElseThrow(() -> new AppException(ErrorCode.NOT_FOUNT_MENU_PROMOTION, "해당 제품할인을 찾지 못했습니다"));

        Status status = Status.fromStateType(statusname);

        findPromotion.updateStatus(status);

        MenuPromotion save = menuPromotionsRepository.save(findPromotion);
        System.out.println(save.getStatus().getStateType());

    }

    private int calculateFreq(int interval, LocalTime mentEndTime, LocalTime mentStartTime){
        Duration duration;
        Long minutes = Duration.between(mentStartTime,mentEndTime).toMinutes();
        return (int)(minutes/interval);
    }

    private Status decideStatus(LocalDate endDate, LocalDate startDate){
        LocalDate now = LocalDate.now();
        if (now.isAfter(endDate)) return Status.COMPLETED;
        else if(now.isBefore(startDate)) return Status.SCHEDULED;
        else return Status.IN_PROGRESS;
    }
}
