#Kunal Palawat
#Description: intro to ifelse

#Format ----

# if (conditional statement that would be true) {
#   do something
# }

#Examples ----
x <- 6
if(x>5){
  x <- x^5 
}
print(x)


veg_type <- "forb"

volume <- 16
if (veg_type == "tree"){
  mass <- 2*volume^0.9
} else if (veg_type == "grass"){
  mass <- .5*volume^0.9
} else {
  mass <- NA
}
print(mass)


# Complete the following if statement so that if age_class is equal to “sapling” it sets y <- 10 and if age_class is equal to “seedling” it sets y <- 5.
age_class = "sapling"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- 5
}
print(y)

#For Loops ----

# for (item in list_of_items) {
#   do_something(item)
# }

volumes <- c(1.5, 3, 8)
for (volume in volumes) {
  print(2.6 * volume ^ 0.9)
}

volumes <- c(1.5, 3, 8)
for (volume in volumes) {
  mass <- 2.6 * volume ^ 0.9
  mass_lb <- mass*2.2
  print(mass_lb)
}

volumes <- c(1.6, 3, 8)
for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  print(mass)
}

#empty vecor
masses <- c()
#or empty vector of known length
masses <- c(length = length(volumes))
for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  masses[i] <- mass
}

masses_2 <- c()
for (volume in volumes) {
  mass <- 2.6 * volume ^ 0.9
  masses_2 <- c(masses_2, mass)
}

#example
radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = length(radius))
for (i in 1:length(radius)){
  areas[i] <- pi * radius[i] ^ 2
}
areas

download.file("http://www.datacarpentry.org/semester-biology/data/locations.zip", "data_raw/locations.zip")
unzip("data_raw/locations.zip", exdir = "data_raw")

data_files <- list.files(path = "data_raw", pattern = "locations-*", full.names = TRUE)

for (data_file in data_files) {
  data <- read.csv(data_file)
  count <- nrow(data)
  print(count)
}
