# Plotting cleaned portal surveys data

library(tidyverse)

# Load data
surveys_complete <- read_csv("data_clean/surveys_complete.csv")

# Plot
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length)) +
  geom_point(alpha = 0.3)
  

# Adding color as an axis representing genus
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length)) +
  geom_point(alpha = 0.3,
             aes(color = species_id))


ggplot(data = surveys_complete,
       mapping = aes(x = species_id,
                     y = weight,
                     color = species_id)) +
  geom_jitter(alpha = 0.3) +
  geom_boxplot(alpha = 0,
               color = "black")
