package com.khanh.laptopshop.controller;

import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.service.UserService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserController {
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUser = this.userService.getAllUsers();
        List<User> arrUserEmail = this.userService.getByEmail("khanh@gmail");
        System.out.println(arrUser);
        System.out.println(arrUserEmail);

        model.addAttribute("hihi", "test");
        model.addAttribute("khanh", "toi ten la khanh");
        return "hello";
    }

    @GetMapping("/admin/user")
    public String getMethodName(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users); // "users truyền qua view , users lấy dữ liệu trả về từ service"
        return "admin/user/table-user";
    }

    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user) {
        System.out.println("run here" + user);
        userService.handleSaveUser(user);
        return "redirect:/admin/user";
    }
}
