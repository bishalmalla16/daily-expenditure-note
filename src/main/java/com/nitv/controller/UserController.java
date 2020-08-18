package com.nitv.controller;

import com.nitv.model.CrmUser;
import com.nitv.model.User;
import com.nitv.service.RoleService;
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
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;

@Controller
public class UserController {
    Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private RoleService roleService;

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

    @GetMapping("/view-user")
    public String viewUser(@RequestParam(defaultValue = "") String username, Model model){
        User user = userService.getUserByUsername(username);
        Subject subject = SecurityUtils.getSubject();
        String currentUsername = subject.getPrincipal().toString();
        User currentUser = userService.getUserByUsername(currentUsername);
        if(user != null && (username.equals(currentUsername) || currentUser.hasRole("admin"))){
            model.addAttribute("user", user);
            model.addAttribute("subject", subject);
            return "user_details";
        }
        return "redirect:/home";
    }

    @GetMapping("/edit-user")
    public String updateUser(@RequestParam(defaultValue = "") String username, Model model){
        User user = userService.getUserByUsername(username);
        Subject subject = SecurityUtils.getSubject();
        String currentUsername = subject.getPrincipal().toString();
        User currentUser = userService.getUserByUsername(currentUsername);
        if(user != null && (username.equals(currentUsername) || currentUser.hasRole("admin"))){
            model.addAttribute("user", user);
            model.addAttribute("currentUser", currentUser);
            model.addAttribute("roleList", roleService.getRoles());
            return "edit_user";
        }
        return "redirect:/home";
    }

    @GetMapping("/delete-user")
    public String deleteUser(@RequestParam(defaultValue = "") String username){
        User user = userService.getUserByUsername(username);
        if(user != null && !SecurityUtils.getSubject().getPrincipal().toString().equals(username)){
            userService.deleteUser(user.getId());
        }
        return "redirect:/users";
    }

    @PostMapping("/edit-user")
    public String updateUser(@ModelAttribute @Valid User user, BindingResult bindingResult, Model model){
        Subject subject = SecurityUtils.getSubject();
        User currentUser = userService.getUserByUsername(subject.getPrincipal().toString());
        boolean hasAdminRole = currentUser.hasRole("admin");

        if(userService.getUserByUsername(user.getUsername()) != null && userService.getUserByUsername(user.getUsername()).getId() != user.getId()){
            model.addAttribute("registrationError", "Username already exists.");
            model.addAttribute("currentUser", currentUser);
            return "edit_user";
        }

        userService.updateUser(user);

        currentUser = userService.getUserByUsername(subject.getPrincipal().toString());

        if(currentUser == null){
            subject.logout();
            return "redirect:/login";
        } else {
            if (hasAdminRole) {
                if (user.getId() == currentUser.getId()) {
                    if (user.hasRole("admin"))
                        return "redirect:/users";
                    else {
                        subject.logout();
                        return "redirect:/login";
                    }
                } else {
                    return "redirect:/users";
                }
            } else {
                return "redirect:/home";
            }
        }

    }
}
