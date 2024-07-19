package com._thefull.dasom_web_demo.domain.menu.repository;

import com._thefull.dasom_web_demo.domain.menu.domain.Menu;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface MenuRepository extends JpaRepository<Menu, Long> {

    Optional<Menu> findByName(String name);
}
