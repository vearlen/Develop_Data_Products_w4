
library(shiny)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {


    x <- reactive({temp <- mtcars[,input$Xvariable] })
    y <- reactive({temp <- mtcars[,input$Yvariable]})
    col <- reactive({temp <- mtcars[,input$Color]})
    size <- reactive({temp <- mtcars[,input$Size]})
    ply <- reactive({temp <- input$Poly})
  

output$Plot <- renderPlotly({
    if(input$showModel == TRUE) { 
plot_ly(mtcars,x=x(),y=y(),color=col(),size = size(),
        type="scatter",
        hoverinfo = 'text',
        text = ~paste(paste(input$Xvariable,':'), x(), paste('<br>',input$Yvariable,":"), y(),
                      '<br>',paste(input$Color,':'), col()))%>%
        add_lines(x=x(),y=fitted(lm(y()~poly(x(),ply()),data=mtcars)))
            }
else{
    plot_ly(mtcars,x=x(),y=y(),color=col(),size=size(),
            type="scatter",
            hoverinfo = 'text',
            text = ~paste(paste(input$Xvariable,':'), x(), paste('<br>',input$Yvariable,":"), y(),
                          '<br>',paste(input$Color,':'), col(),
                          '<br>',paste(input$Size,':'),size()))
}
    })

output$Text <- renderText({
   if(input$showModel){
       fit <- lm(y()~poly(x(),ply()),data=mtcars)
       paste("R-Squared:",round(summary(fit)$r.squared,3))
   }
})
})
