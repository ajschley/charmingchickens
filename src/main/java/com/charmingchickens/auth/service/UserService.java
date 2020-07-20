package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    void save(User user);

    void saveProfile(User user);

    void saveDiscover(User user);

    void saveJoin(User user);

    Map<Long, String > findUsers(String name);

    Map<Long, String > findCompanies(String name);

    void savePost(User user);

//    void saveCompany(String associatedCompany);

    User findByUsername(String username);
}
