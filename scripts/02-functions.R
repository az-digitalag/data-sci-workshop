##### Form of a function #####
function_name <- function(inputs) {
  output_value <- do_something(inputs)
  return(output_value)
}

##### Write our own functions #####
calc_shrub_vol <- function(lenght, width, height) {
  area <- lenght * width
  volume <- area *height
  return(volume)
}

calc_shrub_vol(2,3,5)

# Set default values
calc_shrub_vol <- function(length, width, height = 1) {
  volume <- length * width * height
  return (volume)
}

calc_shrub_vol(3, 10)
calc_shrub_vol(3, 10, height = 2)
cal_shrub_vol(3, 10, 2)

mass = a * length^b

get_mass_from_length_theropoda <- function (length) {
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

get_mass_from_length_theropoda(16)     #17150.56

get_mass_from_length <- function (a, b) {
  mass <- a * 26 ^ b
  return(mass)
}

get_mass_from_length(a=214.44, b=1.46)



