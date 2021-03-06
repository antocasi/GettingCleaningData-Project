# Code Book

## Dataset description
The tidy dataset generated by the run_analysis.R script derives directly from the UCI Machine Learning repository Human Activity Recognition Using Smartphones Dataset. This original dataset cointains measurements obtained through the accelerometer and the gyroscope of a Samsung Galaxy S II smartphone. 30 different subjects wearing the smartphone were analysed during six different activities (manually annotated) capturing the tri-axial linear and angular velocity mesured by the smartphone sensors. The obtained dataset has been randomly divided in two groups: a train set and a test set.

For more detailed information on the dataset and how data were collected visit: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

## Variables
Subject - this variable, ranging from 1 to 30, indicates to which of the thirty subjects partecipating in the study the following measurements are referred to.

Activity - this label can correspond to six values: Walking, Walking Downstairs, Walking Upstairs, Sitting, Standing, Laying. It describes the activity the subject was performing at the time of the corresponding measurement. 

The following variables can be described more collectively, since they are very well related to each other. The name of the variable contains all the information needed to understand its features:

1) First type of signals: a "t" at the beginning of the name indicates that the signal belongs to the time domain. 
  
  - The first part of the name contains "Body" or "Gravity": this indicates if the signal corresponds to body or gravity acceleration signal.
  - The following part could be "Acc" or "Gyro": this indicates if the signal is coming from the accelerometer or the gyroscope of the smartphone.
  - If the suffix "Jerk" is present it indicates that during the analysis the body linear and angular accelerations have been derived in time to obtain Jerk signals.
  - If the suffix "Mag" is present it indicates that the magnitude of the three-dimensional signals has been calculated during the analysys using the Euclidean norm.
  - After the dot (.) you find indicated if the value you are looking at is the mean (mean) or the mean of the standard deviations (std) of the signals collected during the study or of a quantity calculated from them. These mean values are calculated for each subject and for each different activity, as indicated below.
  - If applicable (that is, the signal has a direction in space), after another dot (.) the direction of space on which the signal has been measured is indicated (X,Y,Z).

2) Second type of signals: an "f" at the beginning of the variable name implies that the signal belongs to the frequency domain.

  - Since these signals have been obtained from some of the previous ones by applying the Fast Fourier Transform (FFT) they follow exactly the same nomenclature system described above.
      
## Data transformations
The original dataset was split in two groups: a train group and a test group. Each of the two datasets (containing the processed measurements coming from the smartphone sensors) is accompanied by two additional data files containing the activity labels for each measurement and the list of subjects performing each of the measurements.
The following transformations have been applied to the orginal datasets:

1) All the datasets have been merged in one big dataset containing both the train and the test measurement, along with the corresponding activity and subject labels.

2) The variable names have been appended to the obtained dataframe.

3) The activity labels, initially indicated as numbers, have been substituted with descriptive names according to the conversion table available in the original dataset.

3) A second data frame containing data only on the mean and the standard deviation of each of the measured variables has been extracted from the merged dataset. This latter dataframe has been ordered according to the Subject and Activity variables. In addition, the variable names have been tidied up to be more descriptive (see Variables section for more information).

4) The final tidy dataset is obtained by calculating the mean of each of the selected variables for each Activity and for each Subject. 
