package com.charmingchickens.auth.repository;

import com.charmingchickens.auth.model.Company;
import com.charmingchickens.auth.model.Post;
import com.charmingchickens.auth.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Map;

public interface PostRepository extends JpaRepository<Post, Long> {
    Map<Long, String> findByCreator(String name);
}
