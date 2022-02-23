package net.gogroups.blogservices.controller;

import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.Authorization;
import net.gogroups.blogservices.dto.ArticleDto;
import net.gogroups.blogservices.dto.OrderDTO;
import net.gogroups.blogservices.model.Article;
import net.gogroups.blogservices.model.Order;
import net.gogroups.blogservices.model.User;
import net.gogroups.blogservices.payload.request.OrderPayload;
import net.gogroups.blogservices.payload.response.MessageResponse;
import net.gogroups.blogservices.service.ArticleService;
import net.gogroups.blogservices.service.UserService;
import net.gogroups.blogservices.service.serviceImpl.OrderServiceImpl;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;
import java.util.Optional;

@CrossOrigin()
@RestController
@RequestMapping("/api/")
public class OrderController {

    @Autowired
    OrderServiceImpl orderService;

    @Autowired
    UserService userService;

    @Autowired
    ModelMapper modelMapper;

    @Autowired
    ArticleService articleService;

    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @GetMapping("user/orders/")
    public ResponseEntity<?> retrieveAllUserOrders() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Optional<User> user = userService.loadUserDetails(userDetails.getUsername());

        Optional<List<Order>> orderDetails = orderService.getOrders(user.get().getId());

        if (orderDetails.isEmpty()) {
            return new ResponseEntity<>(new MessageResponse("No orders found!"), HttpStatus.OK);
        } else {


            return new ResponseEntity(orderDetails, HttpStatus.OK);
        }
    }

    @ApiOperation(value = "", authorizations = {
            @Authorization(value = "jwtToken") })
    @PostMapping("user/orders/")
    public ResponseEntity<?> saveUserOrder(@Valid @RequestBody OrderPayload orderPayload) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        UserDetails userDetails = (UserDetails) authentication.getPrincipal();
        Optional<User> user = userService.loadUserDetails(userDetails.getUsername());

        List<Article> articles = articleService.findAllArticlesById(orderPayload.getArticleIds());
        OrderDTO orderDTO = new OrderDTO(articles, user.get().getId());
        Order order = this.modelMapper.map(orderDTO, Order.class);
        return new ResponseEntity<>(orderService.saveOrder(order), HttpStatus.CREATED);
    }

}
