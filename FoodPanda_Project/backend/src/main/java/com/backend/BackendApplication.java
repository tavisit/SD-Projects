package com.backend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.TimeZone;

@SpringBootApplication
public class BackendApplication {

    public static void main(String[] args) {
        String format = "dd_HH_mm_ss";
        SimpleDateFormat yearFormat = new SimpleDateFormat("yyyy");
        SimpleDateFormat monthFormat = new SimpleDateFormat("MM");

        SimpleDateFormat sdf = new SimpleDateFormat(format, Locale.US);
        System.setProperty("timestamp",sdf.format(System.currentTimeMillis()));
        System.setProperty("year",yearFormat.format(System.currentTimeMillis()));
        System.setProperty("month",monthFormat.format(System.currentTimeMillis()));
        SpringApplication.run(BackendApplication.class, args);
        Thread.dumpStack();
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
