# Plotting cleaned portal surveys data

# load necessary libraries

library(dplyr)
library(readr)
library(ggplot2)

# read in data

surveys_complete <- read_csv("data_clean/surveys_complete.csv")

# Basic ggplot format

ggplot(data = surveys_complete, 
       mapping = aes(x = weight,
                     y = hindfoot_length)) +
  geom_point(alpha = 0.1, 
             color = "coral")

# Add color as an axis representing genus

ggplot(data = surveys_complete, 
       mapping = aes(x = weight,
                     y = hindfoot_length,
                     color = genus)) +
  geom_point(alpha = 0.1)
ggplot(data = surveys_complete, 
       mapping = aes(x = species_id,
                     y = weight,
                     color = as.factor(species_id))) +
  geom_jitter(alpha = 0.1) +
  geom_boxplot(alpha = 0,
               color = "black")

### Plotting change over time

yearly_counts <- surveys_complete %>%
  group_by(year, genus) %>%
  summarize(n = n())

#alternative
# surveys_complete %>%
  # count(year,genus)

ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                     group = genus, # tells ggplot to plot data for each genus separately
                     color = genus)) + # using the color argument automatically groups data by whatever factor you specify
  geom_line()


