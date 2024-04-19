# Load libraries ---------------------------------------------------------------
library(shiny)
library(tidyverse)
library(leaflet)


# Load accessibility functions -------------------------------------------------
source("sgaccessview_mrt_accessibilityscore.R")
Sys.setenv(ltakey = "2gBSYNeFTxSuRNfpYYDmzQ==")
source("sgaccessview_bus_accessibilityscore.R")


# VISUALISATION

# User Interface ---------------------------------------------------------------
ui <- fluidPage(
  
  titlePanel("Where should I stay?"),
  
  # How to Use section
  fluidRow(
    column(width = 12,
           div(class = "how-to-use",
               h3("How to Use"),
               p("1. Select a neighbourhood from each dropdown menu."),
               p("The selected neighbourhood can be viewed as your origin location (i.e. where your home will be located) and explore whether the nearby neighbourhoods suit your daily life and commute."),
               p("Alternatively, it can also be viewed as your destination location (i.e. where you want your home to be close to) and explore which nearby neighbourhoods are suitable for your new home."),
               p("2. Choose a mode of transport for each neighborhood."),
               p("3. If you have selected 'MRT & LRT', pick your desired travel time using the slider."),
               p("4. The maps will display the accessibility scores for the selected neighbourhoods."),
               p("5. Click on the circles on the map to view a particular MRT station / bus stop's accessibility score (you may zoom in on the map for a clearer view of the individual circles)."),
               p("Note: The legends on the maps explain the color code used for accessibility scores. An accessibility score of close to 1 is the best, while 5 reflects the worst accessibility."),
           ),
           hr()
    )
  ),
  
  fluidRow(
    column(width = 6,
           selectInput("neighbourhood1", "Select a neighbourhood:",
                       c("Tiong Bahru", "Redhill", "Queenstown", "Farrer Park", "Serangoon",
                         "Kovan", "Hougang", "Sengkang", "Punggol", "Choa Chu Kang", "Toa Payoh"))),
    column(width = 6,
           selectInput("neighbourhood2", "Select a neighbourhood:",
                       c("Tiong Bahru", "Redhill", "Queenstown", "Farrer Park", "Serangoon",
                         "Kovan", "Hougang", "Sengkang", "Punggol", "Choa Chu Kang", "Toa Payoh")))
  ),
  
  fluidRow(
    column(width = 6,
           selectInput("transport1", "Select a mode of transport for the above neighbourhood:", c("MRT & LRT", "Bus"))),
    column(width = 6,
           selectInput("transport2", "Select a mode of transport for the above neighbourhood:", c("MRT & LRT", "Bus")))
  ),
  
  fluidRow(
    column(width = 6,
      conditionalPanel(
        condition = "input.transport1 == 'MRT & LRT'",
        sliderInput("Time1", "Select your maximum Desired Travel Time via MRT (in minutes):", 
                    min = 0, max = 90, value = 30)
      )
    ),
    column(width = 6,
      conditionalPanel(
        condition = "input.transport2 == 'MRT & LRT'",
        sliderInput("Time2", "Select your maximum Desired Travel Time via MRT (in minutes):", 
                    min = 0, max = 90, value = 30)
      )
    )
  ),
  
  div(class = "section"),
  
  fluidRow(
    column(width = 6, textOutput("maptitle1")),
    column(width = 6, textOutput("maptitle2"))
  ),
      
  fluidRow(
    column(width = 6, leafletOutput("map1")),
    column(width = 6, leafletOutput("map2"))
  ),
  
  fluidRow(
    column(width = 6, DT::DTOutput("table1")),
    column(width = 6, DT::DTOutput("table2"))
  ),
  
  tags$head(tags$style("#maptitle1{color: black;
                                 font-size: 20px;
                                 font-style: bold;
                                 }",
                       "#maptitle2{color: black;
                                 font-size: 20px;
                                 font-style: bold;
                                 }"
    )
  )
)


