package com.charmingchickens.auth.model;

import javax.persistence.*;
import java.awt.*;
import java.util.Set;

@Entity
@Table(name = "post")
public class Post {
    private Long id;
    private Set<Role> roles;
    private String message;
    private User creator;

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    @ManyToMany
    @JoinTable(name = "post_role", joinColumns = @JoinColumn(name = "post_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @ManyToOne
    public User getCreator() { return creator; }

    public void setCreator(User creator) { this.creator = creator; }
}
