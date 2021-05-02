package com.atm.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.atm.entities.News;

@Repository
public interface NewsRepository extends JpaRepository<News, Integer> {
}
