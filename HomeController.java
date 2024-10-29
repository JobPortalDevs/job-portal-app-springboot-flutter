// src/main/java/com/example/jobportal/controller/HomeController.java
package com.example.jobportal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
    // Home page
    @GetMapping("/")
    public String home() {
        return "index";
    }

    // About page
    @GetMapping("/about")
    public String about() {
        return "about";
    }

    // Contact page
    @GetMapping("/contact")
    public String contact() {
        return "contact";
    }
}
