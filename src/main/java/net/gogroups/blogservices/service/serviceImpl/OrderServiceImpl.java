package net.gogroups.blogservices.service.serviceImpl;

import net.gogroups.blogservices.model.Order;
import net.gogroups.blogservices.repository.OrderRepository;
import net.gogroups.blogservices.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderRepository orderRepository;

    @Override
    public Optional<List<Order>> getOrders(String userId) {
        return orderRepository.findByUserId(userId);
    }

    @Override
    public Order saveOrder(Order order) {
        return orderRepository.save(order);
    }

}
