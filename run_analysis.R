
## setwd("C:/Users/Sanjeev/Documents/getdata-projectfiles-UCI Har Dataset/UCI HAR Dataset")

## Read TEST subject, activity and measurement data
ytest<-read.table("./y_test.txt")
xtest<-read.table("./X_test.txt")
stest<-read.table("./subject_test.txt")

## Combine TEST subject, activity and measurement data together. Activity data
## goes in column 562 and subject data in column 563. Now we have a total of 
## 563 columns
TestData<-xtest
TestData[,562]<-ytest
TestData[,563]<-stest

## Read TRAINING subject, activity and measurement data
ytrain<-read.table("./y_train.txt")
xtrain<-read.table("./X_train.txt")
strain<-read.table("./subject_train.txt")

## Combine TRAINING subject, activity and measurement data together. Activity data
## goes in column 562 and subject data in column 563. Now we have a total of 
## 563 columsn
TrainData<-xtrain
TrainData[,562]<-ytrain
TrainData[,563]<-strain

## append/merge TRAINING and TEST data with TRAINING data placed ahead of TEST data
## TRAINING data occupies the first 7352 rows and the 2947 rows of the TEST data
## starts from row 7353 onwards through row 10299
AllData<-TrainData
AllData[7353:10299,]<-TestData

# AllData[,563]<-paste("Subject no.",AllData[,563])
# AllData[,563]<-as.factor(AllData[,563])

# Read activity labels from the supplied file and apply those labels to the
# activity data as factors.Activity data is in column 562
ActivityLabels<-read.table("./activity_labels.txt")
mylabels<-paste(ActivityLabels[,2])
# AllData[,562]<-factor(AllData[,562],labels=c(mylabels))
AllData[,562]<-factor(AllData[,562],labels=c(mylabels))

# I loaded the features.txt file that was given for the assignment into Excel 
# and there I did global find and replace to clean out the column names and also
# to figure out which columns had "mean" and "std" in their names and were to
# be extracted from the supplied data. Then I cut and paste both the column numers to be extracted
# as well as their cleaned up names from Excel into R.
ColumnNumbersNeeded<-matrix(nrow=88,ncol=1)
ColumnNumbersNeeded<-rbind(1,
2,
3,
4,
5,
6,
41,
42,
43,
44,
45,
46,
81,
82,
83,
84,
85,
86,
121,
122,
123,
124,
125,
126,
161,
162,
163,
164,
165,
166,
201,
202,
214,
215,
227,
228,
240,
241,
253,
254,
266,
267,
268,
269,
270,
271,
294,
295,
296,
345,
346,
347,
348,
349,
350,
373,
374,
375,
424,
425,
426,
427,
428,
429,
452,
453,
454,
503,
504,
513,
516,
517,
526,
529,
530,
539,
542,
543,
552,
555,
556,
557,
558,
559,
560,
561,
562,
563
)

## Extract the relevant 86 columns for Mean and Standard deviation along with two
## columns for activity and subject data for a total of 88 columns from the entire
## 563 columns of the dataset
ExtractedData<-AllData[,ColumnNumbersNeeded[,1]]
ExtractedData[,87]<-factor(ExtractedData[,87],labels=c(mylabels))


