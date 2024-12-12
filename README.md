# Simple Spring Security Authentication Demonstration

## Project Overview

A simple Spring Boot MVC application demonstrating basic web security implementation using Spring Security, Thymeleaf, and authentication mechanisms.

https://github.com/user-attachments/assets/b9184010-e989-4d20-966f-15a4a066450a

## Features

- Basic authentication system
- Protected and public routes
- Login/Logout functionality
- User authentication with in-memory user management
- Thymeleaf integration for dynamic views

## Technologies Used

- Spring Boot
- Spring Security
- Thymeleaf
- Tailwind CSS Feather Icons (for styling)

## Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/example/securing_web/
│   │       ├── WebSecurityConfig.java        # Security configuration
│   │       ├── MvcConfig.java                # MVC Configuration
│   │       └── SecuringWebApplication.java   # Main application class
│   └── resources/
│       ├── templates/
│       │   ├── home.html                     # Public home page
│       │   ├── hello.html                    # Protected page
│       │   └── login.html                    # Login page
│       └── application.properties
```

## Key Configuration Components

### WebSecurityConfig

```java
@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeHttpRequests((requests) -> 
                requests
                    .requestMatchers("/", "/home").permitAll()
                    .anyRequest().authenticated()
            )
            .formLogin((form) -> 
                form
                    .loginPage("/login")
                    .permitAll()
            )
            .logout((logout) -> 
                logout.permitAll()
            );
        return http.build();
    }

    @Bean
    public UserDetailsService userDetailsService() {
        UserDetails user = User.withDefaultPasswordEncoder()
            .username("user")
            .password("password")
            .roles("USER")
            .build();
        return new InMemoryUserDetailsManager(user);
    }
}
```

## Security Flow

1. Public routes ("/", "/home") are accessible WITHOUT login
2. All other routes require authentication
3. Custom login page at "/login"
4. In-memory user authentication (user/password)

## Security Principles Demonstrated

- Route protection
- Authentication
- Login/Logout mechanisms
- User role management

## Running the Application

1. Clone the repository
```
git clone https://github.com/ProgrammerPratik/java-spring-security
cd java-spring-security
```
2. Ensure Java version 23 and Maven are installed (this specific project uses java 23)
3. Run `mvnw spring-boot:run` OR you can use any IDE like intellij to build and run project
4. Access at `http://localhost:8080`

## Default Login Credentials (can be changed)

- Username: `superman`
- Password: `password`

## Stuff Learned

- Understand Spring Security basics
- Implement authentication in Spring Boot
- Create protected and public routes
- Use Thymeleaf for dynamic views

## License

MIT License
