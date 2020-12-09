library(shiny)
library(shinyalert)


# Define UI for application that draws a histogram
ui <- fluidPage(useShinyalert(),
                navbarPage(
                    "Diabetes Prediction",
                    tabPanel(
                        "Diabetes History",
                        
                        
                        # Side Panel - General Information
                        sidebarPanel(
                            h2("General Information"),
                            textInput(
                                inputId = "name",
                                label = "Name",
                                value = "Enter Name"
                            ),
                            fluidRow(column(
                                6,
                                numericInput(
                                    inputId = "age",
                                    label = "Age",
                                    value = "0",
                                    min = 1,
                                    max = 120
                                )
                            ),
                            column(
                                6,
                                selectInput(
                                    inputId = "gender",
                                    label = "Gender",
                                    choices = list("Male" = 1, "Female" = 2),
                                    selected = 1
                                )
                                
                            )),
                            
                            selectInput(
                                inputId = "race",
                                label = "Race",
                                choices = list(
                                    "American" = 1,
                                    "African-American" = 2,
                                    "Asian" = 3,
                                    "Caucasian" = 4,
                                    "Hispanic" = 5,
                                    "Other" = 6
                                ),
                                selected = 1
                            ),
                            
                            h2("Physical Information"),
                            fluidRow(column(
                                6,
                                numericInput(
                                    inputId = "height",
                                    label = "Height (in cm)",
                                    value = 0,
                                    min = 1,
                                    max = 250
                                )
                            ),
                            column(
                                6,
                                numericInput(
                                    inputId = "weight",
                                    label = "Weight (in kg)",
                                    value = 0,
                                    min = 1,
                                    max = 250
                                )
                            ))
                            
                        ),
                        
                        
                        
                        # Main Panel - Important Data
                        mainPanel(
                            h2("Diabetes Data"),
                            fluidRow(column(
                                4,
                                numericInput(
                                    inputId = "time_in_hospital",
                                    label = "Time in Hospital (in Days)",
                                    value = 0,
                                    min = 0,
                                    max = 30
                                )
                            ),
                            column(
                                4,
                                numericInput(
                                    inputId = "num_procedures",
                                    label = "No. of Procedures",
                                    value = 0,
                                    min = 0,
                                    max = 20
                                )
                            )),
                            fluidRow(column(
                                4,
                                numericInput(
                                    inputId = "number_diagnoses",
                                    label = "No. of Diagnoses",
                                    value = 0,
                                    min = 0,
                                    max = 30
                                )
                            ),
                            column(
                                4,
                                numericInput(
                                    inputId = "num_lab_procedures",
                                    label = "No. of Lab Procedures",
                                    value = 0,
                                    min = 0,
                                    max = 20
                                )
                            )),
                            fluidRow(column(
                                4,
                                numericInput(
                                    inputId = "num_medications",
                                    label = "No. of Medications",
                                    value = 0,
                                    min = 0,
                                    max = 30
                                )
                            ),
                            column(
                                4,
                                selectInput(
                                    inputId = "primary_diagnosis",
                                    label = "Primary Diagnosis",
                                    choices = list(
                                        "Circulatory" = 1,
                                        "Respiratory" = 2,
                                        "Digestive" = 3,
                                        "Genitourinary" = 4,
                                        "Neoplasms" = 5,
                                        "Musculoskeletal" = 6,
                                        "Injury" = 7,
                                        "Other" = 8
                                    ),
                                    selected = 1
                                )
                            ))
                            ,
                            fluidRow(column(
                                4,
                                selectInput(
                                    inputId = "secondary_diagnosis",
                                    label = "Secondary Diagnosis",
                                    choices = list(
                                        "Circulatory" = 1,
                                        "Respiratory" = 2,
                                        "Digestive" = 3,
                                        "Genitourinary" = 4,
                                        "Neoplasms" = 5,
                                        "Musculoskeletal" = 6,
                                        "Injury" = 7,
                                        "Other" = 8
                                    ),
                                    selected = 1
                                )
                            ),
                            column(
                                4,
                                selectInput(
                                    inputId = "tertiary_diagnosis",
                                    label = "Tertiary Diagnosis",
                                    choices = list(
                                        "Circulatory" = 1,
                                        "Respiratory" = 2,
                                        "Digestive" = 3,
                                        "Genitourinary" = 4,
                                        "Neoplasms" = 5,
                                        "Musculoskeletal" = 6,
                                        "Injury" = 7,
                                        "Other" = 8
                                    ),
                                    selected = 1
                                )
                            ))
                            ,
                            fluidRow(column(
                                4,
                                selectInput(
                                    inputId = "insulin",
                                    label = "Insulin",
                                    choices = list(
                                        "Up" = 1,
                                        "Down" = 2,
                                        "Steady" = 3,
                                        "No" = 4
                                    ),
                                    selected = 4
                                )
                            )),
                            fluidRow(column(4,
                                            actionButton(
                                                "submit", "Predict", width = 200
                                            ), offset = 3)
                                     
                                     )
                            ,
                            
                            width = 8
                        ),
                        
                    )
                ))



# Define server logic required to draw a histogram
server <- function(input, output, session) {
    observeEvent(input$submit, {
        shinyalert(title = "Congratulations",
                   text = "You are not going to be readmitted",
                   type = "success")
    })
    
    
    
}

# Run the application
shinyApp(ui = ui, server = server)
