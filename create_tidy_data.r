## install package reshape to create a tidy dataset
install.packages("reshape2")
library(reshape2)

## read the labels and set columnnames
activity_labels <-read.table("activity_labels.txt",col.names=c("activity_id","activity_name"))

## read the features and create a factor string for the feature names
features <- read.table("features.txt")
feature_names <-features[,2]

## read in the testdata and assign the feature names to the columns
testdata<- read.table("X_test.txt")
names(testdata) <- feature_names

## read in the trainingdata and assign the feature names to the columns
traindata<- read.table("X_train.txt")
names(traindata) <- feature_names

## read in the subject_test_ids and label the columnname
subject_test_ids <- read.table("subject_test.txt")
names(subject_test_ids) <- c("subject_id")

## read in the subject_train_ids and label the columnname
subject_train_ids <- read.table("subject_train.txt")
names(subject_train_ids) <- c("subject_id")

## read in activity_test_ids, label columnname and merge on activity name
activity_test_ids <- read.table("y_test.txt")
names(activity_test_ids) <- c("activity_id")
activity_test_idsL <- merge(activity_test_ids,activity_labels)

## read in activity_train_ids,label columnname and merge on activity name
activity_train_ids <- read.table("y_train.txt")
names(activity_train_ids) <- c("activity_id")
activity_train_idsL <- merge(activity_train_ids,activity_labels)

## bind the columns of the test set for subject, activity and the data
testdata_binded <-cbind(activity_test_idsL, subject_test_ids, testdata)

## bind the columns of the train set for subject, activity and the data
traindata_binded <-cbind(activity_train_idsL, subject_train_ids, traindata)

## bind the rows of the train and test set 
data_binded <-rbind(traindata_binded, testdata_binded)

##look up columnnumbers for mean or std without excluding activity and subject since you need them and select them
colnumbers <-grep("activity|subject|mean|std" ,names(data_binded))
data_requiredcolumns <-data_binded[,colnumbers]


## melt to get the value per activity description per subject 
data_melt <- melt(data_requiredcolumns,id=c("activity_id","activity_name","subject_id"))

## create an independent set for means per activity, subject and variable
independent_mean_set <- dcast(data_melt, activity_id + activity_name + subject_id ~ variable,mean)

## write results
write.table(independent_mean_set,row.name = FALSE, "tidy_data.txt")
