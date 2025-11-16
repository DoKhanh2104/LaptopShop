package com.khanh.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.khanh.laptopshop.domain.Order;
import com.khanh.laptopshop.domain.OrderDetail;
import com.khanh.laptopshop.repository.OrderDetailRepository;
import com.khanh.laptopshop.repository.OrderRepository;

@Service
public class OrderService {
    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;

    public OrderService(OrderRepository orderRepository, OrderDetailRepository orderDetailRepository) {
        this.orderRepository = orderRepository;
        this.orderDetailRepository = orderDetailRepository;
    }

    public List<Order> getAllOrder() {
        return this.orderRepository.findAll();
    }

    public Order getOrderById(long id) {
        return this.orderRepository.getById(id);
    }

    public Order handleSaveOrder(Order order) {
        return this.orderRepository.save(order);
    }

    public void deleteOrder(long id) {
        this.orderRepository.deleteById(id);
    }

    public void deleteOrderDetail(long id) {
        this.orderDetailRepository.deleteById(id);
    }
}
