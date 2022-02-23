package net.gogroups.blogservices.service;

import net.gogroups.blogservices.model.Order;

import java.util.List;
import java.util.Optional;

public interface OrderService {

    Optional<List<Order>> getOrders(String userId);

    Order saveOrder(Order order);
}
