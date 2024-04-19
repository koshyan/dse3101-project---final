
# Set environment ---------------------------------------------------------

# Load packages
library(tidyverse)
library(geosphere)
source("data.R")
library(data.table)
setDTthreads(0) # Max threads

# get MRT stations data ---------------------------------------------------
mrt_stations = read.csv("MRT Stations.csv")


accessibility  = function(table){
  if(!is.data.table(table)){     
    ttm <- as.data.table(table)   
  } 
  min_dist =  min(table$distance)
  max_dist =  max(table$distance) 
  x = table %>%
    rowwise()%>%
    mutate(accessibility = round(1 + 4 *(distance -min_dist) / (max_dist - min_dist),2))%>%
    rename(fromId = BusStopCode)%>%
    arrange(accessibility)
  return(x)
}



##----------------------------------------------------------------
##                        Tiong Bahru                           --
##----------------------------------------------------------------
tiong_bahru = mrt_stations %>%
  filter(STN_NAME == "TIONG BAHRU MRT STATION")
dist_to_tb =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(tiong_bahru[[7]],tiong_bahru[[6]]), fun = distHaversine)) )

access_to_tb = accessibility(dist_to_tb)

##----------------------------------------------------------------
##                         Redhill                              --
##----------------------------------------------------------------
redhill = mrt_stations %>%
  filter(STN_NAME == "REDHILL MRT STATION")
dist_to_rh =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(redhill[[7]],redhill[[6]]), fun = distHaversine)) )

access_to_rh = accessibility(dist_to_rh)

##----------------------------------------------------------------
##                         Queenstown                           --
##----------------------------------------------------------------
queenstown = mrt_stations %>%
  filter(STN_NAME == "QUEENSTOWN MRT STATION")
dist_to_qt =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(queenstown[[7]],queenstown[[6]]), fun = distHaversine)) )

access_to_qt = accessibility(dist_to_qt)

##----------------------------------------------------------------
##                        Farrer Park                           --
##----------------------------------------------------------------
farrer_park = mrt_stations %>%
  filter(STN_NAME == "FARRER PARK MRT STATION")
dist_to_fp =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(farrer_park[[7]],farrer_park[[6]]), fun = distHaversine)) )

access_to_fp = accessibility(dist_to_fp)

##----------------------------------------------------------------
##                         Serangoon                            --
##----------------------------------------------------------------
serangoon = mrt_stations %>%
  filter(STN_NAME == "SERANGOON MRT STATION")
dist_to_sg =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(serangoon[[7]],serangoon[[6]]), fun = distHaversine)) )

access_to_sg = accessibility(dist_to_sg)

##----------------------------------------------------------------
##                         Kovan                                --
##----------------------------------------------------------------
kovan = mrt_stations %>%
  filter(STN_NAME == "KOVAN MRT STATION")
dist_to_kv =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(kovan[[7]],kovan[[6]]), fun = distHaversine)) )

access_to_kv = accessibility(dist_to_kv)

##----------------------------------------------------------------
##                         Hougang                              --
##----------------------------------------------------------------
hougang = mrt_stations %>%
  filter(STN_NAME == "HOUGANG MRT STATION")
dist_to_hg =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(hougang[[7]],hougang[[6]]), fun = distHaversine)) )

access_to_hg = accessibility(dist_to_hg)

##----------------------------------------------------------------
##                         Sengkang                             --
##----------------------------------------------------------------
sengkang = mrt_stations %>%
  filter(STN_NAME == "SENGKANG MRT STATION")
dist_to_sk =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(sengkang[[7]],sengkang[[6]]), fun = distHaversine)) )

access_to_sk = accessibility(dist_to_sk)

##----------------------------------------------------------------
##                         Punggol                              --
##----------------------------------------------------------------
punggol = mrt_stations %>%
  filter(STN_NAME == "PUNGGOL MRT STATION")
dist_to_pg =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(punggol[[7]],punggol[[6]]), fun = distHaversine)))

access_to_pg = accessibility(dist_to_pg)

##----------------------------------------------------------------
##                     Choa Chu Kang                            --
##----------------------------------------------------------------
choa_chu_kang = mrt_stations %>%
  filter(STN_NAME == "CHOA CHU KANG MRT STATION")
dist_to_cck =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(choa_chu_kang[[7]],choa_chu_kang[[6]]), fun = distHaversine)))

access_to_cck = accessibility(dist_to_cck)

##----------------------------------------------------------------
##                         Toa Payoh                            --
##----------------------------------------------------------------
toa_payoh = mrt_stations %>%
  filter(STN_NAME == "TOA PAYOH MRT STATION")
dist_to_tp =  busstops %>%
  rowwise()%>%
  mutate(distance = as.numeric(distm(c(Longitude,Latitude),c(toa_payoh[[7]],toa_payoh[[6]]), fun = distHaversine)))

access_to_tp = accessibility(dist_to_tp)
