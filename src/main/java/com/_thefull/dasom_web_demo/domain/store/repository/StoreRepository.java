package com._thefull.dasom_web_demo.domain.store.repository;

import com._thefull.dasom_web_demo.domain.store.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StoreRepository extends JpaRepository<Store, Long> {
}
