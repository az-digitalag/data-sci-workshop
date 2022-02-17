#Data Manip

#load packages
library(readr)
library(dplyr)
library(udunits2) #unit conversions
library(tidyr)

#load data
surveys <- read_csv("data_raw/portal_data_joined.csv")
str(surveys)

#Restricting data
#Rows
filter(surveys, genus == "Neotoma")

#Columns
select(surveys, record_id, species_id, weight)
select(surveys, -record_id, -species_id, -day)

#linking together functions via piping. Compatible with some base R functions, but mostly not
surveys %>%
  filter(year == "1995") %>%
  select(-record_id, -species_id, -day) 

#making a new calculated column using mutate
surveys %>%
  select(-record_id, -month, -day, -plot_id, -taxa, -plot_type) %>%
  filter(!is.na(weight)) %>%
  mutate(weight_kg = weight/1000,
         weight_lb = ud.convert(weight, "g", "lb"))

#Create a new data frame from the surveys data that meets the following criteria: contains only the species_id column and a new column called hindfoot_cm containing the hindfoot_length values (currently in mm) converted to centimeters. In this hindfoot_cm column, there are no NAs and all values are less than 3.
surveys %>%
  select(species_id, hindfoot_length) %>%
  mutate(hindfoot_cm = ud.convert(hindfoot_length, "mm", "cm")) %>%
  select(species_id, hindfoot_cm) %>%
  filter(hindfoot_cm < 3)

#split-apply-combine with gorup_by() and summarize()
surveys %>%
  filter(!is.na(weight)) %>%
  group_by(sex, genus) %>%
  summarize(mean_weight = mean(weight, na.rm = T), #na.rm not necessary if filtered by na earlier on
            sd_weight = sd(weight, na.rm=T),
            max_weight = max(weight),
            n = n()) %>%
  arrange(desc(max_weight))

#counting options
surveys %>% 
  count(sex, genus)

#reshaping data with pivot_longer and pivot_wider
surveys_gw <- surveys %>%
  filter(!is.na(weight)) %>%
  group_by(plot_id, genus) %>%
  summarize(mean_weight=mean(weight))

surveys_wide <- surveys_gw %>%
  pivot_wider(names_from = genus,
              values_from = mean_weight)

surveys_long <- surveys_wide %>%
  pivot_longer(-plot_id,
               names_to = "genus",
               values_to = "mean_weight") %>%
  filter(!is.na(mean_weight))

#Spread the surveys data frame with year as columns, plot_id as rows, and the number of genera per plot as the values. You will need to summarize before reshaping, and use the function n_distinct() to get the number of unique genera within a particular chunk of data. It’s a powerful function! See ?n_distinct for more.
dat <- surveys %>%
  group_by(plot_id, year) %>%
  summarize(genera = n_distinct(genus)) %>%
  pivot_wider(names_from = year,
              values_from = genera)

#Export final data
surveys_complete <- surveys %>%
  filter(!is.na(weight),
         !is.na(hindfoot_length),
         !is.na(sex))

#most common species
species_counts <- surveys_complete %>%
  count(species_id) %>%
  filter(n > 50)

#most common species in final spreadsheet
surveys_complete <- surveys_complete %>%
  filter(species_id %in% species_counts$species_id)

#export csv
write.csv(surveys_complete, "data_clean/surveys_complete.csv")


#case_when
