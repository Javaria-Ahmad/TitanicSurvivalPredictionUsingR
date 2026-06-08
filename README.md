\# R Machine Learning Techniques for Prediction of Titanic Survivors



Author:



Javaria Ahmad



Ph.D. in Computer Science (Data Science and Security)







\---



\## Goal and Background



The goal of the project is to predict the survival of Titanic passengers given their demographic data.  





The project uses R and multiple supervised machine learning techniques for the prediction. These techniques are evaluated and the best model makes survival predictions on the unseen data.



\---



\## Data Information



Source: Kaggle Titanic Dataset



Files:

* train.csv: used to train and evaluate the models. It contains the demographic features and survival data.
* test.csv: used to perform predictions. It contains the features only but not the survival data.



\---



\## ML Models



Evaluation is performed using these classification models:



* Logistic Regression (LR)
* Decision tree
* K-Nearest Neighbors (KNN)



\---



\## Approach



* Preparation:

&#x20;  - Load train data

&#x20;  - Select features that will be helpful in prediction including sex and age

&#x20;  - Replace any missing values with mean values

&#x20;  - Split data into train and validate 

&#x20;  - Load test data and replace missing values with mean values



* Training and Evaluation

&#x20;  - Train the three models on the train split followed by evaluation on the validation split focusing on:

&#x20;    - Accuracy

&#x20;    - Kappa value



* Prediction

&#x20;  - KNN shows the best performance and used for prediction on survival using the test dataset

&#x20;  - Predictions are exported as submission.csv file and has the fields for PassengerId and Survived.



\---



\## Technologies

* R
* RStudio
* caret
* tree
* Machine Learning
* Binary Classification



\---



\## Files Included

* titanic\_survivor\_predict.R containing the R code for the above approach
* train.csv
* test.csv
* submission.csv

































































