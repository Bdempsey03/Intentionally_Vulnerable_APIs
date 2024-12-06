package com.example.cpsc499.service;

import com.example.cpsc499.api.model.User;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

@Service
public class UserService {

    private List<User> userList;

    public UserService(){
        userList = new ArrayList<>();


        User user1 = new User(1, "Bob", 32, "bob@bobmail.com", "5615, Oak Street", "1245-5827-2934");
        User user2 = new User(2, "Dan", 20, "dan@danmail.com", "9812, Marble Street", "6242-9182-1234");
        User user3 = new User(3, "Lars", 50, "Lars@larsmail.com", "7832, Crescent", "8234-1245-3842");

        userList.addAll(Arrays.asList(user1, user2, user3));

    }


    public Optional<User> getUser(Integer id) {
        Optional optional = Optional.empty();
        for (User user: userList){
            if(id == user.getId()){
                optional = Optional.of(user);
                return optional;
            }
        }
        return optional;
    }
}
