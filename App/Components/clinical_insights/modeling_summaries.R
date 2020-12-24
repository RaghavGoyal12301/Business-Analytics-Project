modeling_summaries <- function(output) {
  output$modeling_summaries1 <- renderUI({
    div(
      br(),
      # splitLayout(
      #   div(),
      #   imageOutput(outputId = "variable_importance1"),
      #   div(),
      #   imageOutput(outputId = "rf_model42_plot1"),
      #   div(),
      #   cellWidths = c("5%", "53%", "4%", "33%", "5%")
      # ),
      # splitLayout(
      #   div(),
      #   imageOutput(outputId = "variable_importance1"),
      #   div(),
      #   cellWidths = c("10%", "80%", "10%")
      # ),
      imageOutput(outputId = "variable_importance1"),
      br(),
      br()
    )
  })

  output$modeling_summaries2 <- renderUI({
    div(fluidRow(
      br(),
      column(3,
        align = "center",
        imageOutput(outputId = "variable_importance2")
      ),
      br(),
      br(),
      # column(3,
      #        align = "center",
      #        imageOutput(outputId = "rf_model42_plot2")),
      # br(),
      # br()
    ))
  })
  return(output)
}