package com.charmingchickens.auth.repository;

import com.charmingchickens.auth.model.Post;
import com.charmingchickens.auth.model.Rating;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Map;

public interface RatingRepository extends JpaRepository<Rating, Long> {
    Map<Long, String> findByUser(String name);
}
