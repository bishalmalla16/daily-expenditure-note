package com.nitv.repo;

import com.nitv.model.Expenditure;
import com.nitv.model.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Date;

public interface ExpenditureRepository extends JpaRepository<Expenditure, Long> {
    Page<Expenditure> findAllByUserAndItemContainingOrderByDate(User user, String item, Pageable pageable);
    Page<Expenditure> findAllByUserAndDateBetweenAndItemContainingOrderByDate(User user, Date startDate, Date endDate, String item, Pageable pageable);
    Page<Expenditure> findAllByUserAndDateAfterAndItemContainingOrderByDate(User user, Date startDate, String item, Pageable pageable);
    Page<Expenditure> findAllByUserAndDateBeforeAndItemContainingOrderByDate(User user, Date endDate, String item, Pageable pageable);
}
