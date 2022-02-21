# Form of a function
function_name <- function(inputs) {
  output_value <- do_something(inputs)
  return(output_value)  
}

### Write our own functions ###
calc_shrub_vol <- function(length, width, height) {
  area <- length * width
  volume <- area * height
  return(volume)
}

calc_shrub_vol(2, 3.5, 4)

# Test 
get_mass_from_length_theropoda <- function(length) {
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

get_mass_from_length_theropoda(16)

get_mass_from_length <- function(length, a, b) {
  mass <- a * length ^ b
  return(mass)
}

get_mass_from_length(26, 214.44, 1.46)

### Example of if statements ###
x <- 6
if (x > 5) {
  x <- x ^ 5
}

veg_type <- "grass"
volume <- 16
if (veg_type == "tree") {
  mass <- 2* volume ^ 0.9
} else if (veg_type == "grass") {
  mass <- 0.5 * volume ^ 0.9 
} else {
  mass <- NA
}
mass

age_class = "seedling"
if (age_class == "sapling") {
  y <- 10
} else if (age_class == "seedling") {
  y <- -5 
}
y







