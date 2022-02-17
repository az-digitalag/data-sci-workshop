# Data manipulation with dplyr and tidyr

# Load libraries
library(readr)
library(dplyr)
library(udunits2)
library(ggplot2)
library(tidyr)

# Load data from csv
surveys <- read_csv("data_raw/portal_data_joined.csv")
str(surveys)

# Restrict rows with filter()
filter(surveys, genus == "Neotoma")

# Restrict columns with select
select(surveys, # data
       record_id, species_id, weight) # columns

select(surveys,
       -day, -month, -year) # columns that I want to remove

# Linking functions with piping
surveys1995 <- surveys %>%
                filter(year == 1995) %>%
                select(-record_id, -species_id, -day) %>% 
                head(5)

# Making a new column with mutate()
surveys %>%
  select(-day, -record_id, -species_id) %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg = weight / 1000,
         weight_lb = ud.convert(weight, "g", "lb"))

# Challenge question
surveys %>%
  mutate(hindfoot_cm = ud.convert(hindfoot_length, "mm", "cm")) %>%
  select(species_id, hindfoot_cm) %>%
  filter(!is.na(hindfoot_cm)) %>%
  filter(hindfoot_cm < 3) %>%
  head(15)

# Split-apply-combine 
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, species_id) %>%
  summarize(mean_weight = mean(weight),
            sd_weight   = sd(weight),
            max_weight  = max(weight),
            n           = n()) %>%
  arrange(desc(max_weight)) 

# Reshaping data
surveys_gw <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(plot_id, genus) %>%
  summarize(mean_weight = mean(weight)) 

surveys_wide <- surveys_gw %>%
  pivot_wider(names_from  = genus,
              values_from = mean_weight)

surveys_long <- surveys_wide %>%
  pivot_longer(-plot_id,
               names_to  = "genus",
               values_to = "mean_weight") %>%
  filter(!is.na(mean_weight))

# Challenge question
surveys %>%
  group_by(plot_id, year) %>%
  summarize(count = n_distinct(genus)) %>%
  pivot_wider(names_from  = year,
              values_from = count)

# Exporting filtered data
surveys_complete <- surveys %>%
  filter(!is.na(weight),
         !is.na(hindfoot_length),
         !is.na(sex))

# Most common species
species_counts <- surveys_complete %>% 
  count(species_id) %>%
  filter(n > 50)

# Only keep the most common species
surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_counts$species_id)

write_csv(surveys_complete, file = "data_clean/surveys_complete.csv")
