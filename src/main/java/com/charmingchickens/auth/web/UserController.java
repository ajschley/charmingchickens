package com.charmingchickens.auth.web;

import com.charmingchickens.auth.model.Company;
import com.charmingchickens.auth.model.Post;
import com.charmingchickens.auth.service.CompanyService;
import com.charmingchickens.auth.service.PostService;
import com.charmingchickens.auth.service.SecurityService;
import com.charmingchickens.auth.service.UserService;
import com.charmingchickens.auth.validator.UserValidator;
import com.charmingchickens.auth.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

    @Autowired
    private PostService postService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/welcome";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        model.addAttribute("profileForm",userService.findByUsername(name));
        Map<Long, String> results = new HashMap<>();
        results.putAll(userService.findCompaniesByCreator(existingUser));
        results.putAll(userService.findCompaniesByEmployee(existingUser));
        model.addAttribute("results2",results);
        model.addAttribute("results3",postService.findByCreator(existingUser));
        return "profile";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String profile(@ModelAttribute("profileForm") User profileForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "profile";
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        Post newPost = new Post();
        newPost.setCreator(existingUser);
        newPost.setMessage(profileForm.getPost());
        postService.save(newPost);
        Map<Long, String> results = new HashMap<>();
        results.putAll(userService.findCompaniesByCreator(existingUser));
        results.putAll(userService.findCompaniesByEmployee(existingUser));
        model.addAttribute("results2",results);
        model.addAttribute("results3",postService.findByCreator(existingUser));
        userService.setPost(profileForm);
        userService.saveProfilePic(profileForm);
        return "redirect:/profile";
    }

    @RequestMapping(value = "/view/{user_id}", method = RequestMethod.POST)
    public String view(@PathVariable Long user_id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        User u = userService.findById(user_id);
        existingUser.setView(u.getId());
        userService.update(existingUser);
        return "redirect:/viewProfile";
    }

    @RequestMapping(value = "/viewProfile", method = RequestMethod.GET)
    public String viewProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        Long u_id = userService.findByUsername(name).getView();
        Map<Long, String> results = new HashMap<>();
        results.putAll(userService.findCompaniesByCreator(userService.findById(u_id)));
        results.putAll(userService.findCompaniesByEmployee(userService.findById(u_id)));
        model.addAttribute("results2",results);
        model.addAttribute("results3",postService.findByCreator(userService.findById(u_id)));
        model.addAttribute("viewProfileForm", userService.findById(u_id));
        return "viewProfile";
    }

    @RequestMapping(value = "/viewCo/{company_id}", method = RequestMethod.POST)
    public String viewCo(@PathVariable Long company_id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        existingUser.setCurCompany(company_id);
        userService.update(existingUser);
        return "redirect:/viewCompany";
    }

    @RequestMapping(value = "/viewCompany", method = RequestMethod.GET)
    public String viewCompany(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        Long c_id = existingUser.getCurCompany();
        Company c = companyService.findById(c_id);
        Map<Long, String> results = new HashMap<>();
        results.put(c.getCreator().getId(), c.getCreator().getName());
        for (User u: c.getEmployees()) {
            results.put(u.getId(), u.getName());
        }
        model.addAttribute("results2",results);
        model.addAttribute("viewCompanyForm", companyService.findById(existingUser.getCurCompany()));
        return "viewCompany";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.GET)
    public String editProfile(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        model.addAttribute("editForm",userService.findByUsername(name));
        return "editProfile";
    }

    @RequestMapping(value = "/editProfile", method = RequestMethod.POST)
    public String editProfile(@ModelAttribute("editForm") User editForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "editProfile";
        }
        userService.saveProfile(editForm);
        return "redirect:/profile";
    }

    @RequestMapping(value = "/createCompany", method = RequestMethod.GET)
    public String createCompany(Model model) {
        model.addAttribute("createCompanyForm", new Company());
        return "createCompany";
    }

    @RequestMapping(value = "/createCompany", method = RequestMethod.POST)
    public String createCompany(@ModelAttribute("createCompanyForm") Company createCompanyForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "createCompany";
        }
        companyService.save(createCompanyForm);
        return "redirect:/profile";
    }

    @RequestMapping(value = "/joinCo/{company_id}", method = RequestMethod.POST)
    public String joinCo(@PathVariable Long company_id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username

        User existingUser = userService.findByUsername(name);
        Company c = companyService.findById(company_id);

        Set<User> emps = c.getEmployees();
        emps.add(existingUser);
        c.setEmployees(emps);
        companyService.update(c);

        return "redirect:/profile";
    }

    @RequestMapping(value = "/joinCompany", method = RequestMethod.GET)
    public String joinCompany(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        model.addAttribute("joinCompanyForm",userService.findByUsername(name));
        return "joinCompany";
    }

    @RequestMapping(value = "/joinCompany", method = RequestMethod.POST)
    public String joinCompany(@ModelAttribute("joinCompanyForm") User joinCompanyForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "joinCompany";
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        model.addAttribute("discoverForm",userService.findByUsername(name));
        model.addAttribute("results", userService.findCompanies(joinCompanyForm.getSearch()));
        userService.saveJoin(joinCompanyForm);
        return "joinCompany";
    }

    @RequestMapping(value = "/connect/{user_id}", method = RequestMethod.POST)
    public String connect(@PathVariable Long user_id) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username

        User u = userService.findById(user_id);
        User u1 = userService.findByUsername(name);


        Set<User> con = u1.getConnections();
        con.add(u);
        u1.setConnections(con);
        userService.update(u1);

        return "redirect:/connections";
    }


    @RequestMapping(value = "/connections", method = RequestMethod.GET)
    public String connections(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);

        model.addAttribute("connectionsForm",userService.findByUsername(name));
        model.addAttribute("results", userService.findConnectionsByUser(existingUser));

        return "connections";
    }

    @RequestMapping(value = "/connections", method = RequestMethod.POST)
    public String connections(@ModelAttribute("connectionsForm") User connectionsForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "connections";
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        model.addAttribute("connectionsForm",userService.findByUsername(name));
        model.addAttribute("results", userService.findConnectionsByUser(existingUser));
        userService.saveConnection(connectionsForm);
        return "discover";
    }

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String post(@ModelAttribute("postForm") Post postForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "post";
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        model.addAttribute("results", postService.findByCreator(existingUser));
        postService.save(postForm);
        return "redirect:/profile";
    }

    @RequestMapping(value = "/discover", method = RequestMethod.GET)
    public String discover(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        model.addAttribute("discoverForm",userService.findByUsername(name));
        return "discover";
    }

    @RequestMapping(value = "/discover", method = RequestMethod.POST)
    public String discover(@ModelAttribute("discoverForm") User discoverForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "discover";
        }
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        User existingUser = userService.findByUsername(name);
        existingUser.setSearch(discoverForm.getSearch());
        existingUser.setSearchType(discoverForm.getSearchType());
        model.addAttribute("discoverForm",existingUser);
        if (discoverForm.getSearchType().equals("user")) {
            model.addAttribute("results", userService.findUsers(discoverForm.getSearch()));
//            userService.findUsers(discoverForm.getSearch());
        } else {
            model.addAttribute("results", userService.findCompanies(discoverForm.getSearch()));
        }
//        userService.saveDiscover(discoverForm);
        userService.saveDiscover(discoverForm);
        return "discover";
    }

    @RequestMapping(value = "/news", method = RequestMethod.GET)
    public String news(Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        model.addAttribute("newsForm",userService.findByUsername(name));
        return "news";
    }

    @RequestMapping(value = "/news", method = RequestMethod.POST)
    public String news(@ModelAttribute("profileForm") User newsForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "news";
        }
        userService.save(newsForm);
        return "redirect:/news";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
}