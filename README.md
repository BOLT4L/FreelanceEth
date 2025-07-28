# Freelanceth - Job Searching Mobile App
# Overview
Freelanceth is a mobile application designed to connect job seekers with freelance opportunities specifically within Ethiopia. It aims to provide a user-friendly platform for individuals to find relevant jobs and for businesses/clients to post projects and find suitable freelancers. This project highlights mobile application development with a focus on a local market.

# Features
Freelanceth includes key functionalities for both job seekers and clients:

User Registration & Profiles: Create and manage profiles for both freelancers and clients.

Job Posting (for Clients): Clients can post new freelance projects with details, requirements, and budget.

Job Search & Filtering (for Freelancers): Freelancers can browse available jobs, filter by category, skill, location, and other criteria.

Application Management: Freelancers can apply for jobs, and clients can review applications.

Notifications: Real-time (or near real-time) notifications for new job postings, application updates, etc.

Messaging (Basic): Simple in-app messaging between clients and freelancers.

Location-Based Search: Focus on opportunities within Ethiopia.

# Technologies Used
Freelanceth is built using a hybrid mobile development framework and a robust backend:

# Frontend (Mobile App):

Flutter: Google's UI toolkit for building natively compiled applications for mobile, web, and desktop from a single codebase.

# Backend (API):

PHP: Used for server-side logic, API endpoints, and database interactions.

# Database:

MySQL: A popular open-source relational database management system.

# API Communication:

HTTP/HTTPS requests for communication between Flutter (frontend) and PHP (backend).

# Getting Started
Follow these instructions to set up and run Freelanceth on your local development environment.

# Prerequisites
Flutter SDK:

Install Flutter

PHP: PHP 7.4+ (or compatible version) installed on your system.

Composer: PHP dependency manager.

Install Composer

MySQL Server: A running MySQL instance.

Web Server (e.g., Apache/Nginx): Configured to serve PHP applications. For local development, XAMPP, WAMP, or MAMP are common choices that bundle Apache and MySQL.

# Installation Steps
1. Backend Setup (PHP)
Clone the Backend Repository:

git clone https://github.com/your-username/Freelanceth-Backend.git # Replace with your actual backend repo URL
cd Freelanceth-Backend

Otherwise, navigate to your backend project directory.

Install PHP Dependencies:

composer install

# Database Configuration:

Create a MySQL database (e.g., freelanceth_db).

Import your database schema (e.g., from an .sql file) into this new database.

Configure your PHP application's database connection settings (usually in a config.php or .env file) with your database name, username, and password.

# Web Server Configuration:

Configure your web server (Apache, Nginx, or XAMPP/WAMP/MAMP) to serve the public directory of your PHP backend project. This typically involves setting up a virtual host or placing the project in your web server's htdocs (or equivalent) directory.

Ensure your web server is running.

Test your backend API by accessing a known endpoint in your browser (e.g., http://localhost/freelanceth-backend/api/jobs).

2. Frontend Setup (Flutter)
Clone the Frontend Repository:

git clone https://github.com/your-username/Freelanceth-Frontend.git # Replace with your actual frontend repo URL
cd Freelanceth-Frontend

Otherwise, navigate to your frontend project directory.

# Install Flutter Dependencies:

flutter pub get

Configure Backend API URL:

Open your Flutter project's main configuration file (e.g., lib/config.dart or similar).

Update the API_BASE_URL to point to your local PHP backend (e.g., http://10.0.2.2/freelanceth-backend/api for Android emulator, or http://localhost/freelanceth-backend/api for web/desktop).

# Running the Application
Ensure Backend is Running: Make sure your PHP backend is accessible via your web server.

Run Flutter App:

Connect a mobile device, or start an Android Emulator/iOS Simulator.

From the Freelanceth-Frontend directory, run:

flutter run

The mobile application should launch on your selected device/emulator.


# Usage
Launch App: Start the Freelanceth mobile app.

Login/Register: Create a new account or log in with existing credentials.

Browse Jobs: Explore available freelance opportunities.

Post Jobs: (For clients) Create and publish new project listings.

Manage Applications: Track job applications or review freelancer submissions.


# Contact
If you have any questions or suggestions regarding Freelanceth, please feel free to reach out.
