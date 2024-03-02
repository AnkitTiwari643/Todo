package com.example.Todo.Service;


import org.springframework.stereotype.Service;

@Service
public class AuthenticationService {

    public boolean authenticate(String username, String password) {
        boolean isValidUsername = username.equalsIgnoreCase("ankit");
        boolean isValidPassword = password.equals("dummy");
        return isValidPassword && isValidPassword;
    }
}
