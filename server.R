library(shiny)
library(dplyr)

product_list <- read.csv("products.csv")
print(str(product_list))

shinyServer(function(session, input, output) {
  # populate Sub Product Category selectInput.
  observe({
    print(input$mainproduct)
    x <- product_list %>% filter(Category == input$mainproduct) %>% select(Sub.Category)
    updateSelectInput(session, "subproduct", "Select a Sub Product Category", choices = unique(x))
  })
  
  # populate Product selectInput.
  observe({
    productdata <- product_list$Product.Name[product_list$Sub.Category == input$subproduct]
    updateSelectInput(session, "product", "Select a Product", choices = productdata)
  })
  
  # choose columns to display
  # output$mytable1 <- DT::renderDataTable({
  #   DT::datatable(diamonds2[, input$show_vars, drop = FALSE])
  # })
  
  output$dtData <- renderDataTable({
    productdata <- product_list$Product.Name[product_list$Sub.Category == input$subproduct]
    DT::datatable(product_list %>% filter(product_list$Category == input$mainproduct) %>% 
                    select(everything()))
  })
})