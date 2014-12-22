library(shiny)

# create AirlineFares data by my own, and save in local disk.
# load airline data, column name, and row names. 
AirlineFares <- as.matrix(read.csv("AirlineFares.csv"))
colnames(AirlineFares) <- c("American Airlines", "United Airlines", "US Airways", "Delta Air Lines", "Southwest Airlines", "Virgin America", "JetBlue")
rownames(AirlineFares) <- c("Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sept.", "Oct.", "Nov.", "Dec.")


# Define a server for the Shiny app
shinyServer(function(input, output) {
    
    # Fill in the spot we created for a plot
    output$phonePlot <- renderPlot({
        
        # Render a barplot
        barplot(AirlineFares[,input$airlines]*0.1, 
                main=input$airlines,
                ylab="Averaged Flight Fare per month (dollars)",
                xlab="Month")
    })
})
