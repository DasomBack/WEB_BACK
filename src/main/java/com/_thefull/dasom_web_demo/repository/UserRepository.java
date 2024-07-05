package com._thefull.dasom_web_demo.repository;

import com._thefull.dasom_web_demo.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
