
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