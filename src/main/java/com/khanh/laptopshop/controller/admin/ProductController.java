package com.khanh.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.khanh.laptopshop.domain.Product;
import com.khanh.laptopshop.service.ProductService;
import com.khanh.laptopshop.service.UploadService;

import jakarta.validation.Valid;

@Controller
public class ProductController {
    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    // Show table product
    @GetMapping("/admin/product")
    public String getProductPage(Model model) {
        List<Product> products = this.productService.getAllProduct();
        model.addAttribute("products", products);
        return "admin/product/show";
    }

    // Show form create product
    @GetMapping("/admin/product/create")
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    // Create product
    @PostMapping("/admin/product/create")
    public String createProduct(Model model, @ModelAttribute("newProduct") @Valid Product product,
            BindingResult bindingResult,
            @RequestParam("productFile") MultipartFile file) {

        // Validate
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(">>> Error: " + error.getField() + "-" + error.getDefaultMessage());
        }
        if (bindingResult.hasErrors()) {
            return "/admin/product/create";
        }

        String imgProduct = this.uploadService.handleUpload(file, "product");
        product.setImage(imgProduct);
        this.productService.handleSaveProduct(product);
        return "redirect:/admin/product";
    }
}
