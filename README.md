# Laptop Shop

A laptop e-commerce web application built with Spring Boot featuring product, order, and user management.

## Technologies Used

- **Backend**: Spring Boot 3.2.5
- **Database**: MySQL 8.0
- **Security**: Spring Security 6.x
- **View Engine**: JSP with JSTL
- **ORM**: Spring Data JPA with Hibernate 6.x
- **Session**: Spring Session JDBC
- **Validation**: Spring Boot Validation
- **Build Tool**: Maven
- **Java Version**: 17

## Key Features

### Admin
- Product management (create, update, delete)
- User management
- Order management
- Dashboard with statistics

### Client
- Browse product catalog
- Search and filter products
- Add products to cart
- Place orders
- Manage personal profile

## System Requirements

- Java 17+
- MySQL 8.0+
- Maven 3.6+

## Installation

### 1. Clone repository
```bash
git clone <repository-url>
cd laptopshop
```

### 2. Database setup
Create MySQL database:
```sql
CREATE DATABASE laptopshop;
```

### 3. Configure application.properties
Update database information in `src/main/resources/application.properties`:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/laptopshop
spring.datasource.username=your_username
spring.datasource.password=your_password
```

### 4. Install dependencies
```bash
./mvnw clean install
```

### 5. Run the application
```bash
./mvnw spring-boot:run
```

Or:
```bash
mvn spring-boot:run
```

## Access Application

- **URL**: http://localhost:9090
- **Admin Panel**: http://localhost:9090/admin
- **Client**: http://localhost:9090

## Project Structure

```
src/main/java/com/khanh/laptopshop/
├── config/              # Security, WebMVC configuration
├── controller/          # Controllers
│   ├── admin/          # Admin controllers
│   └── client/         # Client controllers
├── domain/             # Entity classes
│   └── dto/           # Data Transfer Objects
├── repository/         # JPA Repositories
└── service/           # Business logic
    ├── specification/ # JPA Specifications
    └── validator/     # Custom validators
```

## Security Features

- Spring Security authentication
- Role-based authorization (USER, ADMIN)
- JDBC session management
- Password validation
- CSRF protection

## File Upload

- Product image upload support
- File size limit: 50MB (configurable)
- Supported formats: JPG, PNG, GIF
- Storage in `src/main/webapp/resources/images/` directory
- Automatic file validation

## Database Schema

Main entities used in the application:
- **User**: User information
- **Role**: User roles
- **Product**: Products
- **Cart**: Shopping cart
- **CartDetail**: Cart details
- **Order**: Orders
- **OrderDetail**: Order details

## Development

### Run in development mode
```bash
./mvnw spring-boot:run -Dspring-boot.run.profiles=dev
```

### Build for production
```bash
./mvnw clean package
java -jar target/laptopshop-0.0.1-SNAPSHOT.jar
```

## Logging

- Spring Security debug enabled
- JPA SQL queries displayed in console

## Session Management

- Session timeout: 30 minutes
- Sessions stored in database
- Automatic session table creation on startup
