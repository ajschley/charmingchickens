package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Company;
import com.charmingchickens.auth.model.Post;
import com.charmingchickens.auth.model.User;
import com.charmingchickens.auth.repository.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostRepository postRepository;

    @Autowired
    private UserService userService;
    @Override
    public void save(Post post) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User existingUser = userService.findByUsername(name);
        Post newPost = new Post();

        newPost.setCreator(existingUser);
        newPost.setMessage(post.getMessage());

        postRepository.save(newPost);
    }

    @Override
    public Map<Long, String> findByCreator(User user) {
            List<Post> results = postRepository.findAll();
            Collections.reverse(results);
            Map<Long, String> matches = new HashMap<>();
            String userName = user.getUsername();
            long num=0;
            for (Post u: results) {
                String userName2 = u.getCreator().getUsername();
                if (userName2.equals(userName)) {
                    u.setId(num);
                    num++;
                    matches.put(u.getId(), u.getMessage());
                }
            }
            return matches;
        }
}
