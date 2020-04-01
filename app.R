library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shiny.router)
library(shinyWidgets)
library(shinyjs)
source("global.R")
ui <- dashboardPage(
  dashboardHeader(title = "Multiomics web utils", titleWidth = "300px"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
      setShadow(class = "box"),
      tags$head(tags$style(HTML('
                                .bg-limon {
                                background-color: #295e7d;
                                }
                                .box-body {
                                color: #ffffff;
                                }'))),
            useShinyjs(),
      fluidRow(
          miBoxPlus(
              title = "Simple Enrichment",
              closable = FALSE,
              width = 4,
              background = "limon",
              height = "250px",
              tags$p("Enter a single list of genes or proteins in one of the different annotation format allowed 
                     and the integrated species to get a full functional enrichment analysis based 
                     on Kyoto Encyclopedia of Genes and Genomes (", a("Kegg", href="https://www.genome.jp/kegg/pathway.html"), 
                     ") pathways database, Gene Ontology terms resource (", a("GO", href="http://geneontology.org"), ") 
                     and Gene Set Enrichment Analysis (", a("GSEA", href="https://www.gsea-msigdb.org/gsea/index.jsp"),")."),
              tags$br(),
              fluidRow(
                  column(
                      align = "center",
                      width = 2,
                      dropdown(
                          style = "unite",
                          icon = icon("info"),
                          status = "primary",
                          width = "600px",
                          animate = animateOptions(
                              enter = animations$fading_entrances$fadeInLeftBig,
                              exit = animations$fading_exits$fadeOutRightBig
                          ),
                          box(
                              width = 12,
                              status = "primary",
                              height = "300px",
                              title = tags$strong("Enrich app 2020"),
                              background = "light-blue",
                              tags$h4(
                                  "Format allowed: bla, bla, bla.
                                  Species integrated: Human and Mouse (Rat ?)."
                              )
                          )
                      ),# fin dropdown
                  ),#fin column
                  column(
                      width = 8,
                      align = "center",
                      actionBttn(
                          inputId = "simple",
                          label = "Go Simple Enrich",
                          style = "jelly",
                          color = "primary",
                      )
                  ) #fin column
              ) # fin fluid row
          ), # fin miboxplus 1
          miBoxPlus(
              title = "Count importer & DE analysis",
              closable = FALSE,
              width = 4,
              background = "limon",
              height = "250px",
              tags$p("Create a DESeq2 object starting from the counting matrix of your transcriptomics experiment. Add a file with the 
                     samples description, insert your design and the contrast of interest that you would like to test 
                     and get an object ready for differential expression gene analysis and enrichment exploration."),
              tags$br(),
              fluidRow(
                  column(
                      align = "center",
                      width = 2,
                      dropdown(
                          style = "unite",
                          icon = icon("info"),
                          status = "primary",
                          width = "600px",
                          animate = animateOptions(
                              enter = animations$fading_entrances$fadeInDownBig,
                              exit = animations$fading_exits$fadeOutDownBig
                          ),
                          box(
                              width = 12,
                              status = "primary",
                              height = "300px",
                              title = tags$strong("Enrich app 2020"),
                              background = "light-blue",
                              tags$h4(
                                  "The accepted format for the counting file is a .csv file in which 
                                  the columns are samples and the rows are genes."
                              )
                          )
                      ), # fin dropdown
                  ), #fin column
                  column(
                      width = 8,
                      align = "center",
                      actionBttn(
                          inputId = "import",
                          label = "Go importer & DE",
                          style = "jelly",
                          color = "primary",
                      )
                  ) #fin column
              ) # fin fluid row
          ), # fin miboxplus 2
          miBoxPlus(
              title = "DESeq enrichment",
              closable = FALSE,
              width = 4,
              background = "limon",
              height = "250px",
              tags$p("Enter a DESeq2 object (created by yourself or by using the 'Go importer & DE' tools, indicate the 
                     annotation and the specie and generate a full functional enrichment analysis based 
                     on Kyoto Encyclopedia of Genes and Genomes (", a("Kegg", href="https://www.genome.jp/kegg/pathway.html"), 
                     ") pathways database, Gene Ontology terms resource (", a("GO", href="http://geneontology.org"), ") 
                     and Gene Set Enrichment Analysis (", a("GSEA", href="https://www.gsea-msigdb.org/gsea/index.jsp"),")."),
              tags$br(),
              fluidRow(
                  column(
                      align = "center",
                      width = 2,
                      dropdown(
                          style = "unite",
                          icon = icon("info"),
                          status = "primary",
                          width = "600px",
                          animate = animateOptions(
                              enter = animations$fading_entrances$fadeInRightBig,
                              exit = animations$fading_exits$fadeOutLeftBig
                          ),
                          box(
                              width = 12,
                              status = "primary",
                              height = "300px",
                              title = tags$strong("Enrich app 2020"),
                              background = "light-blue",
                              tags$h4(
                                  "To use this app is necesary a deseq2 object with
                                  differential expresion computed. blah blah"
                              )
                          )
                      ),
                      # fin dropdown
                  ),
                  #fin column
                  column(
                      width = 8,
                      align = "center",
                      actionBttn(
                          inputId = "enrich",
                          label = "Go DESeq EnrichApp",
                          style = "jelly",
                          color = "primary",
                      )
                  ) #fin column
              ) # fin fluid row
          ) # fin miboxplus 3
      ), # fin fluidrow 
      br(),
      fluidRow(
          column(width = 6, offset = 3,
      flipBox(
          width = 2,
          id = 1,
          main_img = "https://image.flaticon.com/icons/svg/189/189664.svg",
          header_img = "https://image.flaticon.com/icons/svg/119/119595.svg",
          front_title = "RNA-seq interactive tools",
          back_title = "About us",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
             sed do eiusmod tempor incididunt ut labore et dolore magna 
             aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
             ullamco laboris nisi ut aliquip ex ea commodo consequat. 
             Duis aute irure dolor in reprehenderit in voluptate velit 
             esse cillum dolore eu fugiat nulla pariatur. Excepteur sint 
             occaecat cupidatat non proident, sunt in culpa qui officia 
             deserunt mollit anim id est laborum, 
          Lorem ipsum dolor sit amet, consectetur adipiscing elit, 
             sed do eiusmod tempor incididunt ut labore et dolore magna 
             aliqua. Ut enim ad minim veniam, quis nostrud exercitation 
             ullamco laboris nisi ut aliquip ex ea commodo consequat. 
             Duis aute irure dolor in reprehenderit in voluptate velit 
             esse cillum dolore eu fugiat nulla pariatur. Excepteur sint 
             occaecat cupidatat non proident, sunt in culpa qui officia 
             deserunt mollit anim id est laborum",
          back_content = tagList(
              column(
                  width = 12,
                  align = "center",
                  tags$img(src = "dna-svg-small-13.gif", width="100px"),
                  tags$h4("RNA-seq interactive tools 2020"), 
                  tags$p("Authors:"),
                  tags$p("Miriam Riquelme Pérez (corresponding author) & Fernando Pérez Sanz"),
                  tags$p("For any suggestion or bug, please contact us: miriam.riquelmep@gmail.com")
               
              )
          )
          )
      )
     ) # fin flip box
  ) # fin dashboardbody
) # fin dashboarpage

# Plug router into Shiny server.
server <- function(input, output) {
    shinyjs::onclick("enrich", runjs("window.open('http://155.54.120.105/shiny/enrichapp/','_self')") ) 
}

# Run server in a standard way.
shinyApp(ui, server)