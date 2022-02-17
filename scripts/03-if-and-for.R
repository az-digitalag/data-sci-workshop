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


