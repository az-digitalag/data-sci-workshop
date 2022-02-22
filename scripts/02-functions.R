### Form of a function ###
#function_name <- function(inputs) {
#  output_value <- do_something(inputs)
#  return(output_value)
#}

# R can't see any unreturned variables in function 

### Write out own functions ###
calc_shrub_vol <- function(length, width, height) {
  area <- length * width 
  volume <- area * height
  return(volume)
}

shrub_vol <- calc_shrub_vol(3,1,2)


### Set defaults for functions ###
calc_shrub_vol <- function(length, width, height = 1) {
  area <- length * width 
  volume <- area * height
  return(volume)
}

get_mass_from_length <- function(a, b, length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

get_mass_from_length_theropoda(a=214.44, b=1.46, length=26)

