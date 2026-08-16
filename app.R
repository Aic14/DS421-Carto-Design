### Install Packages
##Suicide rates


#Downloading needed libraries 
library(leaflet)
library(RColorBrewer)
library(scales)
library(shiny)

world_suicide <- readRDS("world_suicide.rds")

### Build and display interactive map

rate_pal <- colorFactor(
  palette = brewer.pal(min(length(levels(world_suicide$rate_cat)), 5), "Purples"),
  domain  = levels(world_suicide$rate_cat),
  levels  = levels(world_suicide$rate_cat),
  na.color = "#f0f0f0"
)

popup_Country <- paste0(
  "<strong>", world_suicide$name, "</strong><br/>",
  "Suicide rate: ", ifelse(is.na(world_suicide$rate_per_100k), "No data",
                           paste0(round(world_suicide$rate_per_100k, 1), " per 100k"))
)

m_Country <- leaflet(world_suicide) |>
  addProviderTiles("CartoDB.Positron") |>
  addPolygons(
    fillColor = ~rate_pal(rate_cat),
    fillOpacity = 0.8,
    color = "white",
    weight = 0.5,
    smoothFactor = 0.5,
    popup = popup_Country,
    highlightOptions = highlightOptions(
      color = "purple",
      weight = 2,
      bringToFront = TRUE
    )
  ) |>
  addMapPane("labels", zIndex = 450) |>             
  addProviderTiles(
    "CartoDB.PositronOnlyLabels",
    options = leafletOptions(pane = "labels")) |>
  addLegend(
    pal = rate_pal,
    values = ~rate_cat,
    title = "Suicide rate (log scale)",
    position = "bottomright",
    opacity = 0.9
  ) |>
  setView(lng = 10, lat = 20, zoom = 2)

# Title
title_html <- tags$div(
  tags$h3(
    "Global Suicide rates",
    style = "position:absolute; !important; top:10px; left:50px; z-index:9999;
           background: rgba(255,255,255,0.9); padding: 8px 12px;
           border-radius: 4px; font-family: sans-serif; margin: 0; box-shadow: 0 1px 4px rgba(0,0,0,0,3); "
  )
)

m_Country <- m_Country |> addControl(title_html, position = "topleft")

# Showing map
m_Country

# saveWidget(m_Country, "suicide_stats_by_Country.html", selfcontained = TRUE)

# ---- Shiny UI and server ----

ui <- fluidPage(
  titlePanel("DS421 Final Project – Global Suicide Statistics"),
  sidebarLayout(
    sidebarPanel(
      width = 3,
      h4("About this project"),
      p(
        "This map shows suicide rates per 100,000 people by country, ",
        "using a data set from kaggle -WHO/World Bank data.- The goal was to show suicide rates specifically on Micronesia or the Pacific Islands as a whole, but that would give me almost nothing to see visually due to the small amount of data on those countries.Due to little data, I found it was best to show a more broad map (globally), that way I have some comparisons in my visual. Mental health disparities are often unavailable or invisible in global statistics, this maps aim is to show the different in rates in different countries. Which can maybe lead to us conversating about where support & aid is needed most."
      )
    ),
    mainPanel(
      leafletOutput("suicideMap", height = "700px")
    )
  )
)

server <- function(input, output, session) {
  output$suicideMap <- renderLeaflet({
    m_Country
  })
}


shinyApp(ui, server)
