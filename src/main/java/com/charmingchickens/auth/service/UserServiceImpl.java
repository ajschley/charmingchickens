package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.User;
import com.charmingchickens.auth.repository.RoleRepository;
import com.charmingchickens.auth.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    @Override
    public void saveProfile(User user) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User existingUser = findByUsername(name);

        existingUser.setName(user.getName());

        existingUser.setAbout(user.getAbout());
        existingUser.setEmail(user.getEmail());
        existingUser.setFrom1(user.getFrom1());
        existingUser.setFrom2(user.getFrom2());
        existingUser.setTo1(user.getTo1());
        existingUser.setTo2(user.getTo2());
        existingUser.setRecurring(user.getRecurring());

        userRepository.save(existingUser);
    }

    @Override
    public void saveDiscover(User user) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User existingUser = findByUsername(name);

        existingUser.setSearch(user.getSearch());

        existingUser.setSearchType(user.getSearchType());
        userRepository.save(existingUser);
    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
