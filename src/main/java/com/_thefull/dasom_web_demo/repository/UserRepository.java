package com._thefull.dasom_web_demo.repository;

import com._thefull.dasom_web_demo.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByStoreAndPhoneNum(String store, String phoneNum);
}
