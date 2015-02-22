# Getting & Cleaning Data - Course Project
## How the "run_analysis.R" script works

The script can be executed from your working directory and assumes that you have previously unpacked the dataset to be analysed AS IT IS in your working directory. Hence, the you should have a folder named "UCI HAR Dataset" in it.

The first thing the script does is to load two libraries it will use later one. The libraries are dplyr and reshape2 so be sure to have them already installed on your machine.
Secondly, the script changes your working directory to the "UCI HAR Dataset" folder so that it will be easier to pull out the files to be analysed.

The following code lines are basically needed to import in R all the files that will be then processed later. The command read.table() is used to read the various .txt files. In order the following files are imported: the test dataset, the train dataset, the activity and subject variables for each of the two datasets, the feature list containig all the information on the measured variables.

In the next step the script assigns a descriptive name to all the measured variables taking it from the feature list included in the original dataset.

At this point the script proceeds to bind the different imported datasets: first the train and test measurements, then the two subject groups and then the activity groups. At this point all the three data frames are merged together to create the final data frame containing all the observations (data_final).

The Activity variables are renamed using descriptive names exploiting the factor() funcion and labelling the different levels of the new Activity factor with the corresponding descriptive names obtained from the original dataset.

The next step is the extraction of the required dataset containig only the mean and the standard deviation of each measured parameter. The selection of the different variables is performed using the grep() function the allows to search the column names for a specific string of characters. Using a negative grep() function, the meanFreq variable has been left out since it's not the actual mean of the observation for that specific parameter. The resulting data frame is ordered according to Subject and Activity using the dplyr arrange() function.

At this point the final summarized dataset is created first melting the original tidy dataset according to the Subject and Activity variables and the using the dcast() function to obtain again a wide-format data frame.
