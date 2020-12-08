source("RScript/load_libraries.R")

# ------------------------------Reading Data------------------------------
data <- read.csv("Data/diabetic_data.csv")




# ------------------------------Preparing Data------------------------------
data[data == "?" | data == "Unknown/Invalid"] <- NA # Replace ? and Unknown/Invalid with NA
# data[] <- lapply(data, factor)        # change chr to factor(for categorial data)
# str(data)                             # Show description of factor_data
# summary(data)




# # ------------------------------Counting NA Values------------------------------
# NA_Count <- ldply(data, function(c) sum(is.na(c)))      # function to count NA values in each Column
# names(NA_Count) <- c("Column_Name", "NACount")          # Giving names to the NA_Count

# NA_Not0 <- subset(NA_Count, NA_Count$NACount > 0)       # DataFrame where count(NA) > 0


source("RScript/feature_engineering.R")


write.csv(data, "Data/diabetes_data_new.csv")