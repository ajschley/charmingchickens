package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Post;

import java.util.Map;

public interface PostService {
    void save(Post post);

    Map<Long, String> findByCreator(String name);
}
