### Autopower Script ####

autopower <- function(V, A, m) {
  # Constants
  g <- 9.8 # Acceleration due to gravity in m/s^2
  rho <- 1.225 # Density of air in kg/m^3 (at sea level and at 15°C)
  cdrag <- 0.3 # Drag coefficient, assuming a common value
  
  # Power calculation
  Pb <- (0.5 * rho * A * cdrag * V^3) + (m * g * V)
  return(Pb)
}
