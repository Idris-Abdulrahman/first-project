getwd()
market <- read_csv("nigeria_markets.csv")
head(market)
view(market)
market
market2 <- market[1:1000, ]

view(market2)
install.packages("mapview")
install.packages("tidygeocoder")
install.packages("sf")
pacman:: p_load(
  mapview,
  tidygeocoder,
  sf,
  leaflet,
  plotly
)
nigerian_market_sf <- market2 %>% 
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
  #addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>% 
  addProviderTiles(providers$OpenStreetMap, group = "OpenStreetMap") %>% 
  #addProviderTiles(providers$Stadia.StamenTonerLite, group = "Toner Lite") %>% 
  #addLayersControl(baseGroups = c("Toner Lite", "World Imagery")) %>%
  #addLayersControl(baseGroups = c("OpenStreetMap")) %>% 
  addMarkers(label = nigerian_market_sf$market_settlement_name,
             clusterOptions = markerClusterOptions(),
             popup = ifelse(nigerian_market_sf$OBJECTID != NA,
                            nigerian_market_sf$OBJECTID, 
                            "Not sure of the market's location"))
marker 