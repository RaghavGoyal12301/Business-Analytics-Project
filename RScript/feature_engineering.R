# ------------------------------Feature Engineering------------------------------

# Removing columns with large count of Null values.
data$encounter_id <- NULL
data$weight <- NULL
data$payer_code <- NULL
data$medical_specialty <- NULL
# -----------------------------




# examide & citogilpton have only one value throughout all observations
data$examide <- NULL
data$citogilpton <- NULL
# -----------------------------




# Removing Observations with Null Values
data <- na.omit(data)
# -----------------------------




# Merging similar categories in catagorical variables

# ---------------admission_type
colnames(data)[5] <- "admission_type"
# Replaced (Trauma Center, Urgent) to Emergency and (NULL ,Not Mapped) to Not Available.
data$admission_type <- replace(data$admission_type, data$admission_type == 7, 1)
data$admission_type <- replace(data$admission_type, data$admission_type == 2, 1)
data$admission_type <- replace(data$admission_type, data$admission_type == 6, 5)
data$admission_type <- replace(data$admission_type, data$admission_type == 8, 5)

data$admission_type <- str_replace(data$admission_type, "1", "Emergency")
data$admission_type <- str_replace(data$admission_type, "5", "Other")
data$admission_type <- str_replace(data$admission_type, "3", "Elective")
data$admission_type <- str_replace(data$admission_type, "4", "Newborn")
data$admission_type <- as.factor(data$admission_type) # Converting admission_type back to factor

