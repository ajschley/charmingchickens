package com.charmingchickens.auth.model;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "rating")
public class Rating {
    private Long id;
    private Set<Role> roles;
    private String num;
    private User user;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToMany
    @JoinTable(name = "rating_role", joinColumns = @JoinColumn(name = "rating_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getNum() {
        return num;
    }

    public void setNum(String num) {
        this.num = num;
    }

    @ManyToOne
    public User getUser() { return user; }

    public void setUser(User user) { this.user = user; }
}
