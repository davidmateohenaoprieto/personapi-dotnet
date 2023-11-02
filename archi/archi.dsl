workspace {
    
    !identifiers hierarchical
    
    model {
        user = person "User Consumer"
    
        softwareSystem = softwareSystem "C# CRUD System" {

            // webapp = container "Web Client"
            webapp = container "Web Application" 
        


            serviceGroup = group "Service" {
                service = container "MVC Service C#" {
                    tags "Service Consumer" "Service C#"
                    persona = component "persona" "CRUD"
                    profesion = component "profesion" "CRUD"
                    telefono = component "telefono" "CRUD"
                    estudios = component "estudios" "CRUD"
                }
                database = container "SQL Server Databse" {
                    tags "Service Consumer" "Database"
                    service -> this "Reads from and writes to"
                }
            }





            user -> webapp "Uses" "Browser HTTPS"
            webapp -> service "Uses" "HTTPS"
            service.persona -> database "CRUD"
            service.profesion -> database "CRUD"
            service.telefono -> database "CRUD"
            service.estudios -> database "CRUD"
        }
    }
    
    views {

        systemLandscape softwareSystem "SystemLandscape" {
            include *
            autolayout
        }
        container softwareSystem "Containers_All" {
            include *
            autolayout
        }

        component softwareSystem.service "componets" {
            include *
            autolayout lr
        }
 

        styles {
            element "Person" {
                shape Person
            }

            element "Web Client" {
                shape WebBrowser
            }
            element "Service C#" {
                shape Box
            }
            element "Database" {
                shape cylinder
            }
            element "Service Consumer" {
                background #DD8BFE
            }
            
        }

    }

}