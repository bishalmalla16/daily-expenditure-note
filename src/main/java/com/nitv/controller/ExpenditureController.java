package com.nitv.controller;

import com.nitv.model.Expenditure;
import com.nitv.model.User;
import com.nitv.service.ExpenditureService;
import com.nitv.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@Controller
public class ExpenditureController {
    Logger logger = LoggerFactory.getLogger(ExpenditureController.class);

    @Autowired
    private ExpenditureService expenditureService;

    @Autowired
    private UserService userService;

    @PostMapping("/expenditures")
    public String addExpenditure(@ModelAttribute("expenditure") @Valid Expenditure expenditure, BindingResult bindingResult, Model model){
        //to be checked
        if(bindingResult.hasErrors()) {
            model.addAttribute("priceError", "Price must be greater or equal to 1.");
            if(expenditureService.getExpenditureById(expenditure.getId()) == null)
                return "home";
            else
                return "edit_expenditure";
        }

        expenditureService.addExpenditure(expenditure);
        return "redirect:/home";
    }

    @GetMapping("/edit-expenditures")
    public String editExpenditure(@RequestParam(defaultValue = "0") long id, Model model){
        Expenditure expenditure = expenditureService.getExpenditureById(id);
        User currentUser = userService.getUserByUsername(SecurityUtils.getSubject().getPrincipal().toString());
        if(expenditure != null && expenditure.getUser().equals(currentUser)) {
            model.addAttribute("expenditure", expenditure);
            model.addAttribute("currentUser", currentUser);
            return "edit_expenditure";
        }
        return "redirect:/home";
    }

    @GetMapping("/delete-expenditures")
    public String deleteExpenditure(@RequestParam(defaultValue = "0") long id){
        Expenditure expenditure = expenditureService.getExpenditureById(id);
        User currentUser = userService.getUserByUsername(SecurityUtils.getSubject().getPrincipal().toString());
        if(expenditure != null && expenditure.getUser().equals(currentUser))
            expenditureService.deleteExpenditure(id);
        return "redirect:/home";
    }
}
