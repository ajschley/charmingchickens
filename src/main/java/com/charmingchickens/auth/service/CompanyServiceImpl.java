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

    @Autowired
    private UserService userService;
    @Override
    public void save(Company company) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName();
        User existingUser = userService.findByUsername(name);
        Company newCompany = new Company();

        newCompany.setBusinessName(company.getBusinessName());

        newCompany.setBusinessType(company.getBusinessType());
        newCompany.setLocation(company.getLocation());
        newCompany.setCreator(existingUser);

        companyRepository.save(newCompany);
    }

    public void update(Company company) {
        companyRepository.save(company);
    }



    @Override
    public Company findByBusinessName(String name) {
        return companyRepository.findByBusinessName(name);
    }
    public Company findById(Long id) {
        return companyRepository.findById(id);
    }
}
