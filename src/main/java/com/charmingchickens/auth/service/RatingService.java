package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Rating;
import com.charmingchickens.auth.model.User;

import java.util.Map;

public interface RatingService {
    void save(Rating rating);

    String findByUser(User user);
}
