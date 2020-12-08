# ------------------------------Importing Libraries------------------------------
library(randomForest)



# ------------------------------Reading Prepared Data------------------------------
data <- read.csv("Data/diabetes_data_new.csv")



# ------------------------------Dividing Data for Training & Testing------------------------------
# Split the Dataset into Training Data and Test Data.
# Use set.seed(100) as a seed and split the dataset into training and test set with 80:20 proportion, respectively.
set.seed(2)
id <- sample(2, nrow(data), replace = T, prob = c(0.8, 0.2))
data_train <- data[id==1,]
data_test <- data[id==2,]



# ------------------------------Training Model------------------------------
data_train$readmitted <- as.factor(data_train$readmitted)
# rf_model <- randomForest(readmitted~. , data=data_train)
# rf_model
# rf_model$importance

# library(caret)
# trCntl <- trainControl(method = "CV",number = 10)
# RFMod_CV <- train(readmitted ~ . , data = data_train, trControl = trCntl, method = "rf") 
# RF_pred_CV <- predict(RFMod_CV, data_test)
# confusionMatrix(RF_pred_CV, data_test$readmitted)