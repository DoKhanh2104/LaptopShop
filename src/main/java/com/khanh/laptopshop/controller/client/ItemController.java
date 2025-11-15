package com.khanh.laptopshop.controller.client;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
        User currenUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currenUser.setId(id);
        Cart cart = this.productService.fetchByUser(currenUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        // Sum
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getQuantity() * cd.getPrice();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);
        model.addAttribute("cart", cart);

        return "client/cart/show";
    }

    @GetMapping("/checkout")
    public String getCheckoutPage(Model model, HttpServletRequest request) {
        // Create new user -> get id from session and transmitted to the current user ->
        // get cart from user
        User currenUser = new User();
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currenUser.setId(id);
        Cart cart = this.productService.fetchByUser(currenUser);

        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();

        // Sum
        double totalPrice = 0;
        for (CartDetail cd : cartDetails) {
            totalPrice += cd.getQuantity() * cd.getPrice();
        }

        model.addAttribute("cartDetails", cartDetails);
        model.addAttribute("totalPrice", totalPrice);

        return "client/cart/checkout";
    }

    @PostMapping("/delete-cart-product/{id}")
    public String deleteCartDetail(@PathVariable long id, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        long cartDetailId = id;
        this.productService.handleRemoveCartDetail(cartDetailId, session);

        return "redirect:/cart";
    }

    @PostMapping("/confirm-checkout")
    public String getCheckOutPage(@ModelAttribute("cart") Cart cart) {
        List<CartDetail> cartDetails = cart == null ? new ArrayList<CartDetail>() : cart.getCartDetails();
        this.productService.handleUpdateCartBeforeCheckout(cartDetails);
        return "redirect:/checkout";
    }

    @PostMapping("/place-order")
    public String handlePlaceOrder(
            HttpServletRequest request,
            @RequestParam("receiverName") String receiverName,
            @RequestParam("receiverAddress") String receiverAddress,
            @RequestParam("receiverPhone") String receiverPhone) {

        User currentUser = new User();// null
        HttpSession session = request.getSession(false);
        long id = (long) session.getAttribute("id");
        currentUser.setId(id);

        this.productService.handlePlaceOrder(currentUser, session, receiverName, receiverAddress, receiverPhone);
        return "redirect:/thanks";
    }

    @GetMapping("/thanks")
    public String getThanksPage() {
        return "client/cart/thanks";
    }
}
