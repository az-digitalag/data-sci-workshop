
##### For loop structure ####

volumes <- c(1.5, 3, 8)
for (volume in volumes) {
  print(2.6 * volume ^ 0.9)
}

volumes <- c(1.5, 3, 8)
for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  print(mass)
}

volumes <- c(1.5, 3, 8)
masses <- c()
# or masses <- c(length = length(volumes))
for (i in 1:length(volumes)) {
  mass <- 2.6 * volumes[i] ^ 0.9
  masses[i] <- mass
}

radius <- c(1.3, 2.1, 3.5)
areas <- vector(mode = "numeric", length = length(radius))
for (i in 1:length(areas)){
  areas[i] <- pi * radius[i] ^ 2
}
areas

download.file("http://www.datacarpentry.org/semester-biology/data/locations.zip", "data_raw/locations.zip")
unzip("data_raw/locations.zip", exdir="/data_raw")
list.files(path = "/data_raw", pattern = "data_raw/locations-*", full.names = TRUE)

