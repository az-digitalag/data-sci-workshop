################################################################################
################### S  E  S  S  I  O  N    7  B ################################
################################################################################

##### Plotting cleaned portal surveys data ######

library(dplyr)
library(readr)
#install.packages("ggplot2")
library(ggplot2)

# Components: data, mapping, geometry

##### Read in data #####

surveys_complete <- read_csv("data_clean/surveys_complete.csv")

## Basic ggplot format
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length)) + 
  geom_point()


# Adding translucent aspect to points
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length)) + 
  geom_point(alpha = 0.1)


# Changing the dots color
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
                     color = as.factor(plot_id))) + 
  geom_jitter(alpha = 0.1)
 
 


ggplot(data = surveys_complete,
         mapping = aes(x = species_id,
                       y = weight,
                       color = as.factor(species_id))) + 
           geom_jitter(alpha = 0.1) +
           geom_boxplot()



ggplot(data = surveys_complete,
       mapping = aes(x = species_id,
                     y = weight,
                     color = as.factor(species_id))) + 
  geom_jitter(alpha = 0.1) +
  geom_boxplot(alpha = 0,
               color = "black")


ggplot(data = surveys_complete,
       mapping = aes(x = species_id,
                     y = weight,
                     color = as.factor(species_id))) + 
  geom_jitter(alpha = 0.1) +
  geom_violin(alpha = 0,
              color = "black")

### Look at trends over time ###
# Summarize the dataset t give us counts by genus per year
yearly_counts <- surveys_complete %>%
  group_by(genus, year) %>%
  summarize(n = n())

surveys_complete %>%
  count(year, genus)

ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                     group = genus)) +
  geom_line()


ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                    color = genus)) +
  geom_line()
  
  


