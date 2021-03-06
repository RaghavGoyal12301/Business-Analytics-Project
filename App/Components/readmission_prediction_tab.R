readmission_prediction_tab <- function(output) {
  output$readmission_prediction_tab <- renderUI({
    div(
      br(),
      sidebarPanel(
        h2("Patient Information"),
        br(),
        textInput(
          inputId = "name",
          label = "Name",
          value = "Enter Name"
        ),
        fluidRow(column(
          6,
          selectInput(
            inputId = "age",
            label = "Age",
            choices = c(
              "[0-40]",
              "[40-50]",
              "[50-60]",
              "[60-70]",
              "[70-80]",
              "[80-100]"
            ),
            selected = "[0-40]"
          )
        ),
        column(
          6,
          selectInput(
            inputId = "gender",
            label = "Gender",
            choices = c("Male", "Female"),
            selected = "Male"
          )

        )),

        selectInput(
          inputId = "race",
          label = "Race",
          choices = c(
            "AfricanAmerican",
            "Asian",
            "Caucasian",
            "Hispanic",
            "Other"
          ),
          selected = "AfricanAmerican"
        ),

        br(),
        br(),

        h2("Physical Information"),
        br(),
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
        )),
        br(),
        br()

      ),
      mainPanel(
        br(),
        h2("Patient Vitals"),
        br(),
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
            choices = c(
              "Diabetes",
              "Circulatory",
              "Respiratory",
              "Digestive",
              "Genitourinary",
              "Neoplasms",
              "Musculoskeletal",
              "Injury",
              "Other"
            ),
            selected = "Circulatory"
          )
        )),
        fluidRow(column(
          4,
          selectInput(
            inputId = "secondary_diagnosis",
            label = "Secondary Diagnosis",
            choices = c(
              "Diabetes",
              "Circulatory",
              "Respiratory",
              "Digestive",
              "Genitourinary",
              "Neoplasms",
              "Musculoskeletal",
              "Injury",
              "Other"
            ),
            selected = "Circulatory"
          )
        ),
        column(
          4,
          selectInput(
            inputId = "tertiary_diagnosis",
            label = "Tertiary Diagnosis",
            choices = c(
              "Diabetes",
              "Circulatory",
              "Respiratory",
              "Digestive",
              "Genitourinary",
              "Neoplasms",
              "Musculoskeletal",
              "Injury",
              "Other"
            ),
            selected = "Circulatory"
          )
        )),
        fluidRow(column(
          4,
          selectInput(
            inputId = "insulin",
            label = "Insulin",
            choices = c("Up",
                        "Down",
                        "Steady",
                        "No"),
            selected = "No"
          )
        )),
        br(),
        br(),

        fluidRow(column(
          4,
          actionButton("submit", "Predict", width = 200), offset = 3
        )),

        width = 8
      )
    )
  })
  return(output)
}