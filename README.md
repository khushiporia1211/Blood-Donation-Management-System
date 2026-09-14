# Blood Donation Management System

A multi-role web application for managing blood donations, donor records, and blood stock — built with Spring MVC, Hibernate, and MySQL.

🔗 **Live Demo:** [https://blood-donation-management-system-4114.onrender.com/login?type=donor](https://blood-donation-management-system-4114.onrender.com/login?type=donor)

## About

This project was built from scratch during a Summer Industrial Training program at Ducat School of AI, Pitampura, New Delhi, under the supervision of Sourabh Yadav.

## Features

- **Donor Management (CRUD)** — Add, update, view, and remove donor records, with 90-day donation eligibility enforcement
- **Blood Stock Management** — Track and update blood unit inventory by blood group
- **Authentication** — Session-based login for two roles: Admin and Donor
- **Donor Self-Registration** — New donors can register themselves into the system
- **Admin Dashboard** — Summary statistics overview for administrators
- **Record Donation** — Transactional donation-recording flow (`@Transactional`) to ensure data consistency

## Tech Stack

| Layer            | Technology                          |
|-------------------|--------------------------------------|
| Language           | Java                                 |
| Framework          | Spring 5.3 (MVC)                     |
| ORM                | Hibernate 5.6 (javax namespace, XML-configured) |
| Views              | JSP / JSTL                           |
| Styling            | Bootstrap 4                          |
| Database           | MySQL                                |
| Build Tool         | Maven                                |
| Server / IDE       | Apache Tomcat 9, Eclipse             |

## Key Implementation Highlights

- **90-day eligibility rule** — Prevents donors from donating again within 90 days of their last donation
- **`@Transactional` donation flow** — Ensures donation records and stock updates are committed atomically
- Handles common Spring/Maven deployment pitfalls: stale Eclipse deployments, missing class-level `@RequestMapping`, and phantom Maven dependencies

## Getting Started

1. Clone the repository
2. Import as a Maven project into Eclipse (or your preferred IDE)
3. Set up a MySQL database and update the connection details in the Hibernate/Spring XML configuration
4. Deploy to a Tomcat 9 server
5. Access the application at `/login?type=donor` or `/login?type=admin`

