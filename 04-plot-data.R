# Plotting cleaned portal surveys data

library(dplyr)
library(readr)
library(ggplot2)

# Read in data
surveys_complete <- read_csv("data_clean/surveys_complete.csv")


# Basic ggplot format (needs 1) data, 2) mapping, and 3) geometry
# aes what goes on x vs y axis. The plus sign must be on line before
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y= hindfoot_length)) + 
  geom_point()


# Above is equivalent to 
ggplot(data = surveys_complete) +
  geom_point(mapping = aes(x = weight,
                            y= hindfoot_length))

# But the first is saying we are using same mapping for each geometry, bu
# if we want to add graphics on top its better to add the mapping to each geometry 
# the second version

# alpha controls translucency

ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y= hindfoot_length)) + 
  geom_point(alpha = 0.1,
             color = 'slateblue')
# coral is another color. THere is a wes anderson color palette
# also here: https://github.com/EmilHvitfeldt/r-color-palettes


surveys_complete %>%
  count(genus)

# You can also color code by genus (genus is mapped to a color which is why it moved to aes())
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y= hindfoot_length,
                     color = genus)) + 
  geom_point(alpha = 0.1)

# Challenge question
# use geom_jitter to spread out points 
# can use geom_violin to show a histogram of points that is mirrored
ggplot(data = surveys_complete,
       mapping = aes(x = weight,
                     y= species_id,
                     color = as.factor(species_id))) + 
  geom_jitter(alpha = 0.1) + 
  geom_boxplot(alpha = 0.1, 
               color = 'black')


# Its nice to combine dplyr and ggplot b/c it allows for different parsigng of data
yearly_counts <- surveys_complete %>%
  group_by(year, genus) %>%
  summarize(n = n())

# yearly_counts <- surveys_complete %>%
#  count(year, genus)

# color assumes you want to group so you can just use color
ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                     group = genus)) +
  geom_line()

# ctrl-shift-c to comment chuck of code
