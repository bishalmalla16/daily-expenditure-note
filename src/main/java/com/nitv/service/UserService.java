package com.nitv.service;

import com.nitv.model.Role;
import com.nitv.model.User;
import com.nitv.repo.RoleRepository;
import com.nitv.repo.UserRepository;
import org.apache.shiro.crypto.hash.Sha256Hash;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    public List<User> getAllUsers(){
        return userRepository.findAll();
    }

    public User getUserById(int id){
        return userRepository.findById(id).orElse(null);
    }

    public User getUserByUsername(String username){
        return userRepository.findByUsername(username).orElse(null);
    }

    public void addUser(User user){
        user.setPassword(new Sha256Hash(user.getPassword()).toHex());
        Set<Role> roles = new HashSet<>();
        roles.add(roleRepository.findByRoleName("user").orElse(null));
        user.setRoles(roles);
        userRepository.save(user);
    }

    public void updateUser(User user){
        userRepository.save(user);
    }

    public void deleteUser(int id) {
        userRepository.deleteById(id);
    }
}
