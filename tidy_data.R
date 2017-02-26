library(dplyr)

# 1. Merges the training and the test sets to create one data set.

# load measurments
train_x <- scan(file = "train\\X_train.txt", what = numeric())
train_x <- matrix(train_x, ncol = 561, byrow = TRUE)
test_x <- scan(file = "test\\X_test.txt", what = numeric())
test_x <- matrix(test_x, ncol = 561, byrow = TRUE)
measurements <- rbind(train_x, test_x)

# load activities
train_y <- scan(file = "train\\Y_train.txt", what = numeric())
test_y <- scan(file = "test\\Y_test.txt", what = numeric())
activities <- c(train_y, test_y)  #train_y and test_y are vectors

# load subjects
train_subject <- scan(file = "train\\subject_train.txt", what = numeric())
test_subject <- scan(file = "test\\subject_test.txt", what = numeric())
subjects <- c(train_subject, test_subject)  #train_y and test_y are vectors

total <- cbind(measurements, subjects, activities)
total.df <- as.data.frame(total)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

# mean and std are the first 6 columns, column 562 is the activity description
new.df <- total.df %>% select(1:6, subjects, activities)


# 3. Uses descriptive activity names to name the activities in the data set

activityLabels <- read.table(file="activity_labels.txt", header = FALSE, sep = " ", quote = "", col.names = c("activities", "labels"))

merged.df <- merge(x = new.df, y = activityLabels)  # merge will happen by activities columns
merged.df$activities <- NULL # drop activities column as it was only used for merging the two datasets.
str(merged.df)

# 4. Appropriately labels the data set with descriptive variable names.

colnames(merged.df) <- c("tBodyAcc.mean.X", "tBodyAcc.mean.Y", "tBodyAcc.mean.Z", "tBodyAcc.std.X", "tBodyAcc.std.Y", "tBodyAcc.std.Z", "Subject", "Activity")
str(merged.df)

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

average.df <- 
  merged.df %>% 
  group_by(Activity, Subject) %>%
  summarise(
    mean(tBodyAcc.mean.X), 
    mean(tBodyAcc.mean.Y),
    mean(tBodyAcc.mean.Z),
    mean(tBodyAcc.std.X),
    mean(tBodyAcc.std.Y),
    mean(tBodyAcc.std.Z))

head(average.df) # display results