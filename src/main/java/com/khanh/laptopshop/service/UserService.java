package com.khanh.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.khanh.laptopshop.domain.Role;
import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.domain.dto.RegisterDTO;
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
    public User getUserByEmail(String email) {
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

    // Lấy tên role thông qua id
    public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

    // Chuyển dữ liệu từ DTO sang User
    public User registerDTOtoUser(RegisterDTO registerDTO) {
        User user = new User();
        user.setFullName(registerDTO.getFirstName() + " " + registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setPassword(registerDTO.getPassword());

        return user;
    }

    // Check email
    public boolean existsByEmail(String email) {
        return this.userRepository.existsByEmail(email);
    }
}
