# Logistic Regression Using Student Info Data

Author: Your Name

Date: April 4, 2024

## Introduction

This document presents a code implementation for logistic regression using the Student Info data. The goal is to classify the final result of the students into either "withdrawn" or "not-withdrawn" using two different R packages: "dplyr" and "caret".

## Code Explanation

The code follows a step-by-step approach to load, preprocess, train logistic regression models, make predictions, and evaluate the performance of the models.

### Load Required Packages

The necessary packages, "dplyr" and "caret", are loaded using the `library()` function. These packages provide functions and utilities for data manipulation, model training, and evaluation.

### Load and Preprocess the Data

The Student Info data is loaded into the `data` variable using the `read.csv()` function. The data is then preprocessed to handle missing values and convert categorical variables to factors.

Missing values are removed using the `na.omit()` function. Categorical variables such as `code_module`, `code_presentation`, `gender`, `region`, `highest_education`, `imd_band`, `age_band`, `num_of_prev_attempts`, and `disability` are converted to factors using the `as.factor()` function.

A new factor variable, `final_result`, is created based on the original `final_result` variable. The original data has four outcomes, but we are interested in classifying into only two outcomes, "withdrawn" and "not-withdrawn". The `ifelse()` function is used to assign the values "Withdrawn" or "Not_withdrawn" to the new variable. Finally, `final_result` is converted to a factor.

### Split the Data into Training and Testing Sets

The data is split into training and testing sets to facilitate model training and evaluation. The `createDataPartition()` function from the "caret" package is used to create a data partition. The `train_index` variable stores the indices of the training data, and the remaining data is assigned to the `test_data` variable.

### Train the Logistic Regression Model using dplyr

A logistic regression model is trained using the `glm()` function from the "stats" package. The formula `final_result ~ .` specifies that `final_result` is the target variable, and all other variables in the dataset are used as predictors. The `family` parameter is set to "binomial" to perform logistic regression.

### Train the Logistic Regression Model using caret

Another logistic regression model is trained using the `train()` function from the "caret" package. The formula and data parameters are similar to the previous model. The `method` parameter is set to "glm" to specify logistic regression.

### Make Predictions on the Test Data

Predictions are made on the test data using the trained models. The `predict()` function is used, specifying the trained model and the new data (`test_data`). For the model trained with dplyr, the `type` parameter is set to "response" to obtain probability predictions.

### Evaluate the Models

The performance of the models is evaluated using confusion matrices and accuracy. Confusion matrices are calculated using the `table()` function, comparing the predicted values with the actual `final_result` values in the test data. Accuracy is calculated as the ratio of correctly classified instances to the total number of instances.

The confusion matrix and accuracy are displayed for both the dplyr-trained model and the caret-trained model.

## Conclusion

In this analysis, we utilized logistic regression to classify the final result of the students in the Student Info data into either "withdrawn" or "not-withdrawn". Two different R packages, "dplyr" and "caret", were employed for data manipulation, model training, and evaluation.

Both models achieved good accuracies in classifying the final result, indicating their potential for predicting student withdrawal. Further analysis and tuning can be performed to improve the models and explore additional predictive factors.
