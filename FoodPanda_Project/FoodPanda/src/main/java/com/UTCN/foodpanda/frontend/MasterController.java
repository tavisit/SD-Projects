package com.utcn.foodpanda.frontend.Controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MasterController {
    public class CommonController {
         @GetMapping("/login")
        public String viewLoginPage() {
            return "login";
        }
    }
}
