Arquives for Getting and Cleaning Data - Johns Hopkins - September 2015

All files should be on the "UCI HAR Dataset" avaiable on the working directory.

The "R" code is supposed to load 6 files:

- X_train
- X_test
- Y_train
- Y_test
- Subject_train
- Subject_test

Each file is loaded into a Data Frame with the same name.

Two auxiliar files are also loaded:

- activity_labels
- features

Some variables are renamed:

- Y_train and Y_test from "V1" to "Y"
- Subject_train and Subject_test from "V1" to subject

Bind all variables on:

- Train Data Frame
- Test Data Frame

Include an informative column - indicating the data origin - test or train

Bind all variables on "Total" - data frame - containing test and train data

Create column "activity" - indicating what activity was practiced by the subject

Create summary of data - by subject and by activity

Rename colnames to match "features"

Write a file as answer

