package com._thefull.dasom_web_demo.service;

import com._thefull.dasom_web_demo.domain.User;
import com._thefull.dasom_web_demo.domain.dto.UserJoinRequestDto;
import com._thefull.dasom_web_demo.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class UserRegisterService {

    private final UserRepository userRepository;

    public void registerUser(UserJoinRequestDto dto){
        User newUser = dto.toEntity();
        userRepository.save(newUser);

    }

}
