library(shiny)
library(shinydashboard)
library(shinydashboardPlus)
library(shiny.router)
library(shinyWidgets)
library(shinyjs)
library(networkD3)
library(dplyr)
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
          column(width = 6, offset = 0,
      flipBox(
          width = 2,
          id = 1,
          main_img = "https://image.flaticon.com/icons/svg/189/189664.svg",
          header_img = "https://image.flaticon.com/icons/svg/119/119595.svg",
          front_title = "RNA-seq interactive tools",
          back_title = "About us",
          front_btn_text = "About us", 
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
                  HTML("<img src='dna-svg-small-13.gif', width='100px'><br>
                  <h4>Authors:<br><br>
    Miriam Riquelme Pérez 
    <a href='https://www.linkedin.com/in/miriam-riquelme-perez/' target='_blank'> 
    <img src='linkedin_little.svg'> </a> <a href='mailto:miriam.riquelmep@gmail.com'>
    <img src='email.svg'></a><br>
    Fernando Pérez Sanz 
    <a href='https://www.linkedin.com/in/fernandoperez72/' target='_blank'> 
    <img src='linkedin_little.svg'> 
    </a> <a href='mailto:fernando.perez@ffis.es'> <img src='email.svg'></a></h4><br>
    For any suggestion or bug, please contact us")
              )
          )
          )
      ),
      column(width = 6,
             sankeyNetworkOutput("sankey"))
     ) # fin flip box
  ) # fin dashboardbody
) # fin dashboarpage

# Plug router into Shiny server.
server <- function(input, output) {
  shinyjs::onclick("enrich", runjs("window.open('http://155.54.120.105/shiny/enrichappDark/','_blank')") )
  output$sankey <- renderSankeyNetwork({
 links <- data.frame(
      source=c("DEseq","DEseq","DEseq","DEseq","DEseq",
               "UserGeneList", "GeneList",
               "ExprsMatrix","ExprsMatrix",
               "SampleData",
               "GeneList+Pval+logFC","GeneList+Pval+logFC","GeneList+Pval+logFC",
               "Exprs","ColData","logFC","Pval","logFC","Pval","Exprs","Exprs","ColData",
               "Exprs","ColData","Exprs","ColData","Exprs","ColData","logFC","Pval",
               "EnrichObj","EnrichObj","EnrichObj","EnrichObj","EnrichObj",
               "EnrichObj","EnrichObj","EnrichObj","Pval","logFC","EnrichObj","Pval","logFC",
               "EnrichObj","Pval","logFC"), 
      target=c("Exprs","ColData","logFC","Pval","GeneList",
               "GeneList", "EnrichObj",
               "Exprs","GeneList",
               "ColData",
               "GeneList","Pval","logFC",
               "PCA","PCA","Volcano","Volcano","MA","MA","MA","Boxplot/Violin","Boxplot/Violin",
               "Heatmap","Heatmap","Cluster","Cluster","TopGene","TopGene","Karyoplot","Karyoplot",
               "KeggBarplot","KeggChorplot","KeggDotplot","KeggHeatmap","KeggNetplot",
               "GOBar","GODot","GOplotBar","GOplotBar","GOplotBar","GOCircle","GOCircle","GOCircle",
               "GSEA","GSEA","GSEA"), 
      value=rep(3,46)
      )
    # From these flows we need to create a node data frame: it lists every entities involved in the flow
    nodes <- data.frame(
      name=c(as.character(links$source), 
      as.character(links$target)) %>% unique()
    )
    # With networkD3, connection must be provided using id, not using real name like in the links dataframe.. So we need to reformat it.
    links$IDsource <- match(links$source, nodes$name)-1 
    links$IDtarget <- match(links$target, nodes$name)-1
    links$group <- "blue"
    my_color <- 'd3.scaleOrdinal() .domain(["blue"]) .range(["blue"])'
    
    # Make the Network
    sankeyNetwork(Links = links, Nodes = nodes,
                  Source = "IDsource", Target = "IDtarget",
                  Value = "value", NodeID = "name", 
                  sinksRight=TRUE, fontSize = 13, margin=0)

  })
}

# Run server in a standard way.
shinyApp(ui, server)