#' plot_amino_acids UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_plot_amino_acids_ui <- function(id){
  ns <- NS(id)
  tagList(
    shiny::sidebarLayout(
      shiny::sidebarPanel(
        shiny::textAreaInput(
          inputId = ns("peptide"),
          label = "Peptide sequence",
          width = 300,
          height = 100,
          placeholder = "Insert peptide sequence"
        )),
        shiny::mainPanel(
          shiny::plotOutput(
            outputId = ns("abundance")
        ))))
}

#' plot_amino_acids Server Functions
#'
#' @noRd
mod_plot_amino_acids_server <- function(id){
  moduleServer( id, function(input, output, session){
    ns <- session$ns

    output$abundance <- renderPlot({
      if(input$peptide == ""){
        NULL
      } else{
        input$peptide |>
          AnanlysisCD::plot_codons() +
          ggplot2::theme(legend.position = "none")
      }
    })

  })
}

## To be copied in the UI
# mod_plot_amino_acids_ui("plot_amino_acids_1")

## To be copied in the server
# mod_plot_amino_acids_server("plot_amino_acids_1")
