package com.nitv.controller;

import com.nitv.model.Expenditure;
import com.nitv.service.ExpenditureService;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
public class ApiController {
    Logger log = LoggerFactory.getLogger(ApiController.class);

    @Autowired
    private ExpenditureService expenditureService;

    @GetMapping("/expenditures")
    public Page<Expenditure> getExpenditures(@RequestParam(defaultValue = "") String item,
                                             @RequestParam(required = false) Date startDate,
                                             @RequestParam(required = false) Date endDate,
                                             @RequestParam(defaultValue = "1") int page,
                                             @RequestParam(defaultValue = "20") int size){

        String username = SecurityUtils.getSubject().getPrincipal().toString();
        if(startDate == null && endDate == null)
            return expenditureService.getExpendituresByUser(username, item, PageRequest.of(page-1, size));
        else if(startDate == null)
            return expenditureService.getExpendituresByEndDateAndItem(username, endDate, item, PageRequest.of(page-1, size));
        else if(endDate == null)
            return expenditureService.getExpendituresByStartDateAndItem(username, startDate, item, PageRequest.of(page-1, size));
        else
            return expenditureService.getExpendituresByDateAndItem(username, startDate, endDate, item, PageRequest.of(page-1, size));
    }

}
