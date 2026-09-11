package com.bdms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bdms.model.User;
import com.bdms.service.UserService;

@Controller
public class LoginController {
	@Autowired
    private UserService userService;
 
    // Show login form. type = "admin" or "donor"
    @GetMapping("/login")
    public String showLoginForm(@RequestParam(value = "type", defaultValue = "donor") String type,
                                 Model model) {
        userService.createDefaultAdminIfNoneExists();
        model.addAttribute("loginType", type);
        return "login";
    }
 
    // Handle login submission
    @PostMapping("/login")
    public String processLogin(@RequestParam("username") String username,
                                @RequestParam("password") String password,
                                @RequestParam("loginType") String loginType,
                                HttpServletRequest request,
                                Model model) {
 
        String requiredRole = "admin".equalsIgnoreCase(loginType) ? "ADMIN" : "DONOR";
        User user = userService.validateLogin(username, password, requiredRole);
 
        if (user == null) {
            model.addAttribute("errorMessage", "Invalid credentials for this login type");
            model.addAttribute("loginType", loginType);
            return "login";
        }
 
        HttpSession session = request.getSession();
        session.setAttribute("loggedInUser", user);
        return "redirect:/";
    }
 
    // Logout
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "redirect:/";
    }
}
