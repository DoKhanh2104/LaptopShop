package com.khanh.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.khanh.laptopshop.service.ProductService;

@Controller
public class DashboardController {

    private final ProductService productService;

    public DashboardController(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/admin")
    public String getDashboardPage(Model model) {
        model.addAttribute("countUser", this.productService.countUser());
        model.addAttribute("countProduct", this.productService.countProduct());
        model.addAttribute("countOrder", this.productService.countOrder());
        return "admin/dashboard/show";
    }

}
