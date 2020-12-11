data_analysis <- function(output) {
  output$data_analysis1 <- renderUI({
    div(
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = "corr_heatmap1"),
        div(),
        imageOutput(outputId = "corr_matrix1"),
        div(),
        cellWidths = c("10%", "38%", "4%", "38%", "10%")
      ),
      br(),
      br(),
      splitLayout(
        div(),
        plotOutput(outputId = ""),
        div(),
        cellWidths = c("10%", "38%", "4%", "38%", "10%")
      ),
      br(),
      br()
    )
  })

  output$data_analysis2 <- renderUI({
    div(fluidRow(
      br(),
      column(3,
        align = "center",
        plotOutput(outputId = "corr_heatmap2")
      ),
      br(),
      br(),
      column(3,
             align = "center",
             imageOutput(outputId = "corr_matrix2")),
      br(),
      br(),
      column(3,
             align = "center",
             plotOutput(outputId = "")),
      br(),
      br()
    ))
  })
  return(output)
}