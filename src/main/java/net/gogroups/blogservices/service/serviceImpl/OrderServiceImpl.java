package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.model.Order;
import net.gogroups.blogservices.repository.OrderRepository;
import net.gogroups.blogservices.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderRepository orderRepository;

    @Override
    public Optional<Order> getOrders(String userId) {
        return orderRepository.findByUserId(userId);
    }

    @Override
    public Order save(Order order) {
        return null;
    }
}
