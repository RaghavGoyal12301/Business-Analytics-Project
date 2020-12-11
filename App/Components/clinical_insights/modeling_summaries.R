modeling_summaries <- function(output) {
  output$modeling_summaries1 <- renderUI({
    div(
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = "variable_importance1"),
        div(),
        plotOutput(outputId = "rf_model42_plot1"),
        div(),
        cellWidths = c("5%", "53%", "4%", "33%", "5%")
      ),
      br(),
      br()
    )
  })

  output$modeling_summaries2 <- renderUI({
    div(fluidRow(
      br(),
      column(3,
        align = "center",
        plotOutput(outputId = "variable_importance2")
      ),
      br(),
      br(),
      column(3,
             align = "center",
             plotOutput(outputId = "rf_model42_plot2")),
      br(),
      br()
    ))
  })
  return(output)
}