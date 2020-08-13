package com.nitv.service;

import com.nitv.model.Role;
import com.nitv.repo.RoleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RoleService {
    @Autowired
    private RoleRepository roleRepository;

    public void addRole(Role role){
        roleRepository.save(role);
    }

    public List<Role> getRoles() {
        return roleRepository.findAll();
    }
}
