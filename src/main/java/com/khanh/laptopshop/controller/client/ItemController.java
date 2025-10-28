package com.khanh.laptopshop.controller.client;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ItemController {
    @GetMapping("/product/{id}")
    public String getDetailProductPage(@PathVariable long id) {
        return "client/product/detail";
    }
}
