# DS421-Carto-Design Final Project
Final Project

# Global Suicide rates — Interactive Map

## Project Summary
This map shows suicide rates per 100,000 people by country, using a data set from kaggle -WHO/World Bank data.- The goal was to show suicide rates specifically on Micronesia or the Pacific Islands as a whole, but that would give me almost nothing to see visually due to the small amount of data on those countries.Due to little data, I found it was best to show a more broad map (globally), that way I have some comparisons in my visual. Mental health disparities are often unavailable or invisible in global statistics, this maps aim is to show the different in rates in different countries. That way we can know where help/aid is needed most. Mental health is a topic that is very serious, and somemtimes overlooked- suicides happen often, and I hope this map aims to portray where it happens most so that country can find ways to not only avoid it but provide guidance, support, and help.

#Purpose
My main goal for this interactive map was to show the suicide statistics in the Micronesian region, because coming from a first-person point of view who grew up in the islands of Chuuk in Micronesia, suicides often quite often, and they all lead back to neglecting ones mental health. I wanted to show a map that can make Micronesians aware of the mental state we are in and how important mental health is in the country. Unfortunately, there was not much data in that region. After creating this map, it makes me want to look more into this case, that way when another individual want to look into this topic, there's an available dataset on the rates in Micornesia.

## Data Source
- Dataset: [https://www.kaggle.com/datasets/arpitsinghaiml/global-suicide-statistics]
- Source: Kaggle- Uploaded by Arpit Singh but most likely compiled by WHO / World Bank

## Map design
- Interactive map
- I love purple so I made my map different shades of purple, for visual reason but also to differentiate least to greatest.
- Log scale: Lightest to darkest shade = least to greatest in rates

## Instructions
1. Clone this repository
2. Open in R studio (project)
3. Make sure to Install required packages:
  library(tidyverse)
  library(lubridate)
  library(janitor)
  library(leaflet)
  library(RColorBrewer)
  library(htmlwidgets)
  library(scales)
  library(countrycode)
  install.packages("countrycode")
  library(shiny)
  library(rnaturalearth)
  install.packages("rnaturalearth")
4. Run: shiny::runApp("app.R")
5. Good feature: rsconnect::showLogs() - Helped me when I ran into errors and needed to know where the error was.

## Shiny apps link
🔗 [https://aichens-ds421.shinyapps.io/ds421-_aichen/]

