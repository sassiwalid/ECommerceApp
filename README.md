# E-Commerce App

An e-commerce application built with Swift, Vapor, SwiftUI, and MySQL. This project includes both a backend API and a frontend iOS application, providing functionalities such as product listing, user management, shopping cart operations, and order processing.

## Table of Contents

1. [Introduction](#introduction)
2. [Features](#features)
3. [Technologies Used](#technologies-used)
4. [Architecture](#architecture)
5. [Installation](#installation)
   - [Prerequisites](#prerequisites)
   - [Installing MySQL](#installing-mysql)
     - [On macOS](#on-macos)
     - [On Linux](#on-linux)
   - [Installing Vapor](#installing-vapor)
   - [Backend Setup](#backend-setup)
6. [License](#license)

## Introduction

This project is an e-commerce application that allows users to browse products, add them to a shopping cart, and proceed to checkout. The backend is built using Vapor, a server-side Swift web framework, and the frontend is an iOS app developed with SwiftUI.

## Features

- **User Authentication**: Sign up and log in users.
- **Product Listing**: View a list of available products with details.
- **Shopping Cart**: Add, view, and remove items in the cart.
- **Order Processing**: Place orders and view order history.
- **Database Integration**: Persistent data storage with MySQL.

## Technologies Used

- **Swift**: Programming language for both backend and frontend.
- **Vapor**: Server-side Swift web framework.
- **SwiftUI**: Modern UI framework for iOS.
- **MySQL**: Relational database management system.
- **Fluent**: ORM for database interactions in Vapor.
- **Postman**: API development and testing.

## Architecture

The project follows a client-server architecture:

- **Backend API**: Handles data storage, business logic, and provides RESTful endpoints.
- **iOS App**: Provides a user interface for interacting with backend services.

## Installation

### Prerequisites

- **Xcode** (version 16 or later)
- **Swift 5.9** or later
- **Homebrew** (for macOS)
- **Terminal** access

### Installing MySQL

#### On macOS

1. **Download MySQL Community Server**

   - Go to the [MySQL Community Downloads](https://dev.mysql.com/downloads/mysql/) page.
   - Select the macOS DMG Archive version suitable for your system.

2. **Install MySQL**

   - Open the downloaded `.dmg` file and run the installer.
   - Follow the installation prompts.
   - Set a strong root password when prompted.
     - **Note**: Remember this password; you'll need it later.

3. **Start MySQL Server**

   - Open **System Preferences**.
   - Click on **MySQL**.
   - Click **Start MySQL Server**.

4. **Add MySQL to PATH (Optional)**

   ```bash
   echo 'export PATH="/usr/local/mysql/bin:$PATH"' >> ~/.bash_profile
   source ~/.bash_profile

5.	**Verify MySQL Installation**
   Exécutez la commande suivante :
   ```bash
   mysql -u root -p
   ```

Enter the root password you set earlier.
	•	If you see the mysql> prompt, the installation was successful.
 
6. **Installing Vapor**
 
 ```bash
    brew install vapor
 ```
Verify Vapor Installation
```bash
    vapor --version
 ```
•	You should see the version number of Vapor installed.
7. **Backend Setup**
	A.	Clone the Repository
   ```bash
   git clone https://github.com/sassiwalid/ecommerce-app.git
   cd ecommerce-app/Backend
   ```
  B. Install Dependencies
   ```bash
   swift package resolve
   ```
  C. Configure the Database
  ```bash
   mysql -u root -p
   CREATE DATABASE ecommerce_db;
   EXIT;
   ```
  Update Database Credentials
  Open configure.swift in your project and update with your MySQL credentials:
  ```swift
   app.databases.use(.mysql(
    hostname: "localhost",
    username: "root",
    password: "your_mysql_root_password",
    database: "ecommerce_db"
), as: .mysql)
   ```
D. Run Migrations
```bash
   swift run Run migrate
   ```
E. Start the Server
```bash
   swift run Run serve
   ```
The server should now be running at http://localhost:8080.

License

This project is licensed under the MIT License.
