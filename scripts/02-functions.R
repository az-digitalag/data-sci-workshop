#### form of a function ###
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

shrub_vol <- calc_shrub_vol(2, 3.5, 4)

calc_shrub_vol2 <- function(length, width, height) {
  volume <- length * width * height
  return(volume)
}

calc_shrub_vol <- function(length, width, height = 1) {
  area <- length * width
  volume <- area * height
  return(volume)
}

calc_shrub_vol(3, 10)
calc_shrub_vol(3, 10, height = 2)
calc_shrub_vol(width = 20, length = 5)

mass = a * length^b

get_mass_from_length_theropoda <- function(length) {
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

Spinosaurus_mass <- get_mass_from_length_theropoda(16)
Spinosaurus_mass

get_mass_from_length <- function(length, a, b) {
  mass <- a * length ^ b
  return(mass)
}

get_mass_from_length(a = 214.44, b = 1.46, length = 26)
