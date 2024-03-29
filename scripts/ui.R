library(shiny)
library(shinythemes)
library(markdown)
library(plotly)

ui <- navbarPage(theme = shinytheme("cosmo"),
  title = "Poverty levels across all US States",
  tabPanel("About this app",
           sidebarLayout(
             sidebarPanel(
               
             ), 
             mainPanel(
               h4("Overview"),
               includeMarkdown("overview.rmd")
             )
           )
           
  ),
  tabPanel("Explore the poverty levels across all US States",
           sidebarLayout(
             sidebarPanel(
               textInput("state_names", 
                         "Enter state names, capitalize first letter. Then click enter",
                         value = "Washington"),
               selectInput("top_input", "Select the measurement",
                           c("Official Poverty Measurement" = "Official",
                             "Supplemental Poverty Measurement" = "SPM")
               ),
               numericInput("num", "Number of states to view:",
                            value = 4, min = 3, max = 10),
               selectInput("map_data", "Choose which map to view",
                           c("Official Percent Estimate" = "offic_perc",
                            "SPM Percent Estimate" = "spm_perc")
               )
             ), 
             mainPanel(
               tableOutput("state_percent"),
               textOutput("average"),
               plotOutput("top_output"),
               plotlyOutput("map")
             )
           )
           
  )
  #,
  # tabPanel("Factors included in the SPM that influence Poverty Level",
  #          sidebarLayout(
  #            sidebarPanel(
  #              h3("Addition"),
  #              selectInput("addition", "Select population to view", 
  #                          c("All age group" = "All.people.Estimate",
  #                            "Under 18 years old" = "Under.18.years.Estimate",
  #                            "18 to 64 years old" = "X18.to.64.years.Estimate",
  #                            "65 years old and over" = "X65.years.and.over.Estimate"),  
  #                          selected = "All age group"
  #              ),
  #              h3("Subtraction"),
  #              selectInput("subtraction", "Select population to view", 
  #                          c("All age group" = "All.people.Estimate",
  #                            "Under 18 years old" = "Under.18.years.Estimate",
  #                            "18 to 64 years old" = "X18.to.64.years.Estimate",
  #                            "65 years old and over" = "X65.years.and.over.Estimate"),
  #                          selected = "All age group"
  #              )
  #            ),
  #            mainPanel(
  #              includeMarkdown("elements_overview.rmd"),
  #              plotOutput("bar"),
  #              plotOutput("bar2")          
  #              )
  #          )
  # )
)

shinyUI(ui)
