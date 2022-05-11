package com.backend;

import org.apache.log4j.PropertyConfigurator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.text.SimpleDateFormat;
import java.util.Date;

@SpringBootApplication
public class BackendApplication {

    static {
        SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
        System.setProperty("yearTime", yearFormat.format(new Date()));
        SimpleDateFormat monthFormat = new SimpleDateFormat("MM");
        System.setProperty("monthTime", monthFormat.format(new Date()));
        SimpleDateFormat dayFormat = new SimpleDateFormat("dd");
        System.setProperty("dayTime", dayFormat.format(new Date()));
        SimpleDateFormat hourFormat = new SimpleDateFormat("HH");
        System.setProperty("hourTime", hourFormat.format(new Date()));
        SimpleDateFormat minuteFormat = new SimpleDateFormat("mm");
        System.setProperty("minuteTime", minuteFormat.format(new Date()));
    }

    public static void main(String[] args) {
        PropertyConfigurator.configure("src/log4j.properties");
        SpringApplication.run(BackendApplication.class, args);
    }

    @Bean
    public WebMvcConfigurer corsConfigurer()
    {
        return  new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**").allowedMethods("GET", "POST", "PUT", "DELETE")
                        .allowedOrigins("*")
                        .allowedHeaders("*");
            }
        };
    }
}
