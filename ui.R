#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(DT)

shinyUI(
  fluidPage(
    headerPanel(title = "Shiny App Conditional Filter Demo"),
    sidebarLayout(
      sidebarPanel(
        selectInput("mainproduct", "Select a Product Category",
          choices = c("Furniture", "Office Supplies", "Technology")
        ),
        selectInput("subproduct", "Select a Sub Product Category", choices = NULL),
        selectInput("product", "Select a Product", choices = NULL)
      ),
      mainPanel(
        # Display dynamic DT as user selects choices from selectInput.
        DT::dataTableOutput("dtData")
      )
    )
  )
)
