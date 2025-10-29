package com.khanh.laptopshop.controller.admin;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import com.khanh.laptopshop.domain.Product;

@Controller
public class ProductController {

    // Show table product
    @GetMapping("/admin/product")
    public String getProductPage() {
        return "admin/product/show";
    }

    // Show form create product
    @GetMapping("admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }
}
