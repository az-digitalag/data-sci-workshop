#Kunal Palawat
#Description: intro to functions


#Format ----
#typically have one output per function
#intermediate objects are not saved - they are temporary objects used in the function only

# function_name <- function(inputs) {
#   output_value <- do_something(inputs)
#   return(output_value)
# }

#Shrub Volume ----
calc_shrub_vol <- function(length, width, height = 1){ #set defaults within function()
  area <- length * width 
  volume <- area * height
  return(volume)
}

shrub_vol <- calc_shrub_vol(2,3.5,4)


#Dinosour mass ----
#mass = a * length^b

# 1. Use this function to print out the mass of a Spinosaurus that is 16 m long based on its reassembled skeleton.
get_mass_from_length_theropoda <- function(length){
  mass <- 0.73 * length ^ 3.63
  return(mass)
}

get_mass_from_length_theropoda(length = 16)

# 2. Create a new version of this function called get_mass_from_length() that estimates takes length, a and b as arguments and uses the following code to estimate the mass mass <- a * length ^ b. Use this function to estimate the mass of a Sauropoda (a = 214.44, b = 1.46) that is 26 m long.


get_mass_from_length_dino <- function(length, a, b){
  mass <- a * length ^ b
  return(mass)
}

get_mass_from_length_dino(length = 26, a = 214.44, b = 1.46)






