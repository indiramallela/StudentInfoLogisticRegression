
library(dplyr)
library(caret)

data <- read.csv("/Users/indiramallela/Dropbox/Northwood/ML/ML course data download weekk1/studentInfo2.csv") # Replace "your_dataset.csv" with the path to your dataset

# Data preprocessing
# Convert categorical variables to factors
data$code_module <- as.factor(data$code_module)
data$code_presentation <- as.factor(data$code_presentation)
data$gender <- as.factor(data$gender)
data$region <- as.factor(data$region)
data$highest_education <- as.factor(data$highest_education)
data$imd_band <- as.factor(data$imd_band)
data$age_band <- as.factor(data$age_band)
data$num_of_prev_attempts <- as.factor(data$num_of_prev_attempts)
data$disability <- as.factor(data$disability)
data$final_result <- as.factor(data$final_result)

# Split the data into training and testing sets (80% training, 20% testing)
set.seed(123) # For reproducibility
train_index <- createDataPartition(data$final_result, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Train the classification model (logistic regression)
model <- train(final_result ~ ., data = train_data, method = "glm", family = "binomial")

# Make predictions on the test data
predictions <- predict(model, newdata = test_data)

# Evaluate the model
confusionMatrix(predictions, test_data$final_result)

summary(model)
print(model)
