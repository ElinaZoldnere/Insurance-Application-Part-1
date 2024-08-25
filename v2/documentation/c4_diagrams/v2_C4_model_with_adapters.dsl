workspace {

    model {
        userv1 = person "User(v1)" "person who buys insurance using version v1" "Person v1"
        brokerv1 = person "Broker(v1)" "registered external user using version v1" "Person v1"
        userv2 = person "User(v2)" "person who buys insurance using version v2" "Person v2"
        brokerv2 = person "Broker(v2)" "registered external user using version v2" "Person v2"
        employee = person "Employee" "registered internal user using version v2" "Person v2"

        application = softwareSystem "Application v2 version" "Insurance software system" {
            apiApp = container "API/Web Application" "handles business logic and provides REST API & web" "Java and Spring Boot" {
                webControllerv1 = component "Web Controller v1" "handles web requests v1" "Java, Spring Boot, Thymeleaf" "Controller"
                webControllerv2 = component "Web Controller v2" "handles web requests v2" "Java, Spring Boot, Thymeleaf" "Controller"
                restControllerv1 = component "REST Controller v1" "handles REST requests v1" "Java and Spring Boot" "Controller"
                restControllerv2 = component "REST Controller v2" "handles REST requests v2" "Java and Spring Boot" "Controller"
                restControllerGet = component "REST Controller (internal/GET)" "handles internal REST GET requests" "Java and Spring Boot" "Controller"

                adapterv1 = component "Adapter - v1 DTO converter and Command" "Converts v1 DTOs to core commands" "Java and Spring Boot" "Adapter"
                adapterv2 = component "Adapter - v2 DTO converter and Command" "Converts v2 DTOs to core commands" "Java and Spring Boot" "Adapter"
                adapterGet = component "Adapter - Internal/GET DTO converter and Command" "Converts internal DTOs to core commands" "Java and Spring Boot" "Adapter"

                underwriting = component "Underwriting service" "handles business logic calculations" "Java and Spring Boot"
                validation = component "Validation" "handles data validation" "Java and Spring Boot"
                calculateService = component "Calculate Agreement service" "handles agreement generation" "Java and Spring Boot"
                entityWriter = component "Entity writer" "handles adreement data writing into database" "Java and Spring "Boot"
                getService = component "Get agreement by UUID service" "retrieves agreement data by UUID""Java and Spring Boot"
                exportService = component "Export service" "exports agreement data" "Java and Spring Boot"
                repositories = component "Repository Interfaces" "handles access to rates and coefficients" "Java and Spring Boot" "Repository"
                entities = component "Repository entity Interfaces" "handles access to agreement data" "Java and Spring Boot" "Repository"
                jobs = component "Scheduled jobs" "performs jobs" "Java and Spring Boot"
            }
            database = container "Database" "stores agreement data, rates and coefficients" "MySQL" "Database"
        }

        userv1 -> webControllerv1 "visits web page v1 (unauthenticated)"
        userv2 -> webControllerv2 "visits web page v2 (unauthenticated)"
        brokerv1 -> restControllerv1 "makes API calls v1 (POST, authenticated)"
        brokerv2 -> restControllerv2 "makes API calls v2 (POST, authenticated)"
        employee -> restControllerv2 "makes API calls v2 (POST, authenticated)"
        employee -> restControllerGet "makes API calls (GET, authorized)"

        // additional relationship for correct Context and Container view
        employee -> application "makes API calls (GET, authorized)"
        employee -> apiApp "makes API calls (GET, authorized)"

        webControllerv1 -> adapterv1 "uses"
        webControllerv2 -> adapterv2 "uses"
        restControllerv1 -> adapterv1 "uses"
        restControllerv2 -> adapterv2 "uses"
        restControllerGet -> adapterGet "uses"

        adapterv1 -> calculateService "uses"
        adapterv2 -> calculateService "uses"
        adapterGet -> getService "uses"

        calculateService -> validation "uses"
        validation -> repositories "uses"
        validation -> entities "uses"
        calculateService -> underwriting "uses"
        calculateService -> entityWriter "uses"
        entityWriter -> entities "uses"
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
        systemContext application "Application_v2_version" {
            include *
            autoLayout lr
        }

        container application "Containers" {
            include *
            autoLayout lr
        }

        component apiApp "API_Web_application" {
            include *
            autoLayout lr
        }

        styles {
            element "Person v1" {
                shape person
                background #4a647a
                color #ffffff
            }

            element "Person v2" {
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

            element "Adapter" {
                background #f8b38e
                color #000000
            }

            element "Repository" {
                background #ffd166
                color #000000
            }

            element "Controller" {
                background #bfa2db
                color #ffffff
            }
        }
    }
}