# Getting_and_cleaning_data-CourseProject

The repo currently contains the following scripts:

* run_analysis.R

## The scripts are described briefly in the following section

### run_analysis.R
This script is an R script, which loads activity data from the accelerometers from the Samsung Galaxy S smartphone. The data is stored in different files. There is a data set with training data, one with test data and there are files with label information. The script loads the data from the relevant files, transforms it in certain ways and produces two output files. To make the script better understandable it has been divided into the sections
* Global settings
* Common data
* Training data
* Test data
* Combined training and test data
* Column means of data grouped by subject and activity
* Create output files

In section "Global settings" libraries needed to execute the script arevloaded and the working directory is set. Please make sure that the working directory is set properly in a different environment.
In section "Common data" activity labels and column names are loaded and transformed, where necessary.
In section "Training data" the different files with training data are loaded and combined. Proper column names are assigned.
In section "Test data" the different files with test data are loaded and combined. Proper column names are assigned. The steps for Test and Training data are the same.
In section "Combined training and test data" the test and training data are combined. From the combined table only activity data columns, which contain means or standard deviations are kept. This is done by taking only those columns, where the column name contains the characters "mean", "Mean, or "std". The columns Subject (no. 2) and ActivityLabel (no. 564) are selected manually. This results in a table called "selectedColumns".
In section "Column means of data grouped by subject and activity" another table ("GroupedColMeans") is created by grouping the result of section "Combined training and test data" by Subject and ActivityLabel. Then the mean is calculated for every variable for each Subject-ActivityLabel group.
In section "Create output files" the result of section "Column means of data grouped by subject and activity" ("GroupedColMeans") is stored in txt files.
 


