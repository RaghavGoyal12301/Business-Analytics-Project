source(file.path(getwd(), "Assets/load_libraries.R"))


# Define UI for application that draws a histogram
ui <- fluidPage(useShinyjs(),
  theme = shinytheme("flatly"),
  useShinyalert(),
  navbarPage(
    "Medical Diagnosis for Diabetes",
    tabPanel("Readmission Prediction",
             div(
               id = "readmission_prediction_tab", uiOutput("readmission_prediction_tab")
             )),
    tabPanel(
      "Clinical Insights",
      tabsetPanel(
        type = "tabs",
        tabPanel(
          "Patient Statistics",
          br(),
          div(id = "patient_statistics2", uiOutput("patient_statistics2")),
          div(id = "patient_statistics1", uiOutput("patient_statistics1"))
        ),
        tabPanel("Re-admission Distribution",
          br(),
          div(id = "readmission_distribution2", uiOutput("readmission_distribution2")),
          div(id = "readmission_distribution1", uiOutput("readmission_distribution1"))
        ),
        tabPanel("Data Analysis",
          br(),
          div(id = "data_analysis1", uiOutput("data_analysis1")),
          div(id = "data_analysis2", uiOutput("data_analysis2"))
        ),
        tabPanel("Modeling Summaries",
          br(),
          div(id = "modeling_summaries1", uiOutput("modeling_summaries1")),
          div(id = "modeling_summaries2", uiOutput("modeling_summaries2"))
        )
      )
    )
  ),
  tags$head(tags$head(
    tags$script(
      '
                        var width = 0;
                        $(document).on("shiny:connected", function(e) {
                          width = window.innerWidth;
                          Shiny.onInputChange("width", width);
                        });
                        $(window).resize(function(e) {
                          width = window.innerWidth;
                          Shiny.onInputChange("width", width);
                        });
                        '
    )
  ))
)

# Define server logic required to draw a histogram
server <- function(input, output, session) {
  source(file.path(getwd(), "Assets/readmission_prediction.R"))
  prediction_message <- reactive({
    readmission_prediction(input)
  })
  observeEvent(input$submit, {
    prediction_message_text <- prediction_message()
    if(prediction_message_text == "Patient will not be re-admitted in 30 days."){
      prediction_type = "success"
    }else{
      prediction_type = "info"
    }

    shinyalert(title = "Prediction Results",
               text = prediction_message_text,
               type = prediction_type)
  })
  # -------------RenderUI

  source(file.path(getwd(), "Components/readmission_prediction_tab.R"))
  output <- readmission_prediction_tab(output)

  source(file.path(getwd(), "Assets/generatePlots.R"))
  output <- generatePlots(output)

  source(file.path(getwd(), "Components/clinical_insights/patient_statistics.R"))
  output <- patient_statistics(output)

  source(file.path(getwd(), "Components/clinical_insights/readmission_distribution.R"))
  output <- readmission_distribution(output)

  source(file.path(getwd(), "Components/clinical_insights/data_analysis.R"))
  output <- data_analysis(output)

  source(file.path(getwd(), "Components/clinical_insights/modeling_summaries.R"))
  output <- modeling_summaries(output)

  # -------------Dynamic Page Sizing
  observe({
    req(input$width)
    if (input$width < 1200) {
      shinyjs::show("patient_statistics2")
      shinyjs::hide("patient_statistics1")

      shinyjs::show("readmission_distribution2")
      shinyjs::hide("readmission_distribution1")

      shinyjs::show("data_analysis2")
      shinyjs::hide("data_analysis1")

      shinyjs::show("modeling_summaries2")
      shinyjs::hide("modeling_summaries1")

    } else {
      shinyjs::hide("patient_statistics2")
      shinyjs::show("patient_statistics1")

      shinyjs::hide("readmission_distribution2")
      shinyjs::show("readmission_distribution1")

      shinyjs::hide("data_analysis2")
      shinyjs::show("data_analysis1")

      shinyjs::hide("modeling_summaries2")
      shinyjs::show("modeling_summaries1")

    }
  })
}

# Run the application
shinyApp(ui = ui, server = server)
