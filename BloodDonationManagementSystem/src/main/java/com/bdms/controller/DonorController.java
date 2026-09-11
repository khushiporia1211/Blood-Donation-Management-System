package com.bdms.controller;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bdms.model.Donor;
import com.bdms.model.User;
import com.bdms.service.DonorService;
import com.bdms.service.UserService;

@Controller
public class DonorController {

    @Autowired
    private DonorService donorService;

    @Autowired
    private UserService userService;

    private boolean isAdminLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }
        User user = (User) session.getAttribute("loggedInUser");
        return user != null && user.isAdmin();
    }

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(java.util.Date.class, new CustomDateEditor(dateFormat, true));
    }

    // Show empty registration form
    @GetMapping("/register")
    public String showRegisterForm(Model model) {
        model.addAttribute("donor", new Donor());
        return "donor-form";
    }

    // Handle form submission
    @PostMapping("/register")
    public String registerDonor(@Valid @ModelAttribute("donor") Donor donor,
                                 BindingResult result,
                                 @RequestParam(value = "accountUsername", required = false) String accountUsername,
                                 @RequestParam(value = "accountPassword", required = false) String accountPassword,
                                 HttpServletRequest request,
                                 Model model) {
        if (result.hasErrors()) {
            return "donor-form";
        }

        if (accountUsername != null && !accountUsername.trim().isEmpty()
                && userService.usernameExists(accountUsername.trim())) {
            model.addAttribute("usernameError", "That username is already taken");
            return "donor-form";
        }

        donorService.registerDonor(donor);

        if (accountUsername != null && !accountUsername.trim().isEmpty()
                && accountPassword != null && !accountPassword.isEmpty()) {
            userService.createDonorAccount(accountUsername.trim(), accountPassword, donor.getId());

            // Auto-login the newly registered donor so they land on their own profile
            User newUser = userService.validateLogin(accountUsername.trim(), accountPassword, "DONOR");
            if (newUser != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", newUser);
                return "redirect:/profile";
            }
        }

        return "redirect:/";
    }

    // List all donors (Admin only)
    @GetMapping("/list")
    public String listDonors(HttpServletRequest request, Model model) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        List<Donor> donors = donorService.getAllDonors();
        model.addAttribute("donors", donors);
        return "donor-list";
    }

    // Search donors by blood group (Admin only)
    @GetMapping("/search")
    public String searchByBloodGroup(@RequestParam(required = false) String bloodGroup,
                                      HttpServletRequest request,
                                      Model model) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        List<Donor> donors;
        if (bloodGroup != null && !bloodGroup.trim().isEmpty()) {
            donors = donorService.getDonorByBloodGroup(bloodGroup);
        } else {
            donors = donorService.getAllDonors();
        }
        model.addAttribute("donors", donors);
        model.addAttribute("selectedBloodGroup", bloodGroup);
        return "donor-list";
    }

    // Show edit form for a specific donor (Admin only)
    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable("id") Long id, HttpServletRequest request, Model model) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        Donor donor = donorService.getDonorById(id);
        model.addAttribute("donor", donor);
        return "donor-form";
    }

    // Handle edit submission (Admin only)
    @PostMapping("/edit/{id}")
    public String updateDonor(@PathVariable("id") Long id,
                               @Valid @ModelAttribute("donor") Donor donor,
                               BindingResult result,
                               HttpServletRequest request) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        if (result.hasErrors()) {
            return "donor-form";
        }
        donor.setId(id);
        donorService.updateDonor(donor);
        return "redirect:/list";
    }

    // Record a donation (Admin only)
    @GetMapping("/donate/{id}")
    public String recordDonation(@PathVariable("id") Long id, HttpServletRequest request) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        donorService.recordDonation(id);
        return "redirect:/list";
    }

    // Delete a donor (Admin only)
    @GetMapping("/delete/{id}")
    public String deleteDonor(@PathVariable("id") Long id, HttpServletRequest request) {
        if (!isAdminLoggedIn(request)) {
            return "redirect:/login?type=admin";
        }
        donorService.deleteDonor(id);
        return "redirect:/list";
    }
}