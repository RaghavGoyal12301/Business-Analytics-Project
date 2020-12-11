data_train <- readRDS(file.path(getwd(), "Assets/data_train.rds"))
predict_data <- data_train[, c("time_in_hospital", "num_procedures", "number_diagnoses", "num_lab_procedures", "num_medications", "primary_diagnosis", "secondary_diagnosis", "tertiary_diagnosis", "age", "insulin", "race", "gender")]

# rf_model <- readRDS(file.path(getwd(), "Assets/rf_model.rds"))

readmission_prediction <- function(input) {

  input_data = data.frame(
            time_in_hospital = input$time_in_hospital,
            num_procedures = input$num_procedures,
            number_diagnoses = input$number_diagnoses,
            num_lab_procedures = input$num_lab_procedures,
            num_medications = input$num_medications,
            primary_diagnosis = input$primary_diagnosis,
            secondary_diagnosis = input$secondary_diagnosis,
            tertiary_diagnosis = input$tertiary_diagnosis,
            age = input$age,
            insulin = input$insulin,
            race = input$race,
            gender = input$gender
        )

  # input_data has character values
  for (col in 1:ncol(input_data)) {
    if (is.numeric(input_data[, col])) {
      input_data[, col] <- as.numeric(input_data[, col])
    }
    else {
      input_data[, col] <- as.factor(input_data[, col]) # converting to factors
    }
  }

  predict_data <- rbind(predict_data, input_data)

  # for (col in 1:ncol(predict_data)) {
  #   if (is.numeric(predict_data[, col])) {
  #     predict_data[, col] <- as.numeric(predict_data[, col])
  #   } else {
  #     predict_data[, col] <- as.factor(predict_data[, col])
  #   }
  # }

  prediction <- predict(rf_model, predict_data[nrow(predict_data),])

  if (prediction == 1) {
    return("Patient will be re-admitted in 30 days.")
  } else {
    return("Patient will not be re-admitted in 30 days.")
  }
}
