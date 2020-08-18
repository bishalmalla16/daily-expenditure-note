package com.nitv.controller;

import com.nitv.model.Role;
import com.nitv.service.RoleService;
import com.nitv.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class AdminController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private UserService userService;

    @GetMapping("/roles")
    public String addRole(Model model){
        model.addAttribute("subject", SecurityUtils.getSubject());
        model.addAttribute("role", new Role());
        return "add_role";
    }

    @PostMapping("/register-role")
    public String addRole(@ModelAttribute @Valid Role role, Model model, BindingResult bindingResult){
        if(bindingResult.hasErrors())
            return "add_role";
        roleService.addRole(role);
        return "redirect:/admin";
    }

    @GetMapping("/users")
    public String getUsers(Model model){
        model.addAttribute("subject", SecurityUtils.getSubject());
        model.addAttribute("users", userService.getAllUsers());
        return "user_list";
    }

}
