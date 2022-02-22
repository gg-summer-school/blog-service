package net.gogroups.blogservices.service;

import net.gogroups.blogservices.model.Order;

import java.util.Optional;

public interface OrderService {

    Optional<Order> getOrderDetails(String email);

    Order save(Order order);
}
