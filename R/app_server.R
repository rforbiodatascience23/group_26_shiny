#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  # Your application server logic
  mod_plot_amino_acids_server("plot_amino_acids_1")
  mod_dna_to_peptide_server("dna_to_peptide_1")


}
