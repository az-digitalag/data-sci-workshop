#Kunal Palawat
#Description: plot data

library(dplyr)
library(readr)
library(ggplot2)

surveys_complete <- read_csv("data_clean/surveys_complete.csv")

#basic ggplot format
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length))+
  geom_point()

#transparency
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length))+
  geom_point(alpha = 0.1)

#color
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length))+
  geom_point(mapping = aes(color = genus),
             alpha = 0.1)

#OR

ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y = hindfoot_length,
                     color = genus))+
  geom_point(alpha = 0.1)

#Use what you just learned to create a scatter plot of weight over species_id with the plot types showing in different colors. Is this a good way to show this type of data?
ggplot(data = surveys_complete,
       mapping = aes(x = species_id,
                     y = weight,
                     color = as.factor(plot_id)))+
  geom_jitter(alpha = 0.1)


ggplot(data = surveys_complete,
       mapping = aes(x = species_id,
                     y = weight,
                     color = as.factor(species_id)))+
  geom_jitter(alpha = 0.1)+
  geom_boxplot(alpha = 0,
               color = "black")

#plotting change over time
surveys_complete %>%
  group_by(genus, year) %>%
  summarize(n = n())
#or
yearly_counts <- surveys_complete %>%
  count(genus, year)

ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                     color = genus))+
  geom_line()

















