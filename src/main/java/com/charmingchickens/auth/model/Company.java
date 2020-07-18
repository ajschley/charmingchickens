package com.charmingchickens.auth.model;

import javax.persistence.*;
import java.awt.*;
import java.util.Set;

@Entity
@Table(name = "company")
public class Company {
    private Long id;
    private Set<Role> roles;
    private String businessName;
    private String businessType;
    private String location;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToMany
    @JoinTable(name = "company_role", joinColumns = @JoinColumn(name = "company_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getBusinessName() {
        return businessName;
    }

    public void setBusinessName(String businessName) {
        this.businessName = businessName;
    }

    public String getBusinessType() {
        return businessType;
    }

    public void setBusinessType(String businessType) {
        this.businessType = businessType;
    }

    public String getLocation() { return location; }

    public void setLocation(String location) {
        this.location = location;
    }
}