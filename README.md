# Iconicity Analysis: Perry & Winter (2017) Data Analysis

## 📋 Project Overview
This R script performs a comprehensive statistical analysis of linguistic iconicity using data from Perry & Winter's (2017) study. Iconicity refers to the direct resemblance between a word's form and its meaning (e.g., "buzz" sounding like the noise bees make). The analysis examines how various linguistic and psychological factors predict iconicity ratings.

## 📊 Dataset Information
**Source:** Perry, L. K., & Winter, B. (2017). *Iconicity in the speech of children and adults.*
- **Filename:** `perry_winter_2017_iconicity.csv`
- **Key Variables:**
  - `Iconicity`: Degree of sound-meaning resemblance (dependent variable)
  - `SER`: Sensory Experience Rating
  - `CorteseImag`: Imagery rating (from Cortese imagery norms)
  - `Syst`: Systematicity measure (phonological systematicity)
  - `Freq`: Word frequency (raw count)

## 🎯 Analysis Objectives
1. Investigate predictors of linguistic iconicity
2. Compare effect sizes of different predictors through standardization
3. Validate regression assumptions through diagnostic checks
4. Visualize standardized coefficients for interpretability

## 🔍 Statistical Methods

### 1. **Data Preparation**
- Log-transformation of word frequency (`log(Freq)`) to handle skewed distributions
- Z-score standardization of all predictors for effect size comparison

### 2. **Regression Models**
- **Model 1 (Unstandardized):** Linear regression with raw predictors
- **Model 2 (Standardized):** Linear regression with z-scored predictors

### 3. **Model Diagnostics**
- Residual analysis: Histogram, Q-Q plot, Residuals vs. Fitted plot
- Assumption checking for linearity, normality, and homoscedasticity

### 4. **Visualization**
- Coefficient plots with 95% confidence intervals
- Ordered predictor display based on effect size

## 📁 Code Structure

### Section 1: Setup & Data Loading
```r
# Load libraries and import data
```

### Section 2: Data Transformation
```r
# Create log10freq and standardized variables
```

### Section 3: Regression Analysis
```r
# Fit unstandardized and standardized models
# Extract model statistics
```

### Section 4: Model Diagnostics
```r
# Generate diagnostic plots
```

### Section 5: Visualization
```r
# Create ordered coefficient plot
```

## 🛠️ Required Packages
- `tidyverse` (v1.3.0+): Data manipulation and visualization
- `broom` (v0.7.0+): Tidying model outputs
- Base R: Statistical functions and plotting

## 📈 Key Findings Interpretation

### Coefficient Direction & Magnitude
- **Positive coefficients:** Variable increases iconicity
- **Negative coefficients:** Variable decreases iconicity
- **Larger absolute values:** Stronger predictive power

### Standardized vs. Unstandardized Coefficients
- **Unstandardized:** Interpreted in original units
- **Standardized (z-scored):** Allows direct comparison across predictors
- **Note:** R² remains identical between models

## 💻 Usage Instructions

### 1. **Setup**
```r
# Set working directory to location of data file
setwd("path/to/your/data")
```

### 2. **Run Analysis**
```r
source("iconicity_analysis.R")
```

### 3. **Outputs Generated**
- Console output: R² values and coefficients
- Diagnostic plots: 3-panel residual analysis
- Final visualization: Ordered coefficient plot

## ⚠️ Important Notes

### Data Requirements
- CSV file must have exact column names as specified
- No missing values recommended for regression
- Consider checking for multicollinearity if extending analysis

### Statistical Assumptions
1. **Linearity:** Relationship between predictors and iconicity is linear
2. **Independence:** Observations are independent
3. **Normality:** Residuals are normally distributed
4. **Homoscedasticity:** Constant variance of residuals

## 🔄 Potential Extensions

### 1. **Model Improvements**
```r
# Add interaction terms
# Include polynomial terms
# Try robust regression methods
```

### 2. **Additional Diagnostics**
```r
# Variance Inflation Factor (VIF) for multicollinearity
# Cook's distance for influential points
# Breusch-Pagan test for heteroscedasticity
```

### 3. **Enhanced Visualization**
```r
# Add effect size labels
# Include R² in plot titles
# Color-code by significance level
```

## 📚 Theoretical Context
This analysis contributes to the study of **linguistic iconicity**, an important aspect of:
- Psycholinguistics and language acquisition
- Sound symbolism and phonosemantics
- Cross-modal perception
- Evolution of language systems

## 📊 Expected Output Example
```
R-squared (both models): ~0.XX

Standardized Coefficients (ordered):
1. Predictor_A: β = X.XX [CI: X.XX - X.XX]
2. Predictor_B: β = X.XX [CI: X.XX - X.XX]
3. Predictor_C: β = X.XX [CI: X.XX - X.XX]
```

## 🤝 Citation
When using this analysis, please cite the original data source:
Perry, L. K., & Winter, B. (2017). Iconicity in the speech of children and adults. *Developmental Science.*

---

## 📧 Contact & Support
For questions about the analysis methodology or code implementation, please ensure you have:
1. Checked the dataset format matches requirements
2. Verified all required packages are installed
3. Reviewed the diagnostic plots for assumption violations

---

*This analysis provides a template for investigating predictors of linguistic phenomena using regression techniques and visualization best practices.*
