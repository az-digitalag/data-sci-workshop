##### Format of if #####

if (conditional statement hat would be true) {
  do something
}

### Example of if ###

x <- 6
if (x > 5) {
  x <- x ^ 5
}

### Another example ###

veg_type <- "grass"
volume <- 16

if (veg_type == 3) {
  mass <- 2 * volume ^ 0.9
} else if (veg_type == "grass") {
  mass <- 0.5 * volume ^0.9
} else {
  mass <- NA
}


### Exercise ###

# Complete the following if statement so that if age_class is equal to "sapling"
# it sets <- y <- 10 and if age_class = "seedling" it sets y <- -5.

age_class = "seedling"

if (age_class == "sapling") {
  y <- 10
} else if (age_class == "seedling") {
  y <- -5
}
  
length <- 5
ifelse (length == 5, "correct", "incorrect")



################################################################################
################## S  E  S  S  I  O  N    7  ###################################
################################################################################

##### For loop structure #####

for (item in list_of_items) {
  do_something (item)
}

### Examples ###

volumes <- c(1.5, 3, 8)
for (volume in volumes) {
  print(2.6 * volume ^ 0.9)
}

for (volume in volumes) {
  mass <- 2.6 * volume ^ 0.9
  mass_lb <- mass * 2.2
  print(mass_lb)
}

volumes <- c( 1.6, 3, 8)
for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes [i] ^ 0.9
  print(mass)
}

# Empty vector
masses <- c()

# Empty vector of correct length
masses < - c( length = length(volumes))

# For loop to populate the empty vector
for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  masses[i] <- mass
}

radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = length(radius))
for (i in 1: length(radius)) {
  areas[i] <- pi * radius[i] ^ 2
}


download.file ("http://www.datacarpentry.org/semester-biology/data/locations.zip", 
               "data_raw/locations.zip")

unzip("data_raw/locations.zip", exdir = "data_raw")

### Read in the files ###

list.files() # This shows all the files currently in the working directory

data_files <- list.files(path = "data_raw", pattern = "locations-*", full.names = TRUE)

for (data_file in data_files) {
  data <- read.csv(data_file)
  count <- nrow(data)
  print(count)
}












