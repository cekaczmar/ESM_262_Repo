simulate_shark_population <- function(initial_population, growth_rate, carrying_capacity, time_steps, threat_factor = 1) {
  # Error checking
  if (!is.numeric(initial_population) || !is.numeric(growth_rate) ||
      !is.numeric(carrying_capacity) || !is.numeric(time_steps) ||
      !is.numeric(threat_factor) ||
      any(c(initial_population, growth_rate, carrying_capacity, time_steps, threat_factor) <= 0)) {
    stop("Invalid input. All parameters must be positive numbers.")
  }
  
  # Initialize a vector to store the shark population at each time step
  shark_population <- numeric(time_steps)
  
  # Simulate population growth using logistic growth model with a threat factor
  shark_population[1] <- initial_population
  for (t in 2:time_steps) {
    growth <- growth_rate * shark_population[t - 1] * (1 - shark_population[t - 1] / carrying_capacity) * threat_factor
    shark_population[t] <- shark_population[t - 1] + growth
  }
  
  # Return the simulated shark population vector
  return(shark_population)
}

# Example usage
# Uncomment the lines below to run the example
# shark_population <- simulate_shark_population(50, 0.1, 1000, 50, threat_factor = 0.8)
# plot(shark_population, type = 'l', xlab = 'Time Steps', ylab = 'Population', main = 'Shark Population Growth')