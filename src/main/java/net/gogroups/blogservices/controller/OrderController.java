package net.gogroups.blogservices.controller;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import net.gogroups.blogservices.model.Order;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.payload.response.MessageResponse;
import net.gogroups.blogservices.service.UserService;
import net.gogroups.blogservices.service.serviceImpl.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@CrossOrigin()
@RestController
@RequestMapping("/api/")
public class OrderController {

    @Autowired
    OrderServiceImpl orderService;

    @Autowired
    UserService userService;

    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken")})
    @GetMapping("user/orders/")
    public ResponseEntity<?> retrieveOrderDetails() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Optional<User> user = userService.loadUserDetails(userDetails.getUsername());

        Optional<Order> orderDetails = orderService.getOrderDetails(user.get().getId());

        if (orderDetails.isEmpty()) {
            return new ResponseEntity<>(new MessageResponse("No orders found!"), HttpStatus.OK);
//        }else{
//            OrderDTO orderDTO = new OrderDTO(orderDetails.)
//            return new ResponseEntity(, HttpStatus.OK);
//        }
        }
        return null;
    }
}
