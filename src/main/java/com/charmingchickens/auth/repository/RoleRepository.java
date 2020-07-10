package com.charmingchickens.auth.repository;

import com.charmingchickens.auth.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
