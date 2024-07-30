package com._thefull.dasom_web_demo.domain.user.domain.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Data
public class LoginRequestDto {

    private String phoneNum;
    private String password;

}
