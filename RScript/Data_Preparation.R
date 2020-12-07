# ---------------Load Libraries---------------
library(plyr)

# ---------------Reading Data---------------
data <- read.csv("Data/diabetic_data.csv")

# ---------------Preparing Data---------------
data[data == "?" | data == "Unknown/Invalid"] <- NA         # Replace ? with NA
data[] <- lapply(data, factor)  # change chr to factor(for categorial data)
# str(data)                       # Show description of factor_data
# summary(data)

# ---------------Finding Null Values---------------
NA_Count <- ldply(data, function(c) sum(is.na(c)))    # function to count NA values in each Column
names(NA_Count) <- c("Column_Name","NACount")         # Giving names to the NA_Count

NA_Not0 <- subset(NA_Count,NA_Count$NACount>0)        # DataFrame where count(NA) > 0

# Removing columns with large count of Null values.
data$encounter_id <- NULL
data$weight <- NULL
data$payer_code <- NULL
data$medical_specialty <- NULL

# ------DOUBT
#delete columns "diag_2", "diag_3", only use the primary diagnosis(diag_1)
# data$daig_2 < NULL
# data$daig_3 < NULL

# examide & citogilpton have only one value throughout all observations
data$examide <- NULL
data$citogilpton <- NULL

# ---------------Removing Observations with Null Values---------------
new_data <- na.omit(data)
write.csv(new_data,"Data/diabetes_data_new.csv")

summary(new_data)

# ---------------EXTRAS---------------
# ------------------------------------
# Link - https://rb.gy/kndoo6

# bar_na <- barplot(
#   NA_Not0$NACount,
#   names.arg = NA_Not0$Column_Name,
#   xlab = "Column_Name --->",
#   ylab = "NA_Count --->",
#   ylim = c(0,110000),                       # Set y-axis length
#   col = rainbow(length(NA_Not0$Column_Name)),
#   density = 50,
#   border = "black",
#   main = "NA Count of Columns > 0",
#   cex.names = 0.8
# )
# text(x = bar_na, y = NA_Not0$NACount, label = NA_Not0$NACount, pos = 3, cex=0.8)   # to set Text(data) at the top of each bar
# legend(
#   "topright", NA_Not0$Column_Name, fill=rainbow(length(NA_Not0$Column_Name)), cex = 0.8
# )

# ---------------Handling Null Values---------------

# Getting Percentage of NULL Values for each column
# nObs <- nrow(data)                            # Getting NO.of Observations
# per <- function(x){ (x*100)/nObs}
# NA_per <- as.vector(lapply(NA_Not0[2],per))   
# NA_Not0["NA_Per"] <- NA_per
# NA_Not0