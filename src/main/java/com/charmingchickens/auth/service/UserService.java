package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    void save(User user);

    void saveProfile(User user);

    void saveDiscover(User user);

    Map<Long, String > findUsers(String name);

//    void saveCompany(String associatedCompany);

    User findByUsername(String username);
}
