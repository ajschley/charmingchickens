package com.charmingchickens.auth.web;

import com.charmingchickens.auth.model.Company;
import com.charmingchickens.auth.service.CompanyService;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserService userService;

    @Autowired
    private CompanyService companyService;

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
        model.addAttribute("profileForm",userService.findByUsername(name));
        return "profile";
    }

    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String profile(@ModelAttribute("profileForm") User profileForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "profile";
        }
        userService.save(profileForm);
        return "redirect:/welcome";
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
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        String name = auth.getName(); //get logged in username
        model.addAttribute("createCompanyForm",userService.findByUsername(name));
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

    @RequestMapping(value = "/post", method = RequestMethod.POST)
    public String post(@ModelAttribute("postForm") User postForm, BindingResult bindingResult, Model model) {
        if (bindingResult.hasErrors()) {
            return "profile";
        }
        userService.save(postForm);
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
        if (discoverForm.getSearchType().equals("user")) {
            model.addAttribute("results", userService.findUsers(discoverForm.getSearch()));
//            userService.findUsers(discoverForm.getSearch());
        }
        userService.saveDiscover(discoverForm);
        return "redirect:/discover";
    }

    @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    }
}
