# Load required libraries
# tidyverse: For data manipulation and visualization
# broom: For tidying model outputs into data frames
library(tidyverse)
library(broom)

# Load the iconicity dataset
icon <- read_csv("perry_winter_2017_iconicity.csv")

# Display first 4 rows with all columns
icon %>% print(n = 4, width = Inf)

# Create a log-transformed frequency variable
# Logarithm helps normalize skewed frequency distributions
icon <- mutate(icon, log10freq = log(Freq))

# View the entire dataset in a spreadsheet-like format
view(icon)

# Fit linear regression model with original predictors
# Predicting Iconicity based on:
# SER (Sensory Experience Rating)
# CorteseImag (Imagery rating)
# Syst (Systematicity measure)
# log10freq (Log-transformed word frequency)
icon_mdl <- lm(Iconicity ~ SER + CorteseImag + Syst + log10freq,
               data = icon)

# Extract and display R-squared value (model fit)
glance(icon_mdl)$r.squared

# Display model coefficients (unstandardized)
tidy(icon_mdl) %>% select(term, estimate)

# Display rounded coefficients for readability
tidy(icon_mdl) %>% select(term, estimate) %>% 
  mutate(estimate = round(estimate, 1))

# Create standardized (z-scored) versions of predictors
# Standardization allows comparison of effect sizes across variables
# scale() subtracts mean and divides by standard deviation
icon <- mutate(icon, 
               SER_z = scale(SER), 
               CorteseImag_z = scale(CorteseImag), 
               Syst_z = scale(Syst),
               Freq_z = scale(log10freq))

# Fit model with standardized predictors
icon_mdl_z <- lm(Iconicity ~ SER_z + CorteseImag_z + Syst_z + Freq_z, 
                 data = icon)

# Display R-squared for standardized model
# Should be identical to unstandardized model R-squared
glance(icon_mdl_z)$r.squared

# Extract residuals from standardized model
res <- residuals(icon_mdl_z)

# Set up plotting layout: 1 row, 3 columns
par(mfrow = c(1, 3))

# Diagnostic plots for checking linear regression assumptions:
# 1. Histogram of residuals (checking normality)
hist(res)
# 2. Q-Q plot (quantile-quantile plot for normality check)
qqnorm(res)
qqline(res)  # Adds reference line for perfect normality
# 3. Residuals vs fitted values (checking homoscedasticity)
plot(fitted(icon_mdl_z), res)

# Extract coefficients with confidence intervals, excluding intercept
mycoef <- tidy(icon_mdl_z, conf.int = TRUE) %>% 
  filter(term != '(Intercept)')

# Create coefficient plot (not yet ordered)
mycoef %>% ggplot(aes(x = term, y = estimate)) + 
  geom_point() +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
  theme_minimal()

# Order predictors by coefficient size (ascending)
pred_order <- arrange(mycoef, estimate)$term
pred_order

# Convert term to factor with ordered levels
mycoef <- mutate(mycoef, term = factor(term, levels = pred_order))

# Create final coefficient plot with horizontal orientation
# Shows effect sizes with 95% confidence intervals
mycoef %>% ggplot(aes(x = term, y = estimate)) + 
  geom_point() +
  geom_errorbar(aes(ymin = conf.low, ymax = conf.high), width = 0.2) +
  theme_minimal() + 
  coord_flip()  # Flip coordinates for horizontal bars