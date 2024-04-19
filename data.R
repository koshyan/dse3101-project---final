# libraries
library(tidyverse)
library(tibble)
library(httr)
library(jsonlite)
library(sf)



# bus services data - 709 observations, 11 variables
allbusservices <- list()

busservices_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusServices"
data2 <- GET(busservices_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                          accept = "application/json"))
data2_list <- content(data2, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data2_list$value)
allbusservices[[length(allbusservices) + 1]] <- chunk

busservices_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusServices?$skip=500"
data2 <- GET(busservices_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                          accept = "application/json"))
data2_list <- content(data2, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data2_list$value)
allbusservices[[length(allbusservices) + 1]] <- chunk

busservices <- bind_rows(allbusservices)



# bus stops data - 5109 observations, 5 variables
allbusstops <- list()

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                        accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=500"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=1000"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=1500"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=2000"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=2500"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=3000"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=3500"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=4000"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=4500"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=5000"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops_url <- "http://datamall2.mytransport.sg/ltaodataservice/BusStops?$skip=5500"
data4 <- GET(busstops_url, add_headers(AccountKey = Sys.getenv("ltakey"),
                                       accept = "application/json"))
data4_list <- content(data4, type = "text") %>%
  fromJSON(flatten = TRUE)
chunk <- as_tibble(data4_list$value)
allbusstops[[length(allbusstops) + 1]] <- chunk

busstops <- bind_rows(allbusstops)



# data cleaning
sum(is.na(busservices))   # no missing values
sum(is.na(busstops))   # no missing values
