# ASP.NET Core Dapper Demo

## Overview
This project is a simple web application built using ASP.NET Core and Dapper. It allows users to manage products, including adding, editing, and deleting products. The data is stored in a SQL Server database.

## Functionality
- Display a list of products and their prices on the homepage.
- Add new products with their prices.
- Edit existing product details.
- Delete products from the database.

## Project Structure
The project follows an n-layer architecture with separate layers for presentation, business logic, and data access.

## Database Setup
To set up the database, execute the provided SQL script (`DatabaseScript.sql`) to create the necessary tables, stored procedures, and sample data.

## Instructions to Run the Project
1. Install .NET Core 6 if you haven't already.
2. Clone this repository.
3. Open the solution in Visual Studio or your preferred IDE.
4. Update the connection string in `appsettings.json` to point to your SQL Server instance.
5. Build and run the project.

## Folder Structure
- `Controllers`: Contains ASP.NET Core controller classes.
- `Views`: Contains Razor views for the user interface.
- `Models`: Contains model classes representing entities in the application.
- `Respositories`: Contains data access logic using Dapper.
-  `DB Folder`: Contains Actual database File , and also Script with Table, Store procedure and data.

## How to Use
1. Navigate to the homepage to view the list of products.
2. Click on "Add Product" to add a new product.
3. Click on "Edit" next to a product to edit its details.
4. Click on "Delete" next to a product to remove it from the database.

## Deployment
To deploy the application to a hosting environment, publish the project and ensure that the necessary configurations are set up for the deployment environment.

