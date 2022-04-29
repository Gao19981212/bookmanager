package com.example.back_code;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import springfox.documentation.oas.annotations.EnableOpenApi;

@SpringBootApplication
@EnableOpenApi
public class BackCodeApplication {

    public static void main(String[] args) {
        SpringApplication.run(BackCodeApplication.class, args);
    }

}
