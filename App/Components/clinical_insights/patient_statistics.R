patient_statistics <- function(output) {
  output$patient_statistics1 <- renderUI({
    div(
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = "patients_race_plot1"),
        div(),
        plotOutput(outputId = "patient_gender_plot1"),
        div(),
        cellWidths = c("10%", "38%", "4%", "38%", "10%")
      ),
      br(),
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = "patient_age_plot1"),
        div(),
        plotOutput(outputId = "patient_AdmType_plot1"),
        div(),
        cellWidths = c("10%", "38%", "4%", "38%", "10%")
      ),
      br(),
      br()
    )
  })

  output$patient_statistics2 <- renderUI({
    div(fluidRow(
      br(),
      column(3,
        align = "center",
        plotOutput(outputId = "patients_race_plot2")
      ),
      br(),
      br(),
      column(3,
             align = "center",
             plotOutput(outputId = "patient_gender_plot2")),
      br(),
      br(),
      column(3,
             align = " center ",
             plotOutput(outputId = "patient_age_plot2")),
      br(),
      br(),
      column(3,
             align = " center ",
             plotOutput(outputId = "patient_AdmType_plot2")),
      br(),
      br()
    ))
  })
  return(output)
}
