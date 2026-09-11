package com.bdms.controller;
 
import java.util.List;
 
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
 
import com.bdms.model.Bloodstock;
import com.bdms.model.User;
import com.bdms.service.BloodstockService;
 
@Controller
public class BloodstockController {
 
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
 
    // Show stock table (auto-initializes 8 blood groups with 0 units the first time)
    @GetMapping("/stock/list")
    public String listStock(HttpServletRequest request, Model model) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        bloodStockService.initializeStockIfEmpty();
        List<Bloodstock> stockList = bloodStockService.getAllStock();
        model.addAttribute("stockList", stockList);
        return "stock-list";
    }
 
    // Handle "set units" form submission
    @PostMapping("/stock/update")
    public String updateStock(@RequestParam("bloodGroup") String bloodGroup,
                               @RequestParam("units") Integer units,
                               HttpServletRequest request) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        bloodStockService.setStockUnits(bloodGroup, units);
        return "redirect:/stock/list";
    }
}
