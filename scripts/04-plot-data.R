# Plotting cleaned portal surveys data

library(dplyr)
library(readr)
# install.packages(ggplot2)
library(ggplot2)

# Read in data
surveys_complete <- read_csv("data_clean/surveys_complete.csv")

surveys_complete %>%
  count(genus)

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
  geom_jitter(alpha = 0.1)+
  geom_violin(alpha = 0, 
               color = "black")

### Plotting change over time

yearly_counts <- surveys_complete %>%
  group_by(year, genus) %>%
  summarize(n = n())

# surveys_complete %>%
#   count(year, genus)

ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                     color = genus)) +
  geom_line()
