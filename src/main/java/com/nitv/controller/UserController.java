package com.nitv.controller;

import com.nitv.model.CrmUser;
import com.nitv.model.User;
import com.nitv.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class UserController {
    Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @GetMapping("/register")
    public String addUser(Model model){
        if(SecurityUtils.getSubject().getPrincipal() == null) {
            model.addAttribute("crmUser", new CrmUser());
            return "registration";
        }
        return "redirect:/";
    }

    @PostMapping("/registration")
    public String addUser(@ModelAttribute @Valid CrmUser crmUser, BindingResult bindingResult, Model model){
        User user = new User();
        user.setFirstName(crmUser.getFirstName());
        user.setLastName(crmUser.getLastName());
        user.setEmail(crmUser.getEmail());
        user.setUsername(crmUser.getUsername());
        user.setPassword(crmUser.getPassword());

        if(userService.getUserByUsername(user.getUsername()) != null){
            model.addAttribute("registrationError", "Username already exists.");
            return "registration";
        }
        if(bindingResult.hasErrors()){
            model.addAttribute("registrationError", "Password Mismatch.");
            return "registration";
        }
        userService.addUser(user);
        return "redirect:/home";
    }
}
