# ---------------Load Libraries---------------
library(ggplot2)

# ---------------Reading Data---------------
data <- read.csv("Data/diabetic_data.csv")

# ---------------Preparing Data---------------
colnames(data)[c(1, 2, 6:12)] # columns that are being removed
data <- data[-c(1, 2, 6:12)]

data[data == "?"] <- NA # Replace ? with NA
str(data) # Show description of data

navals <- is.na(data) # Creates a dataframe (having logical values) for missing data
# Representing TRUE by 1 and FALSE by 0
navals[navals == TRUE] <- 1
navals[navals == FALSE] <- 0

# Taking column-wise sum for all variables
nacount <- data.frame(colSums(navals)[colSums(navals) > 0])
nacount

# Adding variable names as a column
rownames(nacount)
nacount <- cbind.data.frame(nacount, rownames(nacount))
colnames(nacount) <- c("NAcount", "Variables")
nacount

# ---------------Plotting Graphs---------------
p <- ggplot(data = nacount, aes(x = Variables, y = NAcount)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = NAcount), vjust = -0.3, size = 3.5) +
  theme_minimal() +
  coord_flip() +
  labs(title = "Plot of Number of NA in a variable",
  x = "Variable Name", y = "Number of Missing Values")
p

table(data$race)