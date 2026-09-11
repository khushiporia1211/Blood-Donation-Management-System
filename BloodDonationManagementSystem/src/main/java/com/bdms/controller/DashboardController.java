package com.bdms.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bdms.model.Bloodstock;

import com.bdms.model.Donor;
import com.bdms.model.User;
import com.bdms.service.BloodstockService;

import com.bdms.service.DonorService;

@Controller
public class DashboardController {

    @Autowired
    private DonorService donorService;

    @Autowired
    private BloodstockService bloodStockService;

    private boolean isAdminLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }
        User user = (User) session.getAttribute("loggedInUser");
        return user != null && user.isAdmin();
    }

    @GetMapping("/dashboard")
    public String showDashboard(HttpServletRequest request, Model model) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }

        bloodStockService.initializeStockIfEmpty();

        List<Donor> allDonors = donorService.getAllDonors();
        List<Bloodstock> allStock = bloodStockService.getAllStock();

        // Count total donors
        int totalDonors = allDonors.size();

        // Count how many donors are currently eligible
        int eligibleCount = 0;
        for (Donor d : allDonors) {
            if (d.isEligibleToDonate()) {
                eligibleCount++;
            }
        }

        // Sum total units across all blood groups
        int totalUnits = 0;
        for (Bloodstock s : allStock) {
            totalUnits += s.getUnitsAvailable();
        }

        model.addAttribute("totalDonors", totalDonors);
        model.addAttribute("eligibleCount", eligibleCount);
        model.addAttribute("totalUnits", totalUnits);
        model.addAttribute("stockList", allStock);

        return "dashboard";
    }
}
