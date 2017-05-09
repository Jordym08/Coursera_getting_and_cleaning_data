# Coursera_getting_and_cleaning_data
This repository has been created for an Coursera assignment.

# Synopsis
The goal of the assignment is to create a tidy dataset for data collected from the accelerometers from the Samsung Galaxy S smartphone.

# Original dataset
- 'features.txt': List of all features.

- 'activity_labels.txt': List of class labels and their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'train/subject_train.txt': ID's of subjects in the training data

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'test/subject_test.txt': ID's of subjects in the training data

# Script
The create_tidy_data script operates as following:
1. Reads the different data from the original dataset
2. Adds names to the columns
3. Colbinds the activity ids, subject ids and the data collected from the accelerometers
4. Rowbinds the training and test set to form a complete dataset
5. Selects only the means and standard deviation values 
6. Melts and reshape the data to get the means per activity, subject and action for the data collected 


