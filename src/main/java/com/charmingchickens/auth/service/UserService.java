package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.User;

public interface UserService {
    void save(User user);

    void saveProfile(User user);

    void saveDiscover(User user);

    User findByUsername(String username);
}
