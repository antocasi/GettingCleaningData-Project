library(dplyr)
library(reshape2)
#We will use the dyplyr and reshape2 library in the following steps of the script
setwd("./UCI HAR Dataset")
#After unzipping the downloaded file into the R working directory a new wd is set to facilitate
#subsequent import of files

test_data <- read.table("./test/X_test.txt", header= FALSE)
train_data <- read.table("./train/X_train.txt", header= FALSE)
act_test <- read.table("./test/y_test.txt", header= FALSE, col.names=c("Activity"))
sub_test <- read.table("./test/subject_test.txt", header= FALSE, col.names=c("Subject"))
act_train <- read.table("./train/y_train.txt", header= FALSE, col.names=c("Activity"))
sub_train <- read.table("./train/subject_train.txt", header= FALSE, col.names=c("Subject"))
features <- read.table("./features.txt", header=FALSE, colClasses= c("NULL", "character"))
# The import of all necessary data is completed after the last step

colnames(test_data) <- make.names(features[,1])
colnames(train_data) <- make.names(features[,1])
# The variable names for the train and test datasets are taken from the features.txt 
# file contained in the original dataset. Names tidied using the make.names fuction

data <- rbind(train_data,test_data)
# Bind together the two datasets
sub_all <- rbind(sub_train, sub_test)
# Bind together the two subject datasets
act_all <- rbind(act_train, act_test)
# Bind together the activity datasets
data_final <- cbind(sub_all, act_all, data)
# Bind everything together

data_final$Activity <- factor(data_final$Activity, labels = c("Walking", "Walking.Upstairs",
                                "Walking.Downstairs", "Sitting", "Standing", "Laying"))
# Re-name the activities with descriptive names
tidy <- data_final[,c(1:8,43:48,83:88,123:128,163:168,203,204,216,217,229,230,242,243,
                       255,256,268:273,347:352,426:431,505,506,518,519,531,532,544,545)]
tidy <- arrange(tidy, Subject, Activity)
# Extract the variables relavite to mean and std for each kind of measurement 
# and rearrange them according to Subject and Activity

melted <- melt(tidy, id.vars=c("Subject", "Activity"))
final <- dcast(melted, Subject + Activity ~ variable, mean)
# Calculating the final tidy dataset with the means of each variable and sorting
# according to Subject and Activity


