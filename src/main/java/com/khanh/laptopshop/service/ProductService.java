package com.khanh.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.khanh.laptopshop.domain.Cart;
import com.khanh.laptopshop.domain.CartDetail;
import com.khanh.laptopshop.domain.Product;
import com.khanh.laptopshop.domain.User;
import com.khanh.laptopshop.repository.CartDetailRepository;
import com.khanh.laptopshop.repository.CartRepository;
import com.khanh.laptopshop.repository.ProductRepository;

import jakarta.servlet.http.HttpSession;

@Service
public class ProductService {

    private final ProductRepository productRepository;
    private final CartRepository cartRepository;
    private final CartDetailRepository cartDetailRepository;
    private final UserService userService;

    public ProductService(ProductRepository productRepository, CartRepository cartRepository,
            CartDetailRepository cartDetailRepository, UserService userService) {
        this.productRepository = productRepository;
        this.cartRepository = cartRepository;
        this.cartDetailRepository = cartDetailRepository;
        this.userService = userService;
    }

    // Save product
    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    // Get all product
    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }

    // Get product by id
    public Product getProductById(long id) {
        return this.productRepository.findById(id);
    }

    // Delete by id
    public void deleteProductById(long id) {
        this.productRepository.deleteById(id);
    }

    public void handleAddProductToCart(String email, long productId, HttpSession session) {
        // check cart ? create new cart
        User user = this.userService.getByEmail(email);
        if (user != null) {
            Cart cart = cartRepository.findByUser(user);

            if (cart == null) {
                Cart otherCart = new Cart();
                otherCart.setSum(0);
                otherCart.setUser(user);

                cart = this.cartRepository.save(otherCart);
            }

            // Save product to cartdetail
            // Find product by id
            Product product = this.productRepository.findById(productId);
            CartDetail oldDetail = this.cartDetailRepository.findByCartAndProduct(cart, product);
            if (oldDetail == null) {
                CartDetail cartDetail = new CartDetail();

                cartDetail.setCart(cart);
                cartDetail.setProduct(product);
                cartDetail.setPrice(product.getPrice());
                cartDetail.setQuantity(1);

                this.cartDetailRepository.save(cartDetail);

                // If add new product -> sum (product)
                int sum = cart.getSum() + 1;
                cart.setSum(sum);
                this.cartRepository.save(cart);
                session.setAttribute("sum", sum);

            } else {
                // Exists product -> plus quantity
                oldDetail.setQuantity(oldDetail.getQuantity() + 1);
                this.cartDetailRepository.save(oldDetail);
            }

        }
    }

    public Cart fetchByUser(User user) {
        return this.cartRepository.findByUser(user);
    }
}
