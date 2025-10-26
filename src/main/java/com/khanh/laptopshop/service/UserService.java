package com.khanh.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.khanh.laptopshop.domain.Role;
import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.repository.RoleRepository;
import com.khanh.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;
    private final RoleRepository roleRepository;

    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
    }

    // Lưu người dùng
    public User handleSaveUser(User user) {
        return this.userRepository.save(user);
    }

    // Lấy tất cả dữ liệu người dùng
    public List<User> getAllUsers() {
        return this.userRepository.findAll();
    }

    // Lấy người dùng theo email
    public List<User> getByEmail(String email) {
        return this.userRepository.findByEmail(email);
    }

    // Lấy người dùng theo id
    public User getUserById(long id) {
        return this.userRepository.findById(id);
    }

    // Xóa người dùng
    public void deleteUserById(long id) {
        this.userRepository.deleteById(id);
    }

    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }
}
