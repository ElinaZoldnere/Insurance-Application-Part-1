workspace {

    model {
        user = person "User" "person who buys insurance"

        broker = person "Broker" "registered external user"

        employee = person "Employee" "registered internal user"

        application = softwareSystem "Application" "Insurance software system" {
            apiApp = container "API/Web Application" "handles business logic and provides REST API & web" "Java and Spring Boot" {
                webController = component "Web Controller" "handles web requests" "Java, Spring Boot, Thymeleaf"
                restControllerExt = component "REST Controller (external)" "handles external REST requests" "Java and Spring Boot"
                restControllerInt = component "REST Controller (internal)" "handles internal REST requests" "Java and Sring Boot"
                underwriting = component "Underwriting service" "handles business logic calculations" "Java and Spring Boot"
                calculateService = component "Calculate Agreement service" "handles agreement generation" "Java and Spring Boot"
                getService = component "Get agreement by UUID service" "retrieves agreement data by UUID""Java and Spring Boot"
                exportService = component "Export service" "exports agreement data" "Java and Spring Boot"
                validation = component "Validation" "handles data validation" "Java and Spring Boot"
                repositories = component "Repository classes" "handles access to rates and coefficients" "Java and Spring Boot"
                entities = component "Repository entity classes" "handles access to agreement data" "Java and Spring Boot"
                jobs = component "Scheduled jobs" "performs jobs" "Java and Spring Boot"
            }
            database = container "Database" "stores agreement data, rates and coefficients" "MySQL" "Database"
        }

        user -> webController "visits web page (unauthenticated)"
        broker -> restControllerExt "makes API calls (POST, authenticated)"
        employee -> restControllerExt "makes API calls (POST, authenticated)"
        employee -> restControllerInt "makes API calls (GET, authorized)"

        // additional relationship for correct Context and Container view
        employee -> application "makes API calls (GET, authorized)"
        employee -> apiApp "makes API calls (GET, authorized)"

        webController -> calculateService "uses"
        restControllerExt -> calculateService "uses"
        restControllerInt -> getService "uses"

        calculateService -> validation "uses"
        calculateService -> underwriting "uses"
        underwriting -> repositories "uses"

        getService -> validation "uses"
        getService -> entities "uses"

        jobs -> exportService "uses"
        exportService -> validation "uses"
        exportService -> entities "uses"

        entities -> database "reads from and writes to"
        repositories -> database "reads from"
    }

    views {
        systemContext application "Application" {
            include *
            autoLayout lr
        }

        container application "Containers" {
            include *
            autoLayout lr
        }

        component apiApp "API_Web_application" {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }

            element "Software System" {
                background #1168bd
                color #ffffff
            }

            element "Container" {
                background #438dd5
                color #ffffff
            }

            element "Component" {
                background #85bb65
                color #ffffff
            }

            element "Database" {
                shape cylinder
                background #f5da81
                color #000000
            }
        }
    }
}