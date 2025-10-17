package com.khanh.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.repository.UserRepository;

@Service
public class UserService {

    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
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
}