## Bring in Column names to be assigned to the extracted data cutting
## and pasting from Excel
ColumnNames<-c("TimeBodyAccMeanXaxis",
"TimeBodyAccMeanYaxis",
"TimeBodyAccMeanZaxis",
"TimeBodyAccStdDevXaxis",
"TimeBodyAccStdDevYaxis",
"TimeBodyAccStdDevZaxis",
"TimeGravityAccMeanXaxis",
"TimeGravityAccMeanYaxis",
"TimeGravityAccMeanZaxis",
"TimeGravityAccStdDevXaxis",
"TimeGravityAccStdDevYaxis",
"TimeGravityAccStdDevZaxis",
"TimeBodyAccJerkMeanXaxis",
"TimeBodyAccJerkMeanYaxis",
"TimeBodyAccJerkMeanZaxis",
"TimeBodyAccJerkStdDevXaxis",
"TimeBodyAccJerkStdDevYaxis",
"TimeBodyAccJerkStdDevZaxis",
"TimeBodyGyroMeanXaxis",
"TimeBodyGyroMeanYaxis",
"TimeBodyGyroMeanZaxis",
"TimeBodyGyroStdDevXaxis",
"TimeBodyGyroStdDevYaxis",
"TimeBodyGyroStdDevZaxis",
"TimeBodyGyroJerkMeanXaxis",
"TimeBodyGyroJerkMeanYaxis",
"TimeBodyGyroJerkMeanZaxis",
"TimeBodyGyroJerkStdDevXaxis",
"TimeBodyGyroJerkStdDevYaxis",
"TimeBodyGyroJerkStdDevZaxis",
"TimeBodyAccMagMean",
"TimeBodyAccMagStdDev",
"TimeGravityAccMagMean",
"TimeGravityAccMagStdDev",
"TimeBodyAccJerkMagMean",
"TimeBodyAccJerkMagStdDev",
"TimeBodyGyroMagMean",
"TimeBodyGyroMagStdDev",
"TimeBodyGyroJerkMagMean",
"TimeBodyGyroJerkMagStdDev",
"FreqBodyAccMeanXaxis",
"FreqBodyAccMeanYaxis",
"FreqBodyAccMeanZaxis",
"FreqBodyAccStdDevXaxis",
"FreqBodyAccStdDevYaxis",
"FreqBodyAccStdDevZaxis",
"FreqBodyAccMeanFreqXaxis",
"FreqBodyAccMeanFreqYaxis",
"FreqBodyAccMeanFreqZaxis",
"FreqBodyAccJerkMeanXaxis",
"FreqBodyAccJerkMeanYaxis",
"FreqBodyAccJerkMeanZaxis",
"FreqBodyAccJerkStdDevXaxis",
"FreqBodyAccJerkStdDevYaxis",
"FreqBodyAccJerkStdDevZaxis",
"FreqBodyAccJerkMeanFreqXaxis",
"FreqBodyAccJerkMeanFreqYaxis",
"FreqBodyAccJerkMeanFreqZaxis",
"FreqBodyGyroMeanXaxis",
"FreqBodyGyroMeanYaxis",
"FreqBodyGyroMeanZaxis",
"FreqBodyGyroStdDevXaxis",
"FreqBodyGyroStdDevYaxis",
"FreqBodyGyroStdDevZaxis",
"FreqBodyGyroMeanFreqXaxis",
"FreqBodyGyroMeanFreqYaxis",
"FreqBodyGyroMeanFreqZaxis",
"FreqBodyAccMagMean",
"FreqBodyAccMagStdDev",
"FreqBodyAccMagMeanFreq",
"FreqBodyBodyAccJerkMagMean",
"FreqBodyBodyAccJerkMagStdDev",
"FreqBodyBodyAccJerkMagMeanFreq",
"FreqBodyBodyGyroMagMean",
"FreqBodyBodyGyroMagStdDev",
"FreqBodyBodyGyroMagMeanFreq",
"FreqBodyBodyGyroJerkMagMean",
"FreqBodyBodyGyroJerkMagStdDev",
"FreqBodyBodyGyroJerkMagMeanFreq",
"AngularVelTimeBodyAccMeanGravity",
"AngularVelTimeBodyAccJerkMeanGravityMean",
"AngularVelTimeBodyGyroMeanGravityMean",
"AngularVelTimeBodyGyroJerkMeanGravityMean",
"AngularVelXGravityMean",
"AngularVelYGravityMean",
"AngularVelZGravityMean",
"Activity",
"Subject")

# Now apply these column names to the extracted data set

colnames(ExtractedData)<-ColumnNames

## Sort the extracted data by subject and then activity

library(dplyr)
edtbl<-tbl_df(ExtractedData)
sortedtbl<-arrange(edtbl,Subject,Activity)

## now build an index list to establish the indices over which 'mean' will be used
## The dataset has been sorted by Subject and then Activity
## The 'tracker' matrix contains the indices where Activity changes by Subject and
## indicates which indices of the data the mean has to be computed for
j<-1
tracker<-matrix(nrow=180,ncol=1)
for (i in 2:10299){
    if (sortedtbl[[i,87]] != sortedtbl[[i-1,87]]) {
    tracker[j]<-i-1
    j=j+1
    }
}
# last index will be forced since "if" statement will not be TRUE
tracker[180]<-10299

## Create the table for final output. THe first column indicates subject 
## and activity so create that first, then use a loop to go over the 86
## columns of measurements that the mean has to be computed and stored for
## k,l and m are intermediary tracking/indexing variables

outputdata<-matrix(nrow=180,ncol=87)
l<-1

for (i in 1:180){
    ## get activity type under consideration
    var<-as.numeric(sortedtbl[tracker[[i,1]],87])  

    ## creates the first column with activity and subject
    outputdata[[i,1]]<-paste("Subject ",sortedtbl[tracker[[i,1]],88],"  ",mylabels[var])  
	## lookup the "tracker" for the indices to be used, assign them to temporary vars and
	## compute the mean for the indices and store them in the outputdata table
    m<-tracker[[i,1]]
    temp2<-vector()
    for (k in 1:86){
      temp2<-sortedtbl[l:m,k]
      outputdata[i,k+1]<-sapply(temp2,mean)
    }
    l<-tracker[[i,1]]+1
  }

## Assign column names to output data and write the file to disk
tempname<-c("Subject and Activity",ColumnNames)
outnames<-tempname[-c(88,89)]
colnames(outputdata)<-outnames
write.table(outputdata,file="./output.txt",row.names=FALSE)
