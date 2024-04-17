
library(dplyr)
library(caret)

data <- read.csv("/Users/indiramallela/Dropbox/Northwood/ML/ML course data download weekk1/studentInfo2.csv") 
# Data preprocessing - data does not have any missing values in target variable
# Converting categorical variables to factors - here we are converting categorical dimensions to factors so that system can read numbers in no particular order
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

# Splitting the data into training and testing sets (80% training, 20% testing)
set.seed(1234) # For reproducibility
train_index <- createDataPartition(data$final_result, p = 0.8, list = FALSE)
train_data <- data[train_index, ]
test_data <- data[-train_index, ]

# Training the classification model (logistic regression) since there are only two outcomes withdrawn and not withdrawn we use binomial familyy because it is logistic regression
model <- train(final_result ~ ., data = train_data, method = "glm", family = "binomial")

# Makeing predictions on the test data
predictions <- predict(model, newdata = test_data)

# Evaluate the model - evaluating the model using confusion matrix
confusionMatrix(predictions, test_data$final_result)

summary(model)
print(model)
