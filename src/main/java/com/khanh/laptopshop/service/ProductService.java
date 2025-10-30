package com.khanh.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.khanh.laptopshop.domain.Product;
import com.khanh.laptopshop.repository.ProductRepository;

@Service
public class ProductService {

    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    // Lưu sản phẩm
    public Product handleSaveProduct(Product product) {
        return this.productRepository.save(product);
    }

    // Get all product
    public List<Product> getAllProduct() {
        return this.productRepository.findAll();
    }
}
