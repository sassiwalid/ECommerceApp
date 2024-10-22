# E-Commerce App

An e-commerce application built with Swift, Vapor, SwiftUI, and MySQL. This project includes both a backend API and a frontend iOS application, providing functionalities such as product listing, user management, shopping cart operations, and order processing.

## Table of Contents

1. [Introduction](#1-introduction)
2. [Features](#2-features)
3. [Technologies Used](#3-technologies-used)
4. [Architecture](#4-architecture)
5. [Installation](#5-installation)
   - [5.1. Prerequisites](#51-prerequisites)
   - [5.2. Installing MySQL](#52-installing-mysql)
     - [5.2.1. On macOS](#521-on-macos)
     - [5.2.2. On Linux](#522-on-linux)
   - [5.3. Installing Vapor](#53-installing-vapor)
   - [5.4. Backend Setup](#54-backend-setup)
   - [5.5. iOS App Setup](#55-ios-app-setup)
6. [Usage](#6-usage)
   - [6.1. Creating a User](#61-creating-a-user)
   - [6.2. Adding a Product](#62-adding-a-product)
   - [6.3. Adding Product to Basket](#63-adding-product-to-basket)
   - [6.4. Viewing the Basket](#64-viewing-the-basket)
   - [6.5. Removing Item from Basket](#65-removing-item-from-basket)
7. [API Endpoints](#7-api-endpoints)
   - [7.1. User](#71-user)
   - [7.2. Products](#72-products)
   - [7.3. Basket](#73-basket)
8. [Contributing](#8-contributing)
9. [License](#9-license)
10. [Acknowledgments](#10-acknowledgments)

## 1. Introduction

This project is an e-commerce application that allows users to browse products, add them to a shopping cart, and proceed to checkout. The backend is built using Vapor, a server-side Swift web framework, and the frontend is an iOS app developed with SwiftUI.

## 2. Features

- **User Authentication**: Sign up and log in users.
- **Product Listing**: View a list of available products with details.
- **Shopping Cart**: Add, view, and remove items in the cart.
- **Order Processing**: Place orders and view order history.
- **Database Integration**: Persistent data storage with MySQL.

## 3. Technologies Used

- **Swift**: Programming language for both backend and frontend.
- **Vapor**: Server-side Swift web framework.
- **SwiftUI**: Modern UI framework for iOS.
- **MySQL**: Relational database management system.
- **Fluent**: ORM for database interactions in Vapor.
- **Postman**: API development and testing.

## 4. Architecture

The project follows a client-server architecture:

- **Backend API**: Handles data storage, business logic, and provides RESTful endpoints.
- **iOS App**: Provides a user interface for interacting with backend services.

## 5. Installation

### 5.1. Prerequisites

Before you begin, ensure you have met the following requirements:

- **Operating System**: macOS or Linux
- **Xcode**: Version 12 or later (for iOS app development)
- **Swift**: Version 5.4 or later
- **Homebrew**: For installing dependencies on macOS
- **Terminal**: Access to the command-line interface

### 5.2. Installing MySQL

Follow these steps to install MySQL on your system.

#### 5.2.1. On macOS

**Step 1: Download MySQL Community Server**

- Visit the [MySQL Community Downloads](https://dev.mysql.com/downloads/mysql/) page.
- Select the macOS DMG Archive version suitable for your system.

**Step 2: Install MySQL**

- Open the downloaded `.dmg` file and run the installer.
- Follow the installation prompts.
- Set a strong root password when prompted.
  - **Note**: Remember this password; you'll need it later.

**Step 3: Start MySQL Server**

- Open **System Preferences**.
- Click on **MySQL**.
- Click **Start MySQL Server**.

**Step 4: Add MySQL to PATH (Optional)**

Open Terminal and run:

```bash
echo 'export PATH="/usr/local/mysql/bin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
