### Format of if ###

if (conditional statement that would be true) {
  do something
}

### Example of if ###
x <- 4

if (x > 5){
  x <- x ^ 5
}

### Another example ###

veg_type <- "forb"
volume <- 16
if (veg_type == "tree") {
  mass <- 2 * volume ^ 0.9
} else if (veg_type == "grass") {
  mass <- 0.5 * volume ^ 0.9
} else {
  mass <- NA
}

### Exercise ###

age_class = "seedling"
if (age_class == "seedling") {
y <- 5  
} else if (age_class == "sapling") {
  y <- 10
}
y


#### For loop structure ####

for (item in list_of_items) {
  do_something(item)
}

#### Examples ####

volumes <- c(1.5, 3, 8)

volumes <- c(1.5, 3, 8)
for (volume in volumes) {
  print(2.6 * volume ^ 0.9)
}

for (volume in volumes) {
  mass <- 2.6 * volume ^ 0.9
  mass_lb <- mass * 2.2
  print(mass_lb)
}

for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  print(mass)
}

# save output in a vector
# first create an empty vector called masses

# this is just a general empty vector
masses <- c() 

# this is an empty vector of correct length
masses <- c(length = length(volumes)) 

for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  masses[i] <- mass
}

#### exercises ####

radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = length(radius))
areas <- c()

for (i in 1:length(radius)) {
  areas[i] <- pi * radius[i] ^ 2
}
areas

### this gives errors, will try to debug later ###

download.file(mode = "wb", "http://www.datacarpentry.org/semester-biology/data/locations.zip
", "data_raw/locations.zip")

unzip("data_raw/locations.zip", exdir = "data_raw")

### after unzipping

list.files()

data_files <- list.files(path = "data_raw", pattern = "locations-*", full.names = TRUE)

for (data_file in data_files) {
  data <- read.csv(data_file)
  count <- nrow(data)
  print(count)
}

