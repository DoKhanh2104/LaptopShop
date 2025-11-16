package com.khanh.laptopshop.controller.admin;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.khanh.laptopshop.domain.Order;
import com.khanh.laptopshop.domain.OrderDetail;
import com.khanh.laptopshop.service.OrderService;

@Controller
public class OrderController {

    private final OrderService orderService;

    public OrderController(OrderService orderService) {
        this.orderService = orderService;
    }

    // table order
    @GetMapping("/admin/order")
    public String getOrderPage(Model model) {
        List<Order> orders = this.orderService.getAllOrder();
        model.addAttribute("orders", orders);
        return "admin/order/show";
    }

    // detail order
    @GetMapping("/admin/order/{id}")
    public String getDetailOrderPage(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        List<OrderDetail> orderDetails = order.getOrderDetails();
        model.addAttribute("id", id);
        model.addAttribute("orderDetails", orderDetails);
        return "admin/order/detail";
    }

    // show page update order
    @GetMapping("/admin/order/update/{id}")
    public String getUpdateOrderPage(Model model, @PathVariable long id) {
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("newOrder", order);
        return "admin/order/update";
    }

    // update order
    @PostMapping("/admin/order/update")
    public String updateOrder(@ModelAttribute("newOrder") Order newOrder) {
        Order currentOrder = this.orderService.getOrderById(newOrder.getId());
        currentOrder.setStatus(newOrder.getStatus());

        this.orderService.handleSaveOrder(currentOrder);
        return "redirect:/admin/order";
    }

    // show delete order page
    @GetMapping("/admin/order/delete/{id}")
    public String getDeleteOrderPage(@PathVariable long id, Model model) {
        Order order = this.orderService.getOrderById(id);
        model.addAttribute("newOrder", order);
        return "admin/order/delete";
    }

    @PostMapping("/admin/order/delete")
    public String deleteOrder(@ModelAttribute("newOrder") Order newOrder) {
        Order order = this.orderService.getOrderById(newOrder.getId());
        List<OrderDetail> orderDetails = order.getOrderDetails();
        orderDetails.forEach(orderDetail -> this.orderService.deleteOrderDetail(orderDetail.getId()));
        this.orderService.deleteOrder(order.getId());

        return "redirect:/admin/order";
    }

}
