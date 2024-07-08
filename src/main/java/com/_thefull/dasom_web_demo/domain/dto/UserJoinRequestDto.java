package com._thefull.dasom_web_demo.domain.dto;

import com._thefull.dasom_web_demo.domain.User;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserJoinRequestDto {

    private String store;

    private String name;

    @Email
    private String email;

    private String phoneNum;

    private String password;

    public User toEntity(){
        return User.builder()
                .store(this.store)
                .email(this.email)
                .name(this.name)
                .phoneNum(this.phoneNum)
                .password(this.password)
                .build();
    }

}