# Server (containing accessibility function) -----------------------------------
server <- function(input, output, session) {
  
  # Title for map 1
  output$maptitle1 <- renderText({
    paste(input$neighbourhood1, input$transport1, "Scores")
  })
  # Retrieving accessibility scores for the first neighbourhood
  score1 <- reactive({
    beta_value <- input$Time1
    
    if (input$transport1 == "MRT & LRT") {
      if (input$neighbourhood1 == "Tiong Bahru") {
        score1 <- mrt_accessibility(tb_data, beta= beta_value)
      } else if (input$neighbourhood1 == "Redhill") {
        score1 <- mrt_accessibility(rh_data, beta= beta_value)
      } else if (input$neighbourhood1 == "Queenstown") {
        score1 <- mrt_accessibility(qt_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Farrer Park") {
        score1 <- mrt_accessibility(fp_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Serangoon") {
        score1 <- mrt_accessibility(sr_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Kovan") {
        score1 <- mrt_accessibility(kv_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Hougang") {
        score1 <- mrt_accessibility(hg_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Sengkang") {
        score1 <- mrt_accessibility(sk_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Punggol") {
        score1 <- mrt_accessibility(pl_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Choa Chu Kang") {
        score1 <- mrt_accessibility(cck_data, beta = beta_value)
      } else if (input$neighbourhood1 == "Toa Payoh") {
        score1 <- mrt_accessibility(tp_data, beta = beta_value)
      }
    } else {
      if (input$neighbourhood1 == "Tiong Bahru") {
        score1 <- access_to_tb
      } else if (input$neighbourhood1 == "Redhill") {
        score1 <- access_to_rh
      } else if (input$neighbourhood1 == "Queenstown") {
        score1 <- access_to_qt
      } else if (input$neighbourhood1 == "Farrer Park") {
        score1 <- access_to_fp
      } else if (input$neighbourhood1 == "Serangoon") {
        score1 <- access_to_sg
      } else if (input$neighbourhood1 == "Kovan") {
        score1 <- access_to_kv
      } else if (input$neighbourhood1 == "Hougang") {
        score1 <- access_to_hg
      } else if (input$neighbourhood1 == "Sengkang") {
        score1 <- access_to_sk
      } else if (input$neighbourhood1 == "Punggol") {
        score1 <- access_to_pg
      } else if (input$neighbourhood1 == "Choa Chu Kang") {
        score1 <- access_to_cck
      } else if (input$neighbourhood1 == "Toa Payoh") {
        score1 <- access_to_tp
      }
    }
  })
  # Leaflet map output for the first neighbourhood
  output$map1 <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(data = score1() %>% filter(accessibility == 1.00),
                 lat = ~Latitude, lng = ~Longitude,
                 popup = ~fromId) %>%
      addCircleMarkers(data = score1() %>% filter(accessibility > 1.00),
                       lat = ~Latitude, lng = ~Longitude,
                       popup = ~paste0(fromId, ": ", accessibility),
                       color = ~ifelse(accessibility <= 2, "green",
                                       ifelse(accessibility > 2 & accessibility <= 3.5, "orange", "red")),
                       radius = 6, fillOpacity = 1, stroke = FALSE) %>%
      addLegend("bottomright", # Position the legend
                colors = c("green", "orange", "red"), # Colors used in the map
                labels = c("Nearest in your neighbourhood",
                           "Requires time to travel to transport of choice",
                           "Furthest from your neighbourhood"), # Legend labels
                title = "Accessibility Levels")
  })
  # Data table output for the first neighbourhood
  output$table1 <- DT::renderDT({
    score1() %>%
      select(fromId, accessibility) %>%
      rename(Location = fromId, Accessibility = accessibility)
  })
  
  # Title for map 2
  output$maptitle2 <- renderText({
    paste(input$neighbourhood2, input$transport2, "Scores")
  })
  # Retrieving accessibility scores for the second neighbourhood
  score2 <- reactive({
    beta_value <- input$Time2
    
    if (input$transport2 == "MRT & LRT") {
      if (input$neighbourhood2 == "Tiong Bahru") {
        score2 <- mrt_accessibility(tb_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Redhill") {
        score2 <- mrt_accessibility(rh_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Queenstown") {
        score2 <- mrt_accessibility(qt_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Farrer Park") {
        score2 <- mrt_accessibility(fp_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Serangoon") {
        score2 <- mrt_accessibility(sr_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Kovan") {
        score2 <- mrt_accessibility(kv_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Hougang") {
        score2 <- mrt_accessibility(hg_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Sengkang") {
        score2 <- mrt_accessibility(sk_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Punggol") {
        score2 <- mrt_accessibility(pl_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Choa Chu Kang") {
        score2 <- mrt_accessibility(cck_data, beta = beta_value)
      } else if (input$neighbourhood2 == "Toa Payoh") {
        score2 <- mrt_accessibility(tp_data, beta = beta_value)
      }
    } else {
      if (input$neighbourhood2 == "Tiong Bahru") {
        score2 <- access_to_tb
      } else if (input$neighbourhood2 == "Redhill") {
        score2 <- access_to_rh
      } else if (input$neighbourhood2 == "Queenstown") {
        score2 <- access_to_qt
      } else if (input$neighbourhood2 == "Farrer Park") {
        score2 <- access_to_fp
      } else if (input$neighbourhood2 == "Serangoon") {
        score2 <- access_to_sg
      } else if (input$neighbourhood2 == "Kovan") {
        score2 <- access_to_kv
      } else if (input$neighbourhood1 == "Hougang") {
        score1 <- access_to_hg
      } else if (input$neighbourhood2 == "Sengkang") {
        score2 <- access_to_sk
      } else if (input$neighbourhood2 == "Punggol") {
        score2 <- access_to_pg
      } else if (input$neighbourhood2 == "Choa Chu Kang") {
        score2 <- access_to_cck
      } else if (input$neighbourhood2 == "Toa Payoh") {
        score2 <- access_to_tp
      }
    }
  })
  # Leaflet map output for the second neighbourhood
  output$map2 <- renderLeaflet({
    leaflet() %>%
      addTiles() %>%
      addMarkers(data = score2() %>% filter(accessibility == 1.00),
                 lat = ~Latitude, lng = ~Longitude,
                 popup = ~fromId) %>%
      addCircleMarkers(data = score2() %>% filter(accessibility > 1.00),
                       lat = ~Latitude, lng = ~Longitude,
                       popup = ~paste0(fromId, ": ", accessibility),
                       color = ~ifelse(accessibility <= 2, "green",
                                       ifelse(accessibility > 2 & accessibility <= 3.5, "orange", "red")),
                       radius = 6, fillOpacity = 1, stroke = FALSE) %>%
      addLegend("bottomright", # Position the legend
                colors = c("green", "orange", "red"), # Colors used in the map
                labels = c("Nearest to your neighbourhood",
                           "Requires some time to travel to these areas",
                           "Furthest from your neighbourhood"), # Legend labels
                title = "Accessibility Levels")
  })
  # Data table output for the second neighbourhood
  output$table2 <- DT::renderDT({
    score2() %>%
      select(fromId, accessibility) %>%
      rename(Location = fromId, Accessibility = accessibility)
  })

}



# Run Shiny app! ---------------------------------------------------------------
shinyApp(ui, server)