package com._thefull.dasom_web_demo.domain.dto;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class UserJoinRequestDto {

    @NotBlank
    private String store;

    @NotBlank
    private String name;

    @NotBlank
    private String phoneNum;

    @NotBlank
    private String password;

}
