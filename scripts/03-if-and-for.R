# Control Flow: If statements

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
age_class <- "seedling"
if (age_class == "sapling"){
  y <- 10
} else if (age_class == "seedling"){
  y <- -5
}
y


#case_when() # more useful than if/else (dplyR)
#ifelse() # takes conditional statement, if its true do this, if its false do this

# 2/22/22: for loops

volumes <- c(1.5, 3, 8)
for (volume in volumes) {
  print(2.6 * volume ^ 0.9)
}

for (volume in volumes) {
  mass <- 2.6 * volume ^ 0.9
  mass_lb <- mass * 2.2
}

masses <- c() # define empty vector
masses <- c(length = length(volumes)) # define length of vector ahead of time, it supposedly saves time
for (volume in volumes) {
  mass <- 2.6 * volume ^ 0.9
  masses <- c(masses, mass) # concatenate new values on
}

masses <- c() # define empty vector
masses <- c(length = length(volumes)) # define length of vector ahead of time, it supposedly saves time
for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  print(mass)
}

radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = 3)
for (i in 1:length(areas)){
  areas[i] <- pi * radius[i] ^ 2
}
areas

# sprintf() = can set number of trailing zeros


# MOre advanced stuff for dealing with files

download.file("http://www.datacarpentry.org/semester-biology/data/locations.zip",
              "data_raw/locations.zip") # should download data into your working directory
unzip("data_raw/locations.zip")
data_files <- list.files(pattern = "locations-*", full.names = TRUE)

for (file in data_files) {
  data <- read.csv(file)
  count <- nrow(data)
  print(count)
}

## 



