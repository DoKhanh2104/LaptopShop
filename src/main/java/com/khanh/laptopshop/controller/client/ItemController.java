package com.khanh.laptopshop.controller.client;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.khanh.laptopshop.domain.Cart;
import com.khanh.laptopshop.domain.CartDetail;
import com.khanh.laptopshop.domain.Product;
import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.service.ProductService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ItemController {

    private final ProductService productService;

    public ItemController(ProductService productService) {
        this.productService = productService;
    }

    // Detail product
    @GetMapping("/product/{id}")
    public String getDetailProductPage(Model model, @PathVariable long id) {
        Product productById = this.productService.getProductById(id);
        model.addAttribute("productById", productById);
        return "client/product/detail";
    }

    // Add product to cart
    @PostMapping("/add-product-to-cart/{id}")
    public String postProductToCart(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long productId = id;
        String email = (String) session.getAttribute("email");
        this.productService.handleAddProductToCart(email, productId, session);
        return "redirect:/";
    }

    // Get Cart Page
    @GetMapping("/cart")
    public String getCartPage(Model model, HttpServletRequest request) {
        // Create new user -> get id from session and transmitted to the current user ->
        // get cart from user
        HttpSession session = request.getSession(false);
        User currenUser = new User();
        long id = (long) session.getAttribute("id");
        currenUser.setId(id);
        Cart cart = this.productService.fetchByUser(currenUser);
        List<CartDetail> cartDetails = cart.getCartDetails();
        model.addAttribute("cartDetails", cartDetails);

        // Sum
        double sum = 0;
        for (CartDetail cd : cartDetails) {
            sum += cd.getQuantity() * cd.getPrice();
        }
        ;
        model.addAttribute("sum", sum);

        return "client/cart/show";
    }
}
