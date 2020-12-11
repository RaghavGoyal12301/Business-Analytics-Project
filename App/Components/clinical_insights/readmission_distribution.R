readmission_distribution <- function(output) {
  output$readmission_distribution1 <- renderUI({
    div(
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = "num_procedures_plot1"),
        div(),
        plotOutput(outputId = "time_in_hospital_plot1"),
        div(),
        cellWidths = c("10%", "38%", "4%", "38%", "10%")
      ),
      br(),
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = "number_diagnoses_plot1"),
        div(),
        plotOutput(outputId = "num_medications_plot1"),
        div(),
        cellWidths = c("10%", "38%", "4%", "38%", "10%")
      ),
      br(),
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = "num_lab_procedures_plot1"),
        div(),
        cellWidths = c("10%", "80%", "10%")
      ),
      br(),
      br()
    )
  })

  output$readmission_distribution2 <- renderUI({
    div(fluidRow(
      column(3,
        align = "center",
        plotOutput(outputId = "num_procedures_plot2")
      ),
      br(),
      br(),
      column(3,
             align = "center",
             plotOutput(outputId = "time_in_hospital_plot2")),
      br(),
      br(),
      column(3,
             align = "center",
             plotOutput(outputId = "number_diagnoses_plot2")),
      br(),
      br(),
      column(3,
             align = "center",
             plotOutput(outputId = "num_medications_plot2")),

      br(),
      br(),
      column(3,
             align = "center",
             plotOutput(outputId = "num_lab_procedures_plot2")),
      br(),
      br()
    ))
  })
  return(output)
}