package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
