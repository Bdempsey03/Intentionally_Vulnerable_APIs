package com.example.cpsc499.api.controller;


import com.example.cpsc499.api.model.User;
import com.example.cpsc499.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.Optional;

@RestController
public class UserController {

    private UserService userService;

    @Autowired
    public UserController(UserService userService){
        this.userService = userService;
    }

    @GetMapping("/user")
    public User getUser(@RequestParam Integer id) {
        Optional user = userService.getUser(id);
        if (user.isPresent()) {
            return (User) user.get();
        }
        return null;
    }
}
