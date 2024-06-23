##clear your working space####
rm(list = ls())
####load libraries
if(!require(pacman))(install.packages("pacman"))
pacman:: p_load(
  mapview,
  tidygeocoder,
  sf,
  leaflet,
  plotly,
  tidyverse,
  readr,
  terra,
  janitor
)
library(readr)
#Set working directory######

##Read the dataset#########
market <- read_csv("nigeria_markets.csv")
dim(market)

#convert the data frame to a shape file####
nigerian_market_sf <- market[1:5000,] %>% 
st_as_sf(
  coords = c("longitude","latitude"),
         crs = 4326
         )
mapview(nigerian_market_sf)@map

#add
nigerian_market_sf %>% 
  leaflet() %>% 
  addProviderTiles(providers$MtbMap)
##ADD
nigerian_market_sf %>% 
  leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>% 
  addProviderTiles(providers$Stadia.StamenTonerLite, group = "Toner Lite") %>% 
  addLayersControl(baseGroups = c("Toner Lite", "World Imagery")) %>%
  addMarkers(label = nigerian_market_sf$market_settlement_name,
             clusterOptions = markerClusterOptions(),
             ##if there is any NA @ OBJECTID in the dataframe##### 
              popup = ifelse(nigerian_market_sf$OBJECTID != NA,
                            nigerian_market_sf$OBJECTID, 
                            "Not sure of the market's location"))


### creating a new data frame with lat and long with geocode ######
uba_data <- read.csv("uba_branches.csv") %>% 
  clean_names()
dim(uba_data)
view(uba_data)
uba_data_tbl <- uba_data %>% 
  tidygeocoder::geocode(
    address = address,
    method = "osm" #search for the geometry using a universal world map address locator(not effective in Africa)
  )
view(uba_data_tbl)

###write the new data frame as csv
write.csv(uba_data_tbl, file = "uba_geocoded_branch.csv")

uba_branch <- read_csv("uba_geocoded_branch.csv")
head(uba_branch)
uba_branch_sf <- uba_branch %>%
  drop_na() %>% 
  st_as_sf(
    coords = c("lat","long"),
    crs = 4326
  )
mapview(uba_branch_sf)@map

uba_branch_sf %>% 
  leaflet() %>% 
  addProviderTiles(providers$MtbMap)
uba_branch_sf %>%
  leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery,  group = "World Imagery") %>% 
  addProviderTiles(providers$OpenStreetMap, group = "OpenStreetMap") %>% 
  addLayersControl(baseGroups = c("OpenStreetMap","world Imagery")) %>% 
  addMarkers(label = uba_branch_sf$branches,
             clusterOptions = markerClusterOptions(),
             popup = ifelse(uba_branch_sf$address != NA,
                            uba_branch_sf$address,
                            "Not sure of the branch address"))

