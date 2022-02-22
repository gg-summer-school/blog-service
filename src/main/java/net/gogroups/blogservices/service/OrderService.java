package net.gogroups.blogservices.service;

import net.gogroups.blogservices.model.Order;
import org.aspectj.weaver.ast.Or;

import java.util.Optional;

public interface OrderService {

    Optional<Order> getOrders(String userId);

    Order saveOrder(Order order);

    Order editOrderById(Order order);

    Optional<Order> getOrderById(Long id);
}
