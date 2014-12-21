library(shiny)

# create AirlineFares data by my own, and save in local disk.
# load airline data, column name, and row names. 
AirlineFares <- as.matrix(read.csv("AirlineFares.csv"))
colnames(AirlineFares) <- c("American Airlines", "United Airlines", "US Airways", "Delta Air Lines", "Southwest Airlines", "Virgin America", "JetBlue")
rownames(AirlineFares) <- c("Jan.", "Feb.", "Mar.", "Apr.", "May", "June", "July", "Aug.", "Sept.", "Oct.", "Nov.", "Dec.")


# Define the overall UI
shinyUI(
    
    # Use a fluid Bootstrap layout
    fluidPage(    
        
        # Give the page a title
        titlePanel("Airline Fares by companies"),
        
        # Generate a row with a sidebar
        sidebarLayout(      
            
            # Define the sidebar with one input
            sidebarPanel(
                selectInput("airlines", "Airlines:", 
                            choices=colnames(AirlineFares)),
                hr(),
                helpText("Data of airline fares from different airline companies.")
            ),
            
            # Create a spot for the barplot
            mainPanel(
                plotOutput("phonePlot")  
            )
            
        )
    )
)
