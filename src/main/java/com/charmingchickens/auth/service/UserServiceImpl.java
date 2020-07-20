package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Company;
import com.charmingchickens.auth.model.Post;
import com.charmingchickens.auth.model.User;
import com.charmingchickens.auth.repository.CompanyRepository;
import com.charmingchickens.auth.repository.PostRepository;
import com.charmingchickens.auth.repository.RoleRepository;
import com.charmingchickens.auth.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private CompanyRepository companyRepository;
    @Autowired
    private PostRepository postRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public void save(User user) {
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        user.setName(user.getName());
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
    public void saveJoin(User user) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User existingUser = findByUsername(name);
        existingUser.setSearch(user.getSearch());

        existingUser.setSearchType(user.getSearchType());
        existingUser.setLocation(user.getLocation());
        userRepository.save(existingUser);
    }

//    public void saveWorker(String name) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String n = auth.getName();
//        User existingUser = findByUsername(n);
//        Company existingCompany = companyRepository.findByBusinessName(name);
//        existingCompany.getWorker().add(existingUser);
//        userRepository.save(existingUser);
//    }

    public Map<Long,String> findUsers(String name) {
        List<User> results = userRepository.findAll();
        Map<Long, String> matches = new HashMap<>();
        for (User u: results) {
            if (u.getName() != null && u.getName().toLowerCase().contains(name.toLowerCase())) {
                matches.put(u.getId(), u.getName());
            }
        }
        return matches;
    }

    public Map<Long,String> findCompanies(String name) {
        List<Company> results = companyRepository.findAll();
        Map<Long, String> matches = new HashMap<>();
        for (Company u: results) {
            if (u.getBusinessName() != null && u.getBusinessName().toLowerCase().contains(name.toLowerCase())) {
                matches.put(u.getId(), u.getBusinessName());
            }
        }
        return matches;
    }

    public Map<Long,String> findCompaniesByCreator(User user) {
        List<Company> results = companyRepository.findAll();
        Map<Long, String> matches = new HashMap<>();
        String userName = user.getUsername();
        for (Company u: results) {
            String userName2 = u.getCreator().getUsername();
            if (userName2.equals(userName)) {
                matches.put(u.getId(), u.getBusinessName());
            }
        }
        return matches;
    }

//    public Map<Long,String> findCompaniesByWorker(User user) {
//        List<User> results = userRepository.findAll();
//        Map<Long, String> matches = new HashMap<>();
//        String userName = user.getUsername();
//        for (User u: results) {
//            String userName2 = u.getCreator().getUsername();
//            if (userName2.equals(userName)) {
//                matches.put(u.getId(), u.getBusinessName());
//            }
//        }
//        return matches;
//    }

    public Map<Long,String> findPostsByCreator(User user) {
        List<Post> results = postRepository.findAll();
        Map<Long, String> matches = new HashMap<>();
        String userName = user.getUsername();
        for (Post u: results) {
            String userName2 = u.getCreator().getUsername();
            if (userName2.equals(userName)) {
                matches.put(u.getId(), u.getMessage());
            }
        }
        return matches;
    }

    @Override
    public void setPost(User user) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User existingUser = findByUsername(name);
        existingUser.setPost(user.getPost());
        userRepository.save(existingUser);
    }

//    public void saveCompany(String associatedCompany) {
//
//    }

    @Override
    public User findByUsername(String username) {
        return userRepository.findByUsername(username);
    }
}
