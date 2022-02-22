# Plots

library(dplyr)
library(readr)
library(ggplot2)

surveys_complete <- read_csv("data_clean/surveys_complete.csv")

# basic ggplot format

ggplot(data = surveys_complete, 
       mapping = aes(x = weight,
                     y = hindfoot_length)) +
  geom_point(alpha = 0.1,
             color = "coral")

ggplot(data = surveys_complete, 
       mapping = aes(x = weight,
                     y = hindfoot_length,
                     color = genus)) +
  geom_point(alpha = 0.1)

ggplot(data = surveys_complete, 
       mapping = aes(x = species_id,
                     y = weight,
                     color = genus)) +
  geom_jitter(alpha = 0.1) + 
  #geom_boxplot(alpha = 0,
  #             color = "black") + 
  geom_violin(alpha = 0,
              color = "black")

# Plotting change over time
surveys_complete %>% 
  group_by(year,genus) %>%
  summarize(n = n())

surveys_complete %>% 
  count(year,genus)

yearly_counts <- surveys_complete %>% 
  group_by(year,genus) %>%
  summarize(n = n())

ggplot(data = yearly_counts, 
       mapping = aes(x = year,
                     y = n,
                     group = genus)) + 
  geom_line()
