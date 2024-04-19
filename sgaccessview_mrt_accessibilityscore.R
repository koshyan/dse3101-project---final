library(tidyverse)
library(readr)
library(stringr)


mrtfaretime <- read_csv("mrtfaretime.csv")

stations <- mrtfaretime %>%
  select(Station_start, Station_end, Time, Latitude_End, Longitude_End) %>%
  mutate(Station_start = str_replace_all(Station_start, "�", " "),
         Station_end = str_replace_all(Station_end, "�", " ")) %>%
  rename(Latitude = Latitude_End,
         Longitude = Longitude_End)

##----------------------------------------------------------------
##                        Tiong Bahru                           --
##----------------------------------------------------------------
tiongbahru <- stations %>%
  filter(str_detect(Station_start, "Tiong Bahru"))


# Prepare the data for accessibility calculation
tb_data <- tiongbahru %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)

# ACCESSIBILITY FUNCTION

# Set environment ---------------------------------------------------------

# Load packages
library(data.table)
setDTthreads(0) # Max threads

# Decaying functions ------------------------------------------------------

# Cumulative function
cum_fn <- function(d_ij, beta) {
  min_time <- min(d_ij)
  max_time <- max(d_ij)
  normalized_time <- 5 - 4 * (d_ij - min_time) / (max_time - min_time)
  ifelse(d_ij <= beta, normalized_time, 0)
}

# Define the accessibility function
mrt_accessibility <- function(ttm, beta, tt = "travel_time") {
  if(!is.data.table(ttm)){
    ttm <- as.data.table(ttm)
  }
  names(ttm)[which(names(ttm) == tt)] <- "travel_time"
  ttm[, access_w := cum_fn(d_ij = travel_time, beta = beta)]
  access_dt <- ttm[, .(accessibility = sum(access_w, na.rm = TRUE)), by = .(fromId)]
  min_accessibility <- min(access_dt$accessibility)
  max_accessibility <- max(access_dt$accessibility)
  scaled_accessibility <- 5 - 4 * (access_dt$accessibility - min_accessibility) / (max_accessibility - min_accessibility)
  scaled_accessibility <- round(scaled_accessibility, 2)
  access_dt$accessibility <- scaled_accessibility
  # Include longitude and latitude
  access_dt <- merge(access_dt, ttm[, .(fromId, Longitude, Latitude)], by = "fromId", all.x = TRUE)
  access_dt <- access_dt[order(access_dt$accessibility), ]
  # Return results
  return(access_dt)
}


##----------------------------------------------------------------
##                         Redhill                              --
##----------------------------------------------------------------

redhill <- stations %>%
  filter(str_detect(Station_start, "Redhill"))

rh_data <- redhill %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)

set1<- mrt_accessibility(tb_data, 60)
set2<-mrt_accessibility(rh_data, 60)


##----------------------------------------------------------------
##                         Queenstown                           --
##----------------------------------------------------------------

queenstown <- stations %>%
  filter(str_detect(Station_start, "Queenstown"))

qt_data <- queenstown %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)



##----------------------------------------------------------------
##                        Farrer Park                           --
##----------------------------------------------------------------

farrerpark <- stations %>%
  filter(str_detect(Station_start, "Farrer Park"))

fp_data <- farrerpark %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)



##----------------------------------------------------------------
##                         Serangoon                            --
##----------------------------------------------------------------

serangoon <- stations %>%
  filter(str_detect(Station_start, "Serangoon"))

sr_data <- serangoon %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)


##----------------------------------------------------------------
##                         Kovan                                --
##----------------------------------------------------------------

kovan <- stations %>%
  filter(str_detect(Station_start, "Kovan"))

kv_data <- kovan %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)


##----------------------------------------------------------------
##                         Hougang                              --
##----------------------------------------------------------------

hougang <- stations %>%
  filter(str_detect(Station_start, "Hougang"))

hg_data <- hougang %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)


##----------------------------------------------------------------
##                        Sengkang                              --
##----------------------------------------------------------------
sengkang <- stations %>%
  filter(str_detect(Station_start, "Sengkang"))

sk_data <- sengkang %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)

##----------------------------------------------------------------
##                          Punggol                             --
##----------------------------------------------------------------

punggol <- stations %>%
  filter(str_detect(Station_start, "NE17"))

pl_data <- punggol %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)


##----------------------------------------------------------------
##                     Choa Chu Kang                            --
##----------------------------------------------------------------

choachukang <- stations %>%
  filter(str_detect(Station_start, "Choa Chu Kang"))

cck_data <- choachukang %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)


##----------------------------------------------------------------
##                        Toa Payoh                             --
##----------------------------------------------------------------

toapayoh <- stations %>%
  filter(str_detect(Station_start, "Toa Payoh"))

tp_data <- toapayoh %>%
  rename(fromId = Station_end, employment = NULL) %>%
  mutate(travel_time = Time) %>%
  arrange(travel_time)

