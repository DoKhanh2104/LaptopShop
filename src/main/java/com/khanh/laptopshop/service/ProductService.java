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
}
