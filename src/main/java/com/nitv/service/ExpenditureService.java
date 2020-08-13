package com.nitv.service;

import com.nitv.model.Expenditure;
import com.nitv.model.User;
import com.nitv.repo.ExpenditureRepository;
import com.nitv.repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.Date;


@Service
public class ExpenditureService {
    @Autowired
    private ExpenditureRepository expenditureRepository;

    @Autowired
    private UserRepository userRepository;

    public Page<Expenditure> getExpendituresByUser(String username, String search, Pageable pageable){
        User user = userRepository.findByUsername(username).orElse(null);
        return expenditureRepository.findAllByUserAndItemContainingOrderByDate(user, search, pageable);
    }

    public Expenditure getExpenditureById(long id){
        return expenditureRepository.findById(id).orElse(null);
    }

    public void addExpenditure(Expenditure expenditure){
        if(userRepository.findById(expenditure.getUser().getId()).isPresent())
            expenditureRepository.save(expenditure);
    }

    public void deleteExpenditure(long id) {
        expenditureRepository.deleteById(id);
    }

    public Page<Expenditure> getExpendituresByDateAndItem(String username, Date startDate, Date endDate, String item, Pageable pageable) {
        User user = userRepository.findByUsername(username).orElse(null);
        return expenditureRepository.findAllByUserAndDateBetweenAndItemContainingOrderByDate(user, startDate, endDate, item, pageable);
    }

    public Page<Expenditure> getExpendituresByStartDateAndItem(String username, Date startDate, String item, Pageable pageable) {
        User user = userRepository.findByUsername(username).orElse(null);
        startDate.setDate(startDate.getDate()-1);
        return expenditureRepository.findAllByUserAndDateAfterAndItemContainingOrderByDate(user, startDate, item, pageable);
    }

    public Page<Expenditure> getExpendituresByEndDateAndItem(String username, Date endDate, String item, Pageable pageable) {
        User user = userRepository.findByUsername(username).orElse(null);
        endDate.setDate(endDate.getDate()+1);
        return expenditureRepository.findAllByUserAndDateBeforeAndItemContainingOrderByDate(user, endDate, item, pageable);
    }

    public int getExpendituresSize() {
        return expenditureRepository.findAll().size();
    }
}
