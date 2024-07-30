package com._thefull.dasom_web_demo.global.exception;

import lombok.AllArgsConstructor;
import lombok.Getter;
import org.springframework.http.HttpStatus;

@Getter @AllArgsConstructor
public enum ErrorCode {
    INVALID_STATE(HttpStatus.NOT_FOUND),
    NO_CATEGORY(HttpStatus.NOT_FOUND),
    NOT_FOUND_MENU(HttpStatus.NOT_FOUND),
    NOT_FOUNT_MENU_PROMOTION(HttpStatus.NOT_FOUND),
    NO_ROBOT_IN_STORE(HttpStatus.NOT_FOUND),
    NOT_FOUND_STORE(HttpStatus.NOT_FOUND);


    private HttpStatus httpStatus;
}
