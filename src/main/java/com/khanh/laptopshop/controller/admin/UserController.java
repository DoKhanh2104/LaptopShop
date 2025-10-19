package com.khanh.laptopshop.controller.admin;

import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.service.UserService;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.PostMapping;

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
        model.addAttribute("hihi", "test");
        model.addAttribute("khanh", "toi ten la khanh");
        return "hello";
    }

    // Hiển thị table người dùng
    @RequestMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getAllUsers();
        model.addAttribute("users", users); // "users truyền qua view , users lấy dữ liệu trả về từ service"
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
    @RequestMapping("/admin/user/create")
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // Tạo người dùng
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUser(Model model, @ModelAttribute("newUser") User user) {
        System.out.println("run here" + user);
        userService.handleSaveUser(user);
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
    public String postUpdateUser(Model model, @ModelAttribute("newUser") User user) {
        User currentUser = this.userService.getUserById(user.getId());
        if (currentUser != null) {

            currentUser.setAddress(user.getAddress());
            currentUser.setFullName(user.getFullName());
            currentUser.setPhone(user.getPhone());

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
