# Project:   data-sci-workshop
# Edited on: 02-13-22
# Edited by: Fabiana N.

# Description: Upload, clean and plot data


##### Libraries #####
library(dplyr)
library(ggplot2)


##### Load data #####
ManualData <- read.csv("data_raw/wp.csv") 
auto_data  <- read.csv("data_raw/new_1b_3.csv") 

# Note: missing data in original repository?

# Check data structure
str(ManualData)
str(auto_data)


##### Functions #####

SE <- function(x) {
  sd(x, na.rm = TRUE) / sqrt(length(x))
}


##### Data cleaning #####

sum_WP <- d %>%
  mutate(datetime = as.POSIXct(strptime(datetime, "%m/%d/%Y %H:%M")), 
         date     = as.POSIXct(paste0(date," 00:00"), 
         format   = "%m/%d/%Y %H:%M")
         ) %>%
  group_by(date) %>%
  summarize(m  = mean(negWP, na.rm = TRUE),
            se = SE(negWP),
            sd = sd(negWP)
            )


##### Plot #####

# Plot figure 1
fig1 <- ggplot() +
  
  geom_point(filter(auto_data, values > 0.01), 
             aes(x = datetime, y = psy)) +
  
  geom_point(data = sum_WP, 
             aes(x = date, y = m), 
             stat = "identity", 
             size = 3, 
             col = "red") +
  
  geom_errorbar(data = sum_WP, 
                aes(x = date, ymin = m - sd, ymax = m + sd), 
                stat = "identity",
                width = 5)

fig1
