package com.charmingchickens.auth.repository;

import com.charmingchickens.auth.model.Company;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CompanyRepository extends JpaRepository<Company, Long> {
    Company findByBusinessName(String name);
}
