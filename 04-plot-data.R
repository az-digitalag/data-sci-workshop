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
  geom_point(alpha = 0.1,
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


# piping into ggplot (don't use yearly counts object, pipe direct (this means you can't layer though))
surveys_complete %>%
  group_by(year, genus) %>%
  summarize(n = n()) %>%
  ggplot(mapping = aes(x = year, 
                       y = n,
                       color = genus)) +
  geom_line()


# faceting (easy way to make several panels) --> put each genus in its own panel (even scales axes for comparison)
  # use scales = "free" or "free_y" or "free_x" within facet_wrap to see genus-specific scales
ggplot(data = yearly_counts,
       mapping = aes(x = year,
                     y = n,
                     color = genus)) +
  geom_line() +
  facet_wrap(facet = vars(genus))

# facet by multiple factors
fig <- surveys_complete %>%
  group_by(year, genus, sex) %>%
  summarize(n=n()) %>%
  ggplot(mapping = aes(x = year, 
                       y = n, 
                       color= sex)) +
  geom_line() +
  facet_wrap(~genus, ncol = 2)

#facet_grid
fig1 <- surveys_complete %>%
  group_by(year, genus, sex) %>%
  summarize(n=n()) %>%
  ggplot(mapping = aes(x = year, 
                       y = n, 
                       color= sex)) +
  geom_line() +
  facet_grid(cols = vars(genus),
             rows = vars(sex)) +
  theme_classic(base_size = 16)

# save out plots / exporting plots (first check if you have a plots folder and then create one)
if(dir.exists("plots") == FALSE) {
  dir.create("plots")
}
ggsave(filename = "plots/counts_genus.png",
       plot = fig,
       width = 6,
       height = 4,
       units = "in")


# use cowplot to make panels of different data







### CHALLENGE: write a for loop to output time series of species counts by genus. Save to plots folder (window for each genus showing line of species counts over time)
genus <- unique(surveys_complete$genus)

for (g in genus) {
  fig_genus <- surveys_complete %>%
    filter(genus == g) %>%
    group_by(year, species_id) %>%
    summarize(n = n()) %>%
    ggplot(mapping = aes(x = year,
                       y = n,
                       color = species_id)) +
    geom_line() +
    ggtitle(g)
  
  print(fig_genus)
  
  ggsave(filename = paste0("plots/count_species_", g, ".png"),
       plot = fig_genus,
       width = 6,
       height = 4,
       units = "in")
}


