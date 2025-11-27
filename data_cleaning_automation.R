############################################################
# R DATA AUTOMATION MINI-TOOL
# Author: Dhanusri N
# Description:
# This script automates basic data cleaning and exploratory analysis for any CSV dataset.
############################################################

# 1. SET WORKING DIRECTORY (OPTIONAL)
# setwd("your/folder/path")

# 2. LOAD DATA
data <- read.csv("raw_data.csv", stringsAsFactors = FALSE)

cat("✅ Data loaded successfully.\n")

# 3. BASIC STRUCTURE CHECK
cat("\n--- DATA STRUCTURE ---\n")
str(data)

# 4. MISSING VALUE DETECTION
cat("\n--- MISSING VALUES PER COLUMN ---\n")
missing_values <- colSums(is.na(data))
print(missing_values)

# 5. NUMERIC VARIABLE STANDARDISATION
numeric_columns <- sapply(data, is.numeric)

data[numeric_columns] <- scale(data[numeric_columns])

cat("\n✅ Numeric variables have been standardised.\n")

# 6. SUMMARY STATISTICS
cat("\n--- SUMMARY STATISTICS ---\n")
summary(data)

# 7. AUTOMATED CSV EXPORT
write.csv(data, "cleaned_data.csv", row.names = FALSE)

cat("\n✅ Cleaned dataset exported as 'cleaned_data.csv'.\n")

############################################################
# END OF SCRIPT
############################################################
