# Plotting cleaned portal surveys data

library(dplyr)
library(readr)
library(ggplot2)

# read in data
surveys_complete <- read_csv("data_clean/surveys_complete.csv")

# basic ggplot format
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length)) +
  geom_point(alpha = 0.1
             color = "slateblue")


# add color as an axis representing genus
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length,
                     color = species)) +
  geom_point(alpha = 0.1)

      # challenge question
      ggplot(data = surveys_complete,
             mapping = aes(x = species_id,
                           y = weight,
                           color = species_id)) +
        geom_jitter(alpha = 0.1) +
        geom_boxplot(alpha = 0,
                     color = "black")

# trends over time
yearly_counts <- surveys_complete %>%
  group_by(year, genus) %>%
  summarize(n = n())

ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                     color = genus)) +
  geom_line()












