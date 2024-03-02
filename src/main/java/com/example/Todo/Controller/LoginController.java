package com.example.Todo.Controller;

import com.example.Todo.Service.AuthenticationService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    private AuthenticationService authenticationService;

    public LoginController(AuthenticationService authenticationService) {
        this.authenticationService = authenticationService;
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }

    @RequestMapping(value = "login", method = RequestMethod.POST)
    public String welcome(@RequestParam String username, @RequestParam String password, ModelMap map) {
        if(authenticationService.authenticate(username, password)) {
            map.put("name", username);
            map.put("password", password);
            return "welcome";
        }
        map.put("error", "Invalid Username or password! Please try again");
        return "login";
    }
}
