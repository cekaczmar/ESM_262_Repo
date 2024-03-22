#### Example Codes from Her Slides


### Lecture 3 - Slide 12? 
compute_power <- function(m, A, V) {
  g <- 9.8 # m/s^2, acceleration due to gravity
  p_air <- 1.2 # kg/m^3, density of air
  c_rolling <- 0.015
  c_drag <- 0.3
  
  Pb <- c_rolling * m * g * V + 0.5 * A * p_air * c_drag * V^3
  return(Pb)
}

heavy_truck_m = 31752 # kg
truck_A = 16 # m^2

# Speeds in m/s
speeds_m_s = c(30, 80/3.6, 120/3.6, 40/3.6, 5/3.6)

# Calculate power for each speed
heavy_truck_power = sapply(speeds_m_s, function(V) compute_power(heavy_truck_m, truck_A, V))

plot(speeds_m_s, heavy_truck_power, type = "b", col = "blue", xlab = "Speed (m/s)", ylab = "Power (Watts)", main = "Power vs. Speed", ylim = range(c(heavy_truck_power)))




light_vehicle_m = 15000 # kg

# Calculate power for each speed for the lighter vehicle
light_vehicle_power = sapply(speeds_m_s, function(V) compute_power(light_vehicle_m, truck_A, V))

# Add the lighter vehicle power to the existing plot
lines(speeds_m_s, light_vehicle_power, type = "b", col = "red")
legend("topright", legend=c("Heavy Truck", "Lighter Vehicle"), col=c("blue", "red"), lty=1:1)



### Sampling RMD Example
###Yes, you've got it! You need to save your autopower.R script to the 
# R_Functions folder within your working directory. Then, when you use 
#source("R_Functions/autopower.R"), R knows where to find and load your 
#function from.

#If you want to create multiple functions within the same script, 
#you can certainly do so. Just define each function one after the other
# in your R script. Here's an example of how you might structure a script 
# with multiple functions:

#r

#Copy code
# First function: autopower
autopower <- function(V, m, A) {
  # Function body
}

# Second function: anotherFunction
anotherFunction <- function(param1, param2) {
  # Function body
}

# Add as many functions as you need following the same pattern
#After defining all your functions, save this script with a name that 3
#reflects its contents or purpose, for instance, vehicle_functions.R, 
#inside your R_Functions directory. The file path would be something like:

#bash
#C:/Users/camil/OneDrive/Documents/UCSB/ESM 262/ESM_262_Repo/R_Functions/vehicle_functions.R
#To make all functions defined in vehicle_functions.R available in your R session, you would use the source function like before:


#source("R_Functions/vehicle_functions.R")
#This way, after sourcing, all functions defined in that script will 
#be available for use in your R session.

# Remember, when saving your script with multiple functions, 
# choose a file name that makes it easy for you and others to understand
# what types of functions the script contains. This is part of good coding 
#practices, helping keep your work organized and understandable.


source("Examples_From_Her_Slides/autopower.R")






#### Looping RMD ### 
library(purrr)
