// src/main/java/com/example/jobportal/controller/AuthController.java
package com.example.jobportal.controller;

//import com.example.jobportal.entity.User;
//import com.example.jobportal.service.UserService;
//import jakarta.validation.Valid;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;



@Controller
public class AuthController {
    @Autowired

    // Registration form
    @GetMapping("/register")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user");
        return "register";
    }

    // Handle registration
    @PostMapping("/register")
    public String registerUser(@ModelAttribute("user") @Valid User user,
                               @RequestParam("role") String role,
                               Model model) {
        try {
            Object userService = new Object();
            userService.getClass();
            return "redirect:/login?success";
        } catch (Exception e) {
            model.addAttribute("error", e.getMessage());
            return "register";
        }
    }

    // Login form
    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }
}