# ---------------admission_source
colnames(data)[7] <- "admission_source"
#collapsing some other variable and change the name of variables
data$admission_source <- case_when(
    data$admission_source %in% c("1", "2", "3") ~ "Physician Referral",
    data$admission_source %in% c("4", "5", "6", "8", "9", "10", "11", "12", "13", "14", "15", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26") ~ "Other",
    TRUE ~ "Emergency Room"
    )
data$admission_source <- as.factor(data$admission_source)

# ---------------discharge_disposition_id
if (FALSE) {
  "Since the objective is to predict readmissions, those patients 
who died during this hospital admission were excluded. 
Encounters with “Discharge disposition” values of 11, 13, 14, 19, 20, or 21 
are related to death or hospice which mean these patients cannot be readmitted."
}
data <- data[!data$discharge_disposition_id %in% c(11, 13, 14, 19, 20, 21),]
colnames(data)[6] <- "discharge_disposition"
data$discharge_disposition <- case_when(data$discharge_disposition %in% "1" ~ "Home", TRUE ~ "Other")
data$discharge_disposition <- as.factor(data$discharge_disposition)

# ---------------diag_1
if (FALSE) {
  "The 'diag_1' contained three diagnoses for a given patient (primary, secondary and additional).
  However, each of these had 700-900 unique ICD codes and it is extremely difficult to include them
  in the model and interpret them meaningfully. Therefore, these diagnosis codes were collapsed 
  into 9 disease categories, which include Circulatory, Respiratory, Digestive, Diabetes, Injury,
  Musculoskeletal, Genitourinary, Neoplasms, and Others"
}
data$diag_1 <- as.character(data$diag_1)
data <- mutate(data, primary_diagnosis =
            case_when(
                str_detect(diag_1, "V") | str_detect(diag_1, "E") ~ "Other", # disease codes starting with V or E are in “other” category;
                str_detect(diag_1, "250") ~ "Diabetes",
                (as.integer(diag_1) >= 390 & as.integer(diag_1) <= 459) | as.integer(diag_1) == 785 ~ "Circulatory",
                (as.integer(diag_1) >= 460 & as.integer(diag_1) <= 519) | as.integer(diag_1) == 786 ~ "Respiratory",
                (as.integer(diag_1) >= 520 & as.integer(diag_1) <= 579) | as.integer(diag_1) == 787 ~ "Digestive",
                (as.integer(diag_1) >= 580 & as.integer(diag_1) <= 629) | as.integer(diag_1) == 788 ~ "Genitourinary",
                as.integer(diag_1) >= 140 & as.integer(diag_1) <= 239 ~ "Neoplasms",
                as.integer(diag_1) >= 710 & as.integer(diag_1) <= 739 ~ "Musculoskeletal",
                as.integer(diag_1) >= 800 & as.integer(diag_1) <= 999 ~ "Injury",
                TRUE ~ "Other")
            )
data$primary_diagnosis <- as.factor(data$primary_diagnosis)
data$diag_1 <- NULL

# ---------------diag_2
data$diag_2 <- as.character(data$diag_2)
data <- mutate(data, secondary_diagnosis =
            case_when(
                str_detect(diag_2, "V") | str_detect(diag_2, "E") ~ "Other", # disease codes starting with V or E are in “other” category;
                str_detect(diag_2, "250") ~ "Diabetes",
                (as.integer(diag_2) >= 390 & as.integer(diag_2) <= 459) | as.integer(diag_2) == 785 ~ "Circulatory",
                (as.integer(diag_2) >= 460 & as.integer(diag_2) <= 519) | as.integer(diag_2) == 786 ~ "Respiratory",
                (as.integer(diag_2) >= 520 & as.integer(diag_2) <= 579) | as.integer(diag_2) == 787 ~ "Digestive",
                (as.integer(diag_2) >= 580 & as.integer(diag_2) <= 629) | as.integer(diag_2) == 788 ~ "Genitourinary",
                as.integer(diag_2) >= 140 & as.integer(diag_2) <= 239 ~ "Neoplasms",
                as.integer(diag_2) >= 710 & as.integer(diag_2) <= 739 ~ "Musculoskeletal",
                as.integer(diag_2) >= 800 & as.integer(diag_2) <= 999 ~ "Injury",
                TRUE ~ "Other")
            )
data$secondary_diagnosis <- as.factor(data$secondary_diagnosis)
data$diag_2 <- NULL

# ---------------diag_3
data$diag_3 <- as.character(data$diag_3)
data <- mutate(data, tertiary_diagnosis =
            case_when(
                str_detect(diag_3, "V") | str_detect(diag_3, "E") ~ "Other", # disease codes starting with V or E are in “other” category;
                str_detect(diag_3, "250") ~ "Diabetes",
                (as.integer(diag_3) >= 390 & as.integer(diag_3) <= 459) | as.integer(diag_3) == 785 ~ "Circulatory",
                (as.integer(diag_3) >= 460 & as.integer(diag_3) <= 519) | as.integer(diag_3) == 786 ~ "Respiratory",
                (as.integer(diag_3) >= 520 & as.integer(diag_3) <= 579) | as.integer(diag_3) == 787 ~ "Digestive",
                (as.integer(diag_3) >= 580 & as.integer(diag_3) <= 629) | as.integer(diag_3) == 788 ~ "Genitourinary",
                as.integer(diag_3) >= 140 & as.integer(diag_3) <= 239 ~ "Neoplasms",
                as.integer(diag_3) >= 710 & as.integer(diag_3) <= 739 ~ "Musculoskeletal",
                as.integer(diag_3) >= 800 & as.integer(diag_3) <= 999 ~ "Injury",
                TRUE ~ "Other")
            )
data$tertiary_diagnosis <- as.factor(data$tertiary_diagnosis)
data$diag_3 <- NULL

# ---------------age
#regroup the "age" to [0-40],[40-50],[50-60],[60-70],[70-80],[80-100]
data$age <- case_when(data$age %in% c("[0-10)", "[10-20)", "[20-30)", "[30-40)") ~ "[0-40]",
                       data$age %in% c("[80-90)", "[90-100)") ~ "[80-100]",
                       data$age %in% "[40-50)" ~ "[40-50]",
                       data$age %in% "[50-60)" ~ "[50-60]",
                       data$age %in% "[60-70)" ~ "[60-70]",
                       TRUE ~ "[70-80]")
data$age <- as.factor(data$age)

# ---------------readmitted
#categorize "readmitted" to 1 --patient was readmitted within 30 days, 0-- readmission after 30 days and no readmission
data$readmitted <- case_when(data$readmitted %in% c(">30", "NO") ~ "0", TRUE ~ "1")
data$readmitted <- as.factor(data$readmitted)

# ---------------patient_nbr
# remove patients who had multiple encounters (remove duplicated rows by a column)
data <- data[!duplicated(data$patient_nbr),]
# remove "patient_nbr"
data$patient_nbr <- NULL





# ------------------------------Removing Outliers------------------------------

# par(mfrow = c(2,4))
# boxplot(data$time_in_hospital, main = "time_in_hospital")$out
# boxplot(data$num_lab_procedures, main = "num_lab_procedures")$out
# boxplot(data$num_procedures, main = "num_procedures")$out
# boxplot(data$num_medications, main = "num_medications")$out
# boxplot(data$number_outpatient, main = "number_outpatient")$out
# boxplot(data$number_emergency, main = "number_emergency")$out
# boxplot(data$number_inpatient, main = "number_inpatient")$out
# boxplot(data$number_diagnoses, main = "number_diagnoses")$out

# Removing these columns because all values are in outlier range.
data$number_emergency <- NULL
data$number_inpatient <- NULL
data$number_outpatient <- NULL

# (IQR= Q3 – Q1, And an outlier would be a point below [Q1- (1.5)IQR] or above [Q3+(1.5)IQR].)
remove_outliers <- function(variable) {
  Q3 <- quantile(data[variable], 0.75, na.rm = TRUE) # Quantile 3
  Q1 <- quantile(data[variable], 0.25, na.rm = TRUE) # Quantile 3
  IQR <- Q3 - Q1 # Inter Quantile Range
  upper <- Q3 + (1.5 * IQR) # Upper Quntile limit
  lower <- Q1 - (1.5 * IQR) # Lower Quntile limit
  data_without_outliers <- data[data[variable] < upper & data[variable] > lower,]
  return(data_without_outliers)
}
for (var in c("time_in_hospital", "num_lab_procedures", "num_procedures", "num_medications", "number_diagnoses")) {
  data <- remove_outliers(var)
}


