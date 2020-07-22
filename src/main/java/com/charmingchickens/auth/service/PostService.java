package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Post;
import com.charmingchickens.auth.model.User;

import java.util.Map;

public interface PostService {
    void save(Post post);

    Map<Long, String> findByCreator(User user);
}
