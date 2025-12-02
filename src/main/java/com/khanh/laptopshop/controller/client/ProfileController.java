package com.khanh.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.khanh.laptopshop.domain.Order;
import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.service.OrderService;
import com.khanh.laptopshop.service.UploadService;
import com.khanh.laptopshop.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ProfileController {

    private final UserService userService;
    private final UploadService uploadService;
    private final OrderService orderService;

    public ProfileController(UserService userService, UploadService uploadService, OrderService orderService) {
        this.userService = userService;
        this.uploadService = uploadService;
        this.orderService = orderService;
    }

    // Get Profile Page
    @GetMapping("/profile")
    public String getProfilePage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);

        return "client/management/profile";
    }

    @PostMapping("/update-profile")
    public String postUpdateProfile(HttpServletRequest request, @ModelAttribute("currentUser") User user,
            @RequestParam("avatarFile") MultipartFile file) {
        HttpSession session = request.getSession(false);
        String email = (String) session.getAttribute("email");
        User currentUser = this.userService.getUserByEmail(email);
        currentUser.setAddress(user.getAddress());
        currentUser.setFullName(user.getFullName());
        currentUser.setPhone(user.getPhone());

        if (file != null && !file.isEmpty()) {
            String avatar = this.uploadService.handleUpload(file, "avatar");
            currentUser.setAvatar(avatar);
        }

        this.userService.handleSaveUser(currentUser);
        session.setAttribute("avatar", currentUser.getAvatar());
        return "redirect:/";
    }

    // Get Order History Page
    @GetMapping("/order-history")
    public String getOrderHistoryPage(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        User user = this.userService.getUserById(id);
        List<Order> orders = this.orderService.getOrdersByUser(user);
        model.addAttribute("orders", orders);
        return "client/management/order-history";
    }
}
