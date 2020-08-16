package com.nitv.controller;

import com.nitv.model.Expenditure;
import com.nitv.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Controller
public class HomeController {
    Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String homePage(Model model){
        model.addAttribute("subject", SecurityUtils.getSubject());
        return "index";
    }

    @RequestMapping("/home")
    public String randomPage(@RequestParam(defaultValue = "") String item, Model model){
        Subject subject = SecurityUtils.getSubject();
        String currentUsername = subject.getPrincipal().toString();
        model.addAttribute("subject", subject);
        model.addAttribute("currentUser", userService.getUserByUsername(currentUsername));
        model.addAttribute("expenditure", new Expenditure());
        model.addAttribute("priceError", "");
        return "home";
    }

    @RequestMapping("/login")
    public String loginPage(){
        if(SecurityUtils.getSubject().getPrincipal() == null)
            return "login";
        return "redirect:/";
    }

    @GetMapping("/401")
    public String accessDeniedPage(Model model){
        Map<String, Object> errorMap = new HashMap<>();
        errorMap.put("status", HttpStatus.UNAUTHORIZED.value());
        errorMap.put("message", "You are unauthorized to access the resource.");
        model.addAttribute("errorMap", errorMap);
        return "error";
    }
}
