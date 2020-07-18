package com.charmingchickens.auth.service;

import com.charmingchickens.auth.model.Company;
import com.charmingchickens.auth.model.User;
import com.charmingchickens.auth.repository.CompanyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService {
    @Autowired
    private CompanyRepository companyRepository;
    @Override
    public void save(Company company) {
        Company newCompany = new Company();

        newCompany.setBusinessName(company.getBusinessName());

        newCompany.setBusinessType(company.getBusinessType());
        newCompany.setLocation(company.getLocation());

        companyRepository.save(newCompany);
    }

    @Override
    public Company findByName(String name) {
        return companyRepository.findByBusinessName(name);
    }

}
