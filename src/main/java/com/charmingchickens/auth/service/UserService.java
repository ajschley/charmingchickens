package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    void save(User user);

    void saveProfile(User user);

    void saveDiscover(User user);

    void saveJoin(User user);

//    void saveWorker(String name);

//    void saveConnections(User user);
//
//    Map<Long,String> findConnections(User user);

    Map<Long, String > findUsers(String name);

    Map<Long, String > findCompanies(String name);

    Map<Long,String> findCompaniesByCreator(User user);

//    Map<Long,String> findCompaniesByWorker(User user);

    Map<Long,String> findPostsByCreator(User user);

    void setPost(User user);

//    List getCompanies(String associatedCompany);

    User findByUsername(String username);
}
