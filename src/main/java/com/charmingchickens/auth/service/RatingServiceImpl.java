package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Post;
import com.charmingchickens.auth.model.Rating;
import com.charmingchickens.auth.model.User;
import com.charmingchickens.auth.repository.PostRepository;
import com.charmingchickens.auth.repository.RatingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.text.DecimalFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class RatingServiceImpl implements RatingService {
    @Autowired
    private RatingRepository ratingRepository;

    @Autowired
    private UserService userService;
    @Override
    public void save(Rating rating) {
//        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//        String name = auth.getName();
//        User existingUser = userService.findByUsername(name);
//        Rating newRating = new Rating();
//
//        newRating.setUser(user);
//        newRating.setNum(existingUser.getRating());

        ratingRepository.save(rating);
    }

    @Override
    public String findByUser(User user) {
        List<Rating> results = ratingRepository.findAll();
//        Collections.reverse(results);
//        Map<Long, Integer> matches = new HashMap<>();
        double result = 0;
        int numOfRatings = 0;
        String userName = user.getUsername();
        for (Rating r: results) {
            String userName2 = r.getUser().getUsername();
            if (userName2.equals(userName)) {
                double num = Double.parseDouble(r.getNum());
                result += num;
                numOfRatings ++;
            }
        }
        DecimalFormat df = new DecimalFormat("#.#");
        return df.format(result / numOfRatings);
//        return Double.toString(result / numOfRatings);
    }
}
