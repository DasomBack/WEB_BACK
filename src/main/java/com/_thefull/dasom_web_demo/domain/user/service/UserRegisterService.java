package com._thefull.dasom_web_demo.domain.user.service;

import com._thefull.dasom_web_demo.domain.user.repository.UserRepository;
import com._thefull.dasom_web_demo.domain.user.domain.User;
import com._thefull.dasom_web_demo.domain.user.domain.dto.UserJoinRequestDto;
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
