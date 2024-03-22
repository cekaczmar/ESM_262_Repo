# Coral Reef Health Estimator
estimate_reef_health <- function(temp_C, pH, fish_density) {
  # Error checking
  if(temp_C < 0 || pH < 0 || fish_density < 0) {
    stop("Inputs cannot be negative.")
  }
  
  # Assess coral stress level based on temperature and pH
  stress_level <- case_when(
    temp_C > 30 || pH < 7.5 || pH > 8.4 ~ "High",
    temp_C > 28 || (pH >= 7.5 && pH <= 8.4) ~ "Medium",
    TRUE ~ "Low"
  )
  
  # Calculate reef health score
  health_score <- min(100, 100 - (temp_C - 25) * 2 - (abs(pH - 8) * 10) + fish_density * 5)
  health_score <- max(0, health_score) # Ensure score is not negative
  
  # Results
  list(stress_level = stress_level,
       reef_health_score = health_score)
}

