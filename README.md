getdata-project
===============
1. Read files X_test,X_train.y_test,y_train,Subject_test,Subject_train,features and activity_lables text files into dataframes.
2. Combines Dataframes y_test and subject_test and add column names Activity and Subject to a new data frame called A
3. Combines Dataframes y_train and subject_train and add column names Activity and Subject to a new data frame B
4. Combines A and B to a new data frame C
5. Merge X_train and X_test data to a new data frame D which has a dim:10299*561
6. Replace column names of D from features.txt
7. In order to  subset data by selecting features containing mean() & std(), we must make the feature names unique to avoid duplicate column names
8. Subset data to satisfy the requirement
9. Combine activity,subject and features(with only the measurements on the mean and standard deviation)
10. Take mean of observations per activity per subject.
11. Replace activity numbers with activity names from activity_lables.txt to create final tidy data table
11. use write.table to get a text file from the above Data Frame
