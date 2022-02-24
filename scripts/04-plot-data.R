# Plotting cleaned portal surveys data

library(tidyverse)

# Load data
surveys_complete <- read_csv("data_clean/surveys_complete.csv")
surveys_complete <- surveys_complete %>% 
  filter(!is.na(sex))

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

# Genus count
yearly_counts <- surveys_complete %>% 
  group_by(year, genus) %>% 
  summarize(n = n())

ggplot(data = yearly_counts,
       aes(x = year,
           y = n,
           color = genus)) +
  geom_line()


# Piping into ggplot
surveys_complete %>% 
  group_by(year, genus) %>% 
  summarize(n = n()) %>% 
  ggplot(aes(x = year,
             y = n,
             color = genus)) +
  geom_line() 

# Faceting
ggplot(data = yearly_counts,
       aes(x = year,
           y = n)) +
  geom_line() +
  facet_wrap(~genus,
             scales = "free_y")

surveys_complete %>% 
  group_by(year, genus, sex) %>% 
  summarise(n = n()) %>% 
  ggplot(aes(x = year,
             y = n,
             color = sex)) +
  geom_line() +
  facet_wrap(~genus,
             ncol = 4,
             scales = "free_y")

fig1 <- surveys_complete %>% 
  group_by(year, genus, sex) %>% 
  summarise(n = n()) %>% 
  ggplot(aes(x = year,
             y = n,
             color = sex)) +
  geom_line() +
  facet_grid(cols = vars(genus),
            rows = vars(sex),
             scales = "free_y")

# Create directory if it doesn't exist
if(dir.exists("plots") == FALSE) {
  dir.create("plots")
}

# Another way to create directory
if(!dir.exists("plots")) {
  dir.create("plots")
}

ggsave(filename = "plots/counts_genus.png",
       plot = fig1,
       width = 6,
       height = 4,
       units = "in")

genus <- unique(surveys_complete$genus)
for(g in genus) {
  fig <- surveys_complete %>% 
    filter(genus == g) %>% 
    group_by(year, species_id) %>% 
    summarise(n = n()) %>% 
    ggplot(aes(x = year,
               y = n,
               color = species_id)) +
    geom_line() +
    ggtitle(g) +
    theme_bw()
  print(fig)
  ggsave(filename = paste("plots/count_species_", g, ".png", sep = ""),
         plot = fig,
         width = 6,
         height = 4,
         units = "in")
}


