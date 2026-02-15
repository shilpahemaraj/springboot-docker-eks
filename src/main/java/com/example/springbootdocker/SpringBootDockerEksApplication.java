package com.example.springbootdocker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
@RestController
public class SpringBootDockerEksApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootDockerEksApplication.class, args);
    }

    @GetMapping("/greetings")
    public String message() {
        return "Welcome! This app is deployed on AWS EKS";
    }
}

