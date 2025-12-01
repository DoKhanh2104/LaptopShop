package com.khanh.laptopshop.controller.admin;

import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.service.UploadService;
import com.khanh.laptopshop.service.UserService;

import jakarta.validation.Valid;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UserController {
    private final UserService userService;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, UploadService uploadService,
            PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    // Hiển thị table người dùng
    @RequestMapping("/admin/user")
    public String getUserPage(Model model, @RequestParam("page") Optional<String> pageOptional) {

        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                page = Integer.parseInt(pageOptional.get());
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        Pageable pageable = PageRequest.of(page - 1, 2);
        Page<User> pageUser = this.userService.fetchAllUser(pageable);
        List<User> users = pageUser.getContent();
        model.addAttribute("users", users); // "users truyền qua view , users lấy dữ liệu trả về từ service"
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPage", pageUser.getTotalPages());
        return "admin/user/show";
    }

    // Hiển thị chi tiết người dùng
    @RequestMapping("/admin/user/{id}")
    public String getUserDetail(Model model, @PathVariable long id) {
        User userByID = this.userService.getUserById(id);
        System.out.println(userByID);
        model.addAttribute("userByID", userByID);
        // model.addAttribute("id", id);
        return "admin/user/detail";
    }

    // Hiển thị trang tạo mới người dùng
    @GetMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Tạo người dùng
    @PostMapping("/admin/user/create")
    public String createUser(Model model, @ModelAttribute("newUser") @Valid User user, BindingResult bindingResult,
            @RequestParam("avatarFile") MultipartFile file) {

        // Validate
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println("Error: " + error.getField() + "-" + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "admin/user/create";
        }

        String avatar = this.uploadService.handleUpload(file, "avatar");
        String hashPassword = this.passwordEncoder.encode(user.getPassword());
        user.setAvatar(avatar);
        user.setPassword(hashPassword);
        user.setRole(this.userService.getRoleByName(user.getRole().getName()));
        this.userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }

    // Giao diện update
    @RequestMapping("/admin/user/update/{id}")
    public String getUpdateUserPage(Model model, @PathVariable long id, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("newUser", currentUser);
        return "admin/user/update";
    }

    // Cập nhật người dùng
    @PostMapping("/admin/user/update")
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user,
            @RequestParam("avatarFile") MultipartFile file) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {

            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());
            currentUser.setRole(this.userService.getRoleByName(user.getRole().getName()));
            if (file != null && !file.isEmpty()) {
                String avatar = this.uploadService.handleUpload(file, "avatar");
                currentUser.setAvatar(avatar);
            }

            this.userService.handleSaveUser(currentUser);
        }
        return "redirect:/admin/user";
    }

    // Giao diện muốn xóa người dùng ko?
    @RequestMapping("admin/user/delete/{id}")
    public String getDeleteUserPage(Model model, @PathVariable long id) {
        model.addAttribute("newUser", new User());
        return "admin/user/delete";
    }

    // viết action cho btn xóa
    @RequestMapping(value = "/admin/user/delete", method = RequestMethod.POST)
    public String deleteUser(Model model, @ModelAttribute("newUser") User user) {
        this.userService.deleteUserById(user.getId());
        return "redirect:/admin/user";
    }
}
