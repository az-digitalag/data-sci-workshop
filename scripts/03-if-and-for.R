##### Format of if #####

if (conditional statement hat would be true) {
  do something
}

### Example of if ###

x <- 6
if (x > 5) {
  x <- x ^ 5
}

### Another example ###

veg_type <- "grass"
volume <- 16

if (veg_type == 3) {
  mass <- 2 * volume ^ 0.9
} else if (veg_type == "grass") {
  mass <- 0.5 * volume ^0.9
} else {
  mass <- NA
}


### Exercise ###

# Complete the following if statement so that if age_class is equal to "sapling"
# it sets <- y <- 10 and if age_class = "seedling" it sets y <- -5.

age_class = "seedling"

if (age_class == "sapling") {
  y <- 10
} else if (age_class == "seedling") {
  y <- -5
}
  
length <- 5
ifelse (length == 5, "correct", "incorrect")



