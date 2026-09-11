package com.bdms.controller;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
 
import com.bdms.model.Donor;
import com.bdms.model.User;
import com.bdms.service.DonorService;
 
@Controller
public class DonorProfileController {
 
    @Autowired
    private DonorService donorService;
 
    @GetMapping("/profile")
    public String viewProfile(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession(false);
        User loggedInUser = (session != null) ? (User) session.getAttribute("loggedInUser") : null;
 
        if (loggedInUser == null || !"DONOR".equalsIgnoreCase(loggedInUser.getRole())) {
            return "redirect:/login?type=donor";
        }
 
        Donor donor = donorService.getDonorById(loggedInUser.getDonorId());
        model.addAttribute("donor", donor);
        return "profile";
    }
}