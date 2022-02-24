# Plotting cleaned portal surveys data
library(dplyr)
library(readr)
library(ggplot2)

# Read in data
surveys_complete <- read_csv("data_clean/surveys_complete.csv")

surveys_complete %>%
  count(genus)

surveys_complete %>%
  count(species_id)

# Basic ggplot format
ggplot(data = surveys_complete, 
       mapping = aes(x = weight,
                     y = hindfoot_length)) +
  geom_point(alpha = 0.1,
             color = "slateblue")

# Add color as an axis representing genus
ggplot(data = surveys_complete, 
       mapping = aes(x = weight,
                     y = hindfoot_length, 
                     color = genus)) +
  geom_point(alpha = 0.1)

# Add color as an axis representing genus
ggplot(data = surveys_complete, 
       mapping = aes(x = species_id,
                     y = weight, 
                     color = as.factor(plot_id))) +
  geom_point(alpha = 0.1)

# Add box plot
ggplot(data = surveys_complete, 
       mapping = aes(x = species_id,
                     y = weight, 
                     color = as.factor(species_id))) +
  geom_jitter(alpha = 0.1) +
  geom_boxplot(alpha = 0, 
               color = "black")

#### Plotting change over time ####
yearly_count <- surveys_complete %>%
  group_by(genus, year) %>%
  summarize (n = n())
 
ggplot(data = yearly_count, mapping = aes(x = year,
                                          y = n,
                                          color = genus)) + 
  geom_line()

#### Piping into ggplot ####
surveys_complete %>%
  group_by(genus, year) %>%
  summarize (n = n()) %>%
  ggplot(mapping = aes(x = year,
                      y = n,
                      color = genus)) + 
  geom_line()
  
# Facet_wrap
surveys_complete %>%
  group_by(genus, year, sex) %>%
  summarize (n = n()) %>%
  ggplot(mapping = aes(x = year,
                         y = n,
                       color = sex)) + 
  geom_line() +
  facet_wrap(~genus, 
             ncol = 2,
             scales = "free_y")

# Facet_grid
fig1 <- surveys_complete %>%
  group_by(genus, year, sex) %>%
  summarize (n = n()) %>%
  ggplot(mapping = aes(x = year,
                       y = n,
                       color = sex)) + 
  geom_line() +
  facet_grid(cols = vars(genus),
             rows = vars(sex),
             scales = "free_y")+
  theme_bw(base_size = 8)

#### Exporting plots ####
if(!dir.exists("plot")) {
  dir.create("plots")
}

ggsave(filename = "plots/Counts_by_genus.png", 
       plot = fig1,
       width = 8,
       height = 4,
       units ="in")

# Challenge : write a for loop to output time series of species count
# by genus. Save to the plots folder
genus <- unique(surveys_complete$genus)

for(g in genus) {
  fig_genus <- surveys_complete %>%
    filter(genus == g) %>%
    group_by(year, species) %>%
    summarize (n = n()) %>%
    ggplot(mapping = aes(x = year,
                         y = n,
                         color = species)) + 
    geom_line() +
    ggtitle(g)
  
ggsave(filename = paste0("plots/counts_genus_", g, ".png"), 
         plot = fig_genus,
         width = 8,
         height = 4,
         units ="in")
}
