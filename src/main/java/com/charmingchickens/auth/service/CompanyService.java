package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Company;

public interface CompanyService {
    void save(Company company);
    void update(Company company);

    Company findByBusinessName(String name);
    Company findById(Long id);

}
