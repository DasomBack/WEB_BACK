package com._thefull.dasom_web_demo.domain.user.domain.dto;

import com._thefull.dasom_web_demo.domain.user.domain.User;
import jakarta.validation.constraints.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
@AllArgsConstructor
public class UserJoinRequestDto {

    /*private String store;*/

    private String name;

    @Email
    private String email;

    private String phoneNum;

    @Size(min = 6)
    private String password;

    public User toEntity(){
        return User.builder()
                .email(this.email)
                .name(this.name)
                .phoneNum(this.phoneNum)
                .password(this.password)
                .build();
    }

}
