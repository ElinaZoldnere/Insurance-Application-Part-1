# Insurance Application
This repository contains an insurance calculator application developed during a virtual internship as part of the
**JavaGuru 'Java 2 - Agile Web Development'** course.<br>
![JavaGuru](assets/JavaGuru.png)<br>
The project was built to apply various technologies in a practical Context while following an Agile development 
approach.<br>
The application is developed with Java Spring Boot and uses Gradle for building and dependency management.

## Overview
The insurance calculator application is a simple web service that calculates insurance premiums based on user
requests. The project focuses on building a robust easily modifiable design, implementing data persistence, REST APIs 
and a simple web interface. The aim was to explore the Spring ecosystem and become familiar with commonly used tools.

Development was done step-by-step in nearly 200 tasks, each addressing either the implementation of a specific
feature or a refactor to improve the codebase. Each task built on the previous work, allowing to observe the
application evolve over time. As the project progressed, some earlier design decisions required adjustment to meet
new requirements, leading to the necessity for refactoring or redesigning parts of the system.

## Key Features
- Spring Boot application, build and dependency management with Gradle.
- Implemented business logic for calculating several types of insurance premiums.
- Version v2 backward compatibility with version v1.
- Secured REST API endpoints for interacting with the application.
- Simple web interface (Thymeleaf) for user interaction.
- Authentication and authorization with Spring Security Basic Auth.
- Data persistence using MySQL database and migrations with Liquibase.
- JAR, publishing and scheduled XML export.

## Good Practices
- Adoption of Hexagonal Architecture Principles for version v2 application design, with an emphasis on decoupling the 
core business logic from external concerns like the user interface.
- Converter (adapter) classes for transferring data between user interface layer and core layer.
- Immutable Data Transfer Objects (DTOs) for data exchange (Java Records).
- SOLID principles for flexibility and maintainability.
- Inversion of Control (IoC) for decoupling object creation and management from business logic.
- Unit, integration, acceptance testing with good coverage, and simple load testing.

## Technologies Used
The project utilizes the following core technologies:
- Java, Spring, Spring Boot, Gradle, JPA, JDBC, ORM, Hibernate, MySQL, H2, Liquibase, JUnit, Mockito, MVC, HTML, 
Thymeleaf, IntelliJ IDEA, Git, GitHub, CI, Lombok, Postman, OpenAPI, logging, Spring-based caching,
scheduled jobs, XML exports, JAR/WAR packaging, publishing, and handling JSON data formats, among other features.

In addition to the core requirements, I explored and incorporated following technologies based on my personal interest:

- Spring Security (Basic Authentication) for REST endpoints, Java Records for DTOs, Parameterized and Dynamic Tests, 
Template Method Pattern, Aspect-Oriented Programming (AspectJ) for logging, Caffeine for caching.

## Project Overall Structure
The codebase consists of two versions of the application, named v1 and v2, each implementing a distinct architectural 
approach. 
- v1: This version is based on a simple layered architecture, where the service layer depends directly on the user 
interface layer. During the development process, new user interface requirements emerged, revealing that the initial 
design lacked the flexibility needed to accommodate these changes without modifying core business logic.

- v2: To address this issue, v2 was developed with elements of hexagonal (ports and adapters) architecture. In this 
design, the core business logic is decoupled from the user interface layer by using converter classes. Data is 
transferred between the interface layer and the core logic via converter classes, which transform the incoming data into 
immutable Data Transfer Objects (DTOs) for use within the core layer, and then convert the core layer’s output back 
into a format suitable for the user interface.

Communication between different core modules is done through abstract interfaces, ensuring loose coupling between 
different parts of the core logic.
Communication between the core layer and the user interface layer is also done through abstract interfaces, maintaining 
separation between the core business logic and the user interface.
Communication between the core layer and the database is managed via repository interfaces with default Spring Data
JPA implementations.

The v2 version is designed to ensure backward compatibility with v1, allowing to use both versions of user interface.

## Version v2 Model with C4 Component Diagram
![v2_C4_model_component_view](v2/documentation/c4_diagrams/v2_C4_model_component_view.png)

## Future Perspectives
The course contains also the second part I am enrolled in, which incorporates such technologies as microservices, 
Docker, RabbitMQ, Elastic, Prometheus, Grafana and more.

Additionally, I am planning to update outdated or deprecated dependencies, including:
- Migration from JDK 18 to JDK 21.
- Migration from Spring Boot 2.7.5. to Spring Boot 3.3.1.
- Migration from java.util.Date to java.time.