package com.charmingchickens.auth.model;

import javax.persistence.*;
import java.net.URL;
import java.util.Set;

@Entity
@Table(name = "user")
public class User {
    private Long id;
    private String username;
    private String password;
    private String passwordConfirm;
    private Set<Role> roles;
    private String message;
    private String name;
    private String about;
    private byte[] profilePic;
    private String email;
    private String from1;
    private String from2;
    private String to1;
    private String to2;
    private String recurring;
    private String search;
    private String searchType;
    private Long user;
    private String location;
    private String post;
    private Set<User> connections;
    private Long view;
    private Long curCompany;


    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    @ManyToMany
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    @ManyToMany(fetch=FetchType.EAGER)
    @JoinTable(name = "user_connections", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "connection_id"))
    public Set<User> getConnections() {
        return connections;
    }

    public void setConnections(Set<User> connections) {
        this.connections = connections;
    }

    public String getMessage() { return message; }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getName() { return name; }

    public void setName(String name) {
        this.name = name;
    }

    public String getAbout() { return about; }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getEmail() { return email; }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFrom1() { return from1; }

    public void setFrom1(String from) {
        this.from1 = from;
    }

    public String getFrom2() { return from2; }

    public void setFrom2(String from) {
        this.from2 = from;
    }

    public String getTo1() { return to1; }

    public void setTo1(String to) {
        this.to1 = to;
    }

    public String getTo2() { return to2; }

    public void setTo2(String to) {
        this.to2 = to;
    }

    public String getRecurring() { return recurring; }

    public void setRecurring(String recurring) {
        this.recurring = recurring;
    }

    public String getSearch() { return search; }

    public void setSearch(String search) {
        this.search = search;
    }

    public String getSearchType() { return searchType; }

    public void setSearchType(String searchType) {
        this.searchType = searchType;
    }

    public String getLocation() { return location; }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPost() { return post; }

    public void setPost(String post) {
        this.post = post;
    }

    public byte[] getProfilePic() { return profilePic; }

    public void setProfilePic(byte[] profilePic) {
        this.profilePic = profilePic;
    }

    public Long getUser() { return user; }

    public void setUser(Long user) {
        this.user = user;
    }

    public Long getView() { return view; }

    public void setView(Long view) {
        this.view = view;
    }

    public Long getCurCompany() { return curCompany; }

    public void setCurCompany(Long curCompany) {
        this.curCompany = curCompany;
    }
//
//    @ManyToMany
//    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
//    public Set<User> getConnections() { return connections; }
//
//    public void setConnections(Set<User> connections) {
//        this.connections = connections;
//    }

//    @ManyToOne
//    public Company getCompany() { return company; }
//
//    public void setCompany(Company company) {
//        this.company = company;
//    }

//    public Image getProfilePic() { return profilePic; }
//
//    public void setProfilePic(Image profilePic) {
//        this.profilePic = profilePic;
//    }
}
